<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%
	RequestUtils.newRegistration(request);
%>
<jsp:forward page="/WEB-INF/jsp/edit_registration.jsp"></jsp:forward>