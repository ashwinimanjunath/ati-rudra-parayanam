<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.arp.arp_2012.utils.S3Client"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.arp.arp_2012.Gender"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="org.arp.arp_2012.ImmigrationStatus"%>
<%@page import="org.arp.arp_2012.Registration"%>
<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
	final ServletFileUpload upload = new ServletFileUpload();

	final Map<String, String> params = new HashMap<String, String>();
	final Map<String, byte[]> files = new HashMap<String, byte[]>();
	final FileItemIterator iterator = upload.getItemIterator(request);
	while (iterator.hasNext()) {
		final FileItemStream item = iterator.next();
		if (item.isFormField()) {
			final String paramValue = Streams.asString(item
					.openStream());
			params.put(item.getFieldName(), paramValue);
		} else {
			params.put(item.getFieldName(), item.getName());
			final ByteArrayOutputStream bos = new ByteArrayOutputStream();
			Streams.copy(item.openStream(), bos, true);
			final byte[] fileContents = bos.toByteArray();
			files.put(item.getFieldName(), fileContents);
		}
	}

	final Registration registration = RequestUtils
			.newRegistration(request);

	registration.setEmailAddress(RequestUtils.email(request,
			"emailAddress", params.get("emailAddress")));
	registration.setDateOfBirth(RequestUtils.date(request,
			"dateOfBirth", params.get("dateOfBirth")));
	registration.setFirstName(RequestUtils.string(request, "firstName",
			params.get("firstName")));
	registration.setLastName(RequestUtils.string(request, "lastName",
			params.get("lastName")));
	registration.setGender(RequestUtils.enuM(request, "gender",
			params.get("gender"), Gender.class));
	registration.setImmigrationStatus(RequestUtils.enuM(request,
			"immigrationStatus", params.get("immigrationStatus"),
			ImmigrationStatus.class));
	registration.setCityOfDeparture(RequestUtils.string(request,
			"cityOfDeparture", params.get("cityOfDeparture")));
	registration.setDateOfDeparture(RequestUtils.date(request,
			"dateOfDeparture", params.get("dateOfDeparture")));
	registration.setCityOfArrival(RequestUtils.string(request,
			"cityOfArrival", params.get("cityOfArrival")));

	if (!RequestUtils.hasPhysicalFitnessForm(registration)) {
		//Check for the physical fitness form only if he has not uploaded it previously
		RequestUtils.string(request, "physicalFitnessForm",
				params.get("physicalFitnessForm"));
	}
	if (RequestUtils.errors(request).isEmpty()) {
        final byte[] fileContents = files.get("physicalFitnessForm");
        RequestUtils.saveRegistration(registration, fileContents);
	}
%>
<jsp:forward page="/WEB-INF/jsp/edit_registration.jsp" />
