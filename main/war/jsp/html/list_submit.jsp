<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%
	final String email = StringUtils.trimToEmpty(
			request.getParameter("emailAddress")).toLowerCase();
	final List<String> allowedEmails = Arrays.asList(
			"sboddupalli@gmail.com", "pavan.jella@gmail.com",
			"himavan200@yahoo.com", "lnarayan@gmail.com",
			"raghuram.kanadam@gmail.com", "anita.jella@gmail.com",
			"ashwini.twinkle@gmail.com");
	if (!request.getMethod().equalsIgnoreCase("POST")
			|| !allowedEmails.contains(email)) {
		response.sendRedirect("/jsp/html/list.jsp");
	}
%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.arp.arp_2012.Registration"%>
<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="inner">
	<div id="content">
		<div class="content">
			<div style="padding-bottom: 20px">
				<form action="<%=cp%>jsp/html/list_csv.jsp" method="post" id = "csvForm"
					>
					<input type="hidden" name="emailAddress" value="<%=email%>" /> <a
						class="button" id="submit" onClick = "$('#csvForm').submit ();return false;"> <span>Download Microsoft
							Excel File</span>
					</a>
				</form>
			</div>
			<table class="list">
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>E-Mail Address</th>
					<th>Date of Birth</th>
					<th>Phone Number</th>
					<th>Can Chant Namakam Fluently</th>
					<th>Can Chant Chamakam Fluently</th>
					<th>Submitted Medical Form</th>
					<th>Link to File</th>
					<th>Link to Medical Form</th>
				</tr>
				<%
					int i = 0;
					for (Registration registration : RequestUtils.all()) {
				%>
				<tr>
					<td><%=++i%>.</td>
					<td><%=StringUtils.capitalize(registration.getFirstName()
						.toLowerCase())%></td>
					<td><%=StringUtils.capitalize(registration.getLastName()
						.toLowerCase())%></td>
					<td><%=registration.getEmailAddress().toLowerCase()%></td>
					<td><%=registration.getDateOfBirth()%></td>
					<td style="white-space: nowrap;"><%=registration.getPhoneNumber()%></td>
					<td><%=registration.getCanChantNamakamFluently()
						.toUpperCase()%></td>
					<td><%=registration.getCanChantChamakamFluently()
						.toUpperCase()%></td>
					<td><%=StringUtils.isEmpty(registration
						.getPhysicalFitnessForm()) ? "NO" : "YES"%></td>
					<td><a
						href="http://sai-arp-2012-registration.s3-website-us-west-1.amazonaws.com/<%=RequestUtils.generateXMLFileName(registration)%>">Click
							Here</a></td>
					<td>
						<%
							if (!StringUtils.isEmpty(registration.getPhysicalFitnessForm())) {
						%> <a
						href="http://sai-arp-2012-registration.s3-website-us-west-1.amazonaws.com/<%=RequestUtils.generatePDFFileName(registration)%>">Click
							Here</a> <%
 	} else {
 %> &nbsp; <%
 	}
 %>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
