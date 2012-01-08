<%@page import="org.arp.arp_2012.Registration"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@ page import="java.util.Map"%>
<%
	final String email = RequestUtils.email(request, "emailAddress");
	final String yob = RequestUtils.param(request, "yearOfBirth",
			Pattern.compile("\\d{4}"), false);

	final Map<String, String> errors = RequestUtils.errors(request);
	if (!errors.isEmpty()) {
%>
<jsp:forward page="/jsp/html/register_new_return.jsp" />
<%
	} else {
		Registration registration = RequestUtils.getRegistration(email,
				Integer.parseInt(yob));
		if (registration == null) {
            RequestUtils.error(request, "emailAddress", "invalidLogin");
%>
<jsp:forward page="/jsp/html/register_new_return.jsp" />
<%
	    } else {
            RequestUtils.registration(request, registration);
%>
<jsp:forward page="/WEB-INF/jsp/edit_registration.jsp" />
<%
	    }
	}
%>
