package org.arp.arp_2012.utils;

import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;

public class RequestUtils {

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

	public static final String email(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, EMAIL, false);
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

	public static final String optional(final HttpServletRequest request,
			final String paramName, final Pattern regex) {
		return param(request, paramName, regex, true, paramName);
	}

	public static final String optional(final HttpServletRequest request,
			final String paramName, final Pattern regex, final String messageKey) {
		return param(request, paramName, regex, true, messageKey);
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

		final Map<String, String> validationErrors = errors(request);
		if (param == null) {
			if (optional) {
				return null;
			}
		} else if (regex.matcher(param).matches()) {
			return param;
		}

		final String errorMessage = messages.containsKey(messageKey) ? messages
				.get(messageKey).toString() : String.format(
				"Please enter a valid value for %s", paramName);
		validationErrors.put(paramName, errorMessage);
		return null;
	}

	public static final String json(final Object obj) {
		final ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(obj);
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}

	private RequestUtils() {
	}
}
