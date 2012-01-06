<%
    session.invalidate();
    response.sendRedirect(request.getServletContext().getContextPath() + "/jsp/html/index.jsp");
%>