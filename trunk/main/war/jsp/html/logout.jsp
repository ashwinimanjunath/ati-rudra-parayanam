<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<%
    session.invalidate();
    response.sendRedirect("/jsp/html/index.jsp");
%>