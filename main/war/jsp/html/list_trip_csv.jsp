<%@page import="org.arp.arp_2012.TripType"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.arp.arp_2012.FlightLeg"%>
<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@page import="org.arp.arp_2012.Registration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%
	response.setHeader("Content-Type", "application/vnd.ms-excel");
	response.setHeader("Content-Disposition", "attachment; filename=sai_kailash_yatra_2012_registrations_trip.xls");
%>
<table>
	<tr>
		<th>First Name</th>
		<th>Last Name</th>
		<th>E-Mail Address</th>
		<th>Phone Number</th>
        <th>Citizenship</th>
        <th>Trip Type</th>
<%
    for (int i = 0; i < 9; ++i) {
%>
        <th><%= i + 1%># City of Departure </th>
        <th><%= i + 1%># City of Arrival </th>
        <th><%= i + 1%># Date of Departure </th>
<%        
    }
%>        
	</tr>
	<%
		int i = 0;
        final SimpleDateFormat dateFormat = new SimpleDateFormat ("MM/dd/yyy");
        final Calendar now = Calendar.getInstance();
		for (Registration registration : RequestUtils.all()) {
            final Calendar dob = Calendar.getInstance();
            dob.setTime(dateFormat.parse(registration.getDateOfBirth()));
	%>
	<tr>
		<td><%=StringUtils.capitalize(registration.getFirstName()
						.toLowerCase())%></td>
		<td><%=StringUtils.capitalize(registration.getLastName()
						.toLowerCase())%></td>
		<td><%=registration.getEmailAddress().toLowerCase()%></td>
		<td style="white-space: nowrap;"><%=registration.getPhoneNumber()%></td>
        <td style="white-space: nowrap;"><%=registration.getCitizenship()%></td>
        <td><%= registration.getTripType() %></td>
<%
    if (registration.getTripType() == TripType.ROUND_TRIP) {
%>        
        <td><%= RequestUtils.airportCode(registration.getRoundTrip().getCityOfDeparture()) %></td>
        <td>KTM</td>
        <td><%= registration.getRoundTrip().getDateOfDeparture() %></td>
        <td>KTM</td>
        <td><%= RequestUtils.airportCode(registration.getRoundTrip().getCityOfDeparture()) %></td>
        <td><%= registration.getReturnFromRoundTrip().getDateOfDeparture()  %></td>
<%
    }
%>
<%
    if (registration.getMultiCityFlightLegs() != null) {
        for (final FlightLeg leg : registration.getMultiCityFlightLegs()) {
%>
        <td><%= RequestUtils.airportCode(leg.getCityOfDeparture()) %> </td>
        <td><%= RequestUtils.airportCode(leg.getCityOfArrival()) %> </td>
        <td><%= leg.getDateOfDeparture() %> </td>
<%        
        }
    }
%>        
	</tr>
	<%
		}
	%>
</table>
