package org.arp.arp_2012.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.lang.StringUtils;
import org.arp.arp_2012.Registration;
import org.codehaus.jackson.map.ObjectMapper;

import com.amazonaws.AmazonClientException;
import com.amazonaws.services.s3.model.S3Object;

public class RequestUtils {

	private static final String REGISTRATION_KEY = "registration";
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

	public static final String email(final HttpServletRequest request,
			final String paramName, final String paramValue) {
		return param(request, paramName, paramValue, EMAIL, false, paramName);
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

	public static final <T> T fromXML(final Class<T> klass, final InputStream is) {
		try {
			final JAXBContext context = JAXBContext.newInstance(klass);
			Unmarshaller m = context.createUnmarshaller();
			final Object obj = m.unmarshal(is);
			return klass.cast(obj);
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static final Registration getRegistration(final String email,
			final int yearOfBirth) {
		final S3Client client = new S3Client();
		try {
			final S3Object xmlObject = client.findFile(generateXMLFileName(
					email, yearOfBirth));
			final InputStream is = xmlObject.getObjectContent();
			try {
				return fromXML(Registration.class, is);
			} finally {
				is.close();
			}

		} catch (final AmazonClientException e) {
			// Probably a object not found exception
			return null;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static boolean hasPhysicalFitnessForm(final Registration registration) {
		if (!StringUtils.isBlank(registration.getPhysicalFitnessForm())
				&& !StringUtils.isBlank(registration.getDateOfBirth())) {
			// Check if the physical fitness form is already with us
			final String pdfFileName = generatePDFFileName(
					registration.getEmailAddress(),
					registration.getYearOfBirth());
			return new S3Client().doesFileExist(pdfFileName);
		}
		return false;
	}

	public static final String json(final Object obj) {
		final ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(obj);
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static final Registration newRegistration(
			final HttpServletRequest request) {
		registration(request, new Registration());
		return registration(request);
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
			final String paramName, String paramValue, final Pattern regex,
			final boolean optional, final String messageKey) {
		if (StringUtils.isBlank(paramValue)) {
			if (optional) {
				return null;
			}
		} else if (regex == null && !optional) {
			return paramValue;
		} else if (regex != null && regex.matcher(paramValue).matches()) {
			return paramValue;
		}

		error(request, paramName, messageKey);
		return null;
	}

	public static void error(final HttpServletRequest request,
			final String paramName, final String messageKey) {
		final Map<String, String> validationErrors = errors(request);
		final String errorMessage = messages.containsKey(messageKey) ? messages
				.get(messageKey).toString() : String.format(
				"Please enter a valid value for %s", paramName);
		validationErrors.put(paramName, errorMessage);
	}

	public static final Registration registration(HttpServletRequest request) {
		return (Registration) request.getAttribute(REGISTRATION_KEY);
	}

	public static final Registration registration(
			final HttpServletRequest request, final Registration registration) {
		request.setAttribute(REGISTRATION_KEY, registration);
		return registration(request);
	}

	public static final Registration saveRegistration(
			final Registration registration, final byte[] physicalFitnessForm) {
		final S3Client client = new S3Client();
		if (physicalFitnessForm != null) {
			// Save the physical fitness form to Amazon S3
			final String pdfFileName = generatePDFFileName(
					registration.getEmailAddress(),
					registration.getYearOfBirth());
			client.saveFile(pdfFileName, physicalFitnessForm);
			registration.setPhysicalFitnessForm(pdfFileName);
		}

		final String xmlFileName = generateXMLFileName(
				registration.getEmailAddress(), registration.getYearOfBirth());

		// Now save the XML file to amazon
		final String xml = RequestUtils.xml(registration);
		client.saveFile(xmlFileName, xml.getBytes());

		return registration;
	}

	public static final String string(final HttpServletRequest request,
			final String paramName) {
		return param(request, paramName, null, false);
	}

	public static final String string(final HttpServletRequest request,
			final String paramName, final String paramValue) {
		return param(request, paramName, paramValue, null, false, paramName);
	}

	public static final String xml(final Object obj) {
		try {
			final JAXBContext context = JAXBContext.newInstance(obj.getClass());
			Marshaller m = context.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
			final StringWriter writer = new StringWriter();
			m.marshal(obj, writer);
			return writer.getBuffer().toString();
		} catch (final Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static String generatePDFFileName(final Registration registration) {
		if (!StringUtils.isBlank(registration.getPhysicalFitnessForm())
				&& !StringUtils.isBlank(registration.getDateOfBirth())) {
			return generatePDFFileName(registration.getEmailAddress(),
					registration.getYearOfBirth());
		}
		return "";
	}

	private static String generatePDFFileName(final String email,
			final int yearOfBirth) {
		return email.toLowerCase() + "-" + yearOfBirth + ".pdf";
	}

	private static String generateXMLFileName(final String email,
			final int yearOfBirth) {
		return email.toLowerCase() + "-" + yearOfBirth + ".xml";
	}

	private RequestUtils() {
	}
}
