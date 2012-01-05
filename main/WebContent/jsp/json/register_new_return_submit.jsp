<%@ page import="java.util.regex.Pattern"%>
<%@ page import="org.arp.arp_2012.utils.RequestUtils"%>
<%@ page import="java.util.Map"%>
<%
	final String email = RequestUtils.email(request, "email");
	final String yob = RequestUtils.param(request, "yob",
			Pattern.compile("\\d{4}"), false);

	final Map<String, String> errors = RequestUtils.errors(request);
	if (!errors.isEmpty()) {
%>
{ "success": false, "errors":
<%=RequestUtils.json(errors)%>
}
<%
	} else {
        RequestUtils.successUrl(request, "/WEB-INF/jsp/edit_registration.jsp");
%>
{ "success": true }
<%
	}
%>