<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
// request.getRequestDispatcher("css/html/pages/sign-up.jsp").include(request, response);
// request.sendRedirect("css/html/pages/sign-up.jsp");

String site = new String("css/html/pages/sign-in.jsp");
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location", site);
%>
</body>
</html>