<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.arp.arp_2012.FlightLeg"%>
<%@page import="java.util.List"%>
<%@page import="org.arp.arp_2012.TripType"%>
<%@page import="org.arp.arp_2012.Citizenship"%>
<%@page import="org.arp.arp_2012.PhysicianStatus"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.arp.arp_2012.utils.S3Client"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.arp.arp_2012.Gender"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.util.Streams"%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
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
			final String clientFileName = item.getName();
			if (!StringUtils.isBlank(clientFileName)) {
				params.put(item.getFieldName(), clientFileName);
				final ByteArrayOutputStream bos = new ByteArrayOutputStream();
				Streams.copy(item.openStream(), bos, true);
				final byte[] fileContents = bos.toByteArray();
				files.put(item.getFieldName(), fileContents);
			}
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
	registration
			.setCitizenship(RequestUtils.enuM(request, "citizenship",
					params.get("citizenship"), Citizenship.class));
	registration.setTripType(RequestUtils.enuM(request, "tripType",
			params.get("tripType"), TripType.class));
	registration.setPhysicianStatus(RequestUtils.enuM(request,
			"physicianStatus", params.get("physicianStatus"),
			PhysicianStatus.class));
	registration.setSpendTimeAtPN(StringUtils.trimToNull(params
			.get("spendTimeAtPN")));
	registration.setAddress(RequestUtils.string(request, "address",
			params.get("address")));
	registration.setPhoneNumber(RequestUtils.phone(request,
			"phoneNumber", params.get("phoneNumber")));
	registration.setCanChantChamakamFluently(RequestUtils.string(
			request, "canChantChamakamFluently",
			params.get("canChantChamakamFluently")));
	registration.setCanChantNamakamFluently(RequestUtils.string(
			request, "canChantNamakamFluently",
			params.get("canChantNamakamFluently")));

	if (registration.getTripType() == TripType.OWN_ARRANGEMENTS) {
		registration.setRoundTrip(null);
		registration.setMultiCityFlightLegs(Collections
				.<FlightLeg> emptyList());
	} else if (registration.getTripType() == TripType.ROUND_TRIP) {
		registration.setRoundTrip(RequestUtils.flightLeg(request,
				params, "roundTrip"));
	} else if (registration.getTripType() == TripType.MULTI_CITY) {
		final List<FlightLeg> legs = new ArrayList<FlightLeg>();
		for (int i = 0; i < 9; ++i) {
			final FlightLeg leg = RequestUtils.flightLeg(request,
					params, "multiCityFlightLegs[" + i + "]");
			if (leg != null) {
				legs.add(leg);
			}
		}
		registration.setMultiCityFlightLegs(legs);
	}

	registration.setComments(StringUtils.trimToNull(params
			.get("comments")));

	if (RequestUtils.errors(request).isEmpty()) {
		final byte[] fileContents = files.get("physicalFitnessForm");
		RequestUtils.saveRegistration(registration, fileContents);
		if (RequestUtils.hasPhysicalFitnessForm(registration)) {
%>
<jsp:forward page="/WEB-INF/jsp/registration_saved.jsp" />
<%
	} else {
%>
<jsp:forward page="/WEB-INF/jsp/registration_incomplete.jsp" />
<%
	}
	} else {
%>
<jsp:forward page="/WEB-INF/jsp/edit_registration.jsp" />
<%
	}
%>
