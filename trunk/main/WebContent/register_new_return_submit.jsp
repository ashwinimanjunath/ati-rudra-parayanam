<%@ page import="org.arp.arp_2012.utils.RequestUtils" %>
<%@ page import="java.util.Map" %>
<%
    final String email = RequestUtils.email (request, "email");
    final String yob = RequestUtils.date(request, "yob");
    
    final Map<String, String> errors = RequestUtils.errors (request);
    if (!errors.isEmpty ()) {
%>        
        {
            "success": false,
            "errors":   <%= RequestUtils.json (errors) %>
        }
<%        
    } else {
%>        
        {
            "success": true,
            "url":   "go_home.jsp"
        }
<%        
    }
%>