package org.arp.arp_2012.utils;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.arp.arp_2012.Registration;
import org.codehaus.jackson.map.ObjectMapper;

public class RequestUtils {

	private static final String SESSION_KEY_REGISTRATION = "registration";
	private static final String SUCCESS_URL = "SUCCESS_URL";
	public static final String VALIDATION_ERRORS = "validation_errors";
	private static Properties messages = new Properties();

	public static Pattern DATE = Pattern.compile("\\d{2}\\/\\d{2}\\/\\d{4}");
	public static Pattern EMAIL = Pattern.compile(
			"\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b",
			Pattern.CASE_INSENSITIVE);

	static {
		try {
			messages.load(RequestUtils.class
					.getResourceAsStream("messages.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static final String date(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, DATE, false);
	}

	public static final String date(final HttpServletRequest request,
			final String paramName, final String paramValue) {
		return param(request, paramName, paramValue, DATE, false, paramName);
	}

	public static final String email(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, EMAIL, false);
	}

	public static final String string(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, null, false);
	}

	public static final String email(final HttpServletRequest request,
			final String paramName, final String paramValue) {
		return param(request, paramName, paramValue, EMAIL, false, paramName);
	}

	public static final String string(final HttpServletRequest request,
			final String paramName, final String paramValue) {
		return param(request, paramName, paramValue, null, false, paramName);
	}

	@SuppressWarnings("rawtypes")
	public static final <T extends Enum<T>> T enuM(
			final HttpServletRequest request, final String paramName,
			final String paramValue, final Class<T> klass) {
		final StringBuilder regex = new StringBuilder();
		for (final Enum enuM : klass.getEnumConstants()) {
			if (regex.length() > 0) {
				regex.append("|");
			}
			regex.append(enuM.name());
		}
		String value = param(request, paramName, paramValue,
				Pattern.compile(regex.toString()), false, paramName);
		if (value != null) {
			return Enum.valueOf(klass, paramValue);
		} else {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public static Map<String, String> errors(final HttpServletRequest request) {
		if (request.getAttribute(VALIDATION_ERRORS) == null) {
			request.setAttribute(VALIDATION_ERRORS,
					new TreeMap<String, String>());
		}
		final Map<String, String> validationErrors = (Map<String, String>) request
				.getAttribute(VALIDATION_ERRORS);
		return validationErrors;
	}

	public static final String json(final Object obj) {
		final ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(obj);
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static final String optional(final HttpServletRequest request,
			final String paramName, final Pattern regex) {
		return param(request, paramName, regex, true, paramName);
	}

	public static final String optional(final HttpServletRequest request,
			final String paramName, final Pattern regex, final String messageKey) {
		return param(request, paramName, regex, true, messageKey);
	}

	public static final String optional(final HttpServletRequest request,
			final String paramName, final String paramValue) {
		return param(request, paramName, paramValue, DATE, false, paramName);
	}

	public static final String optional(final HttpServletRequest request,
			final String paramName, final String paramValue, final String regex) {
		return param(request, paramName, paramValue, Pattern.compile(regex),
				false, paramName);
	}

	public static final String optionalDate(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, DATE, true);
	}

	public static final String optionalEmail(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, EMAIL, true);
	}

	public static final String param(final HttpServletRequest request,
			final String paramName, final Pattern regex, final boolean optional) {
		return param(request, paramName, regex, optional, paramName);
	}

	public static final String param(final HttpServletRequest request,
			final String paramName, final Pattern regex,
			final boolean optional, final String messageKey) {
		if (StringUtils.isBlank(paramName)) {
			return null;
		}
		final String param = StringUtils.trimToNull(request
				.getParameter(paramName));

		return param(request, paramName, param, regex, optional, messageKey);
	}

	public static final String param(final HttpServletRequest request,
			final String paramName, final String regex, final boolean optional,
			final String messageKey) {
		return param(request, paramName, Pattern.compile(regex), optional,
				messageKey);
	}

	public static String param(final HttpServletRequest request,
			final String paramName, String paramValue,
			final Pattern regex, final boolean optional, final String messageKey) {
		final Map<String, String> validationErrors = errors(request);
		if (StringUtils.isBlank(paramValue)) {
			if (optional) {
				return null;
			}
		} else if (regex == null && !optional) {
			return paramValue;
		} else if (regex != null && regex.matcher(paramValue).matches()) {
			return paramValue;
		}

		final String errorMessage = messages.containsKey(messageKey) ? messages
				.get(messageKey).toString() : String.format(
				"Please enter a valid value for %s", paramName);
		validationErrors.put(paramName, errorMessage);
		return null;
	}

	public static final void succeed(final HttpServletRequest request,
			final HttpServletResponse response) {
		try {
			request.getRequestDispatcher(successUrl(request)).forward(request,
					response);
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public static String successUrl(final HttpServletRequest request) {
		final String url = (String) request.getSession().getAttribute(
				SUCCESS_URL);
		if (StringUtils.isBlank(url)) {
			return "/index.jsp";
		} else {
			return url;
		}
	}

	public static final String successUrl(final HttpServletRequest request,
			final String url) {
		request.getSession().setAttribute(SUCCESS_URL, url);
		return successUrl(request);
	}

	public static final Registration registration(HttpServletRequest request) {
		return (Registration) request.getSession().getAttribute(
				SESSION_KEY_REGISTRATION);
	}

	public static final Registration registration(
			final HttpServletRequest request, final Registration registration) {
		request.getSession().setAttribute(SESSION_KEY_REGISTRATION,
				registration);
		return registration(request);
	}

	public static final Registration newRegistration(
			final HttpServletRequest request) {
		registration(request, new Registration());
		return registration(request);
	}

	private RequestUtils() {
	}
}
