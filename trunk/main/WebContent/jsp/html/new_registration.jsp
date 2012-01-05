<%@page import="org.arp.arp_2012.Registration"%>
<%@page import="org.arp.arp_2012.utils.RequestUtils"%>
<%
	session.setAttribute("registration", new Registration());
%>
<jsp:forward page="/WEB-INF/jsp/edit_registration.jsp"></jsp:forward>