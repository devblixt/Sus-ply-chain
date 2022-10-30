<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setContentType("text/html");
if(session!=null){
	String name = (String)session.getAttribute("userid");
	out.print("Hello, user with ID: "+name+" ! You Are Logged In. Redirecting you shortly.");
	int utype = (Integer)session.getAttribute("usertype");
	switch(utype){
		case 0:
			response.sendRedirect("css/html/pages/addStock.jsp");
			break;
		case 1:
			response.sendRedirect("css/html/pages/dpage.jsp");
			break;
		case 2:
			response.sendRedirect("css/html/pages/rpage.jsp");
			break;
		case 3:
			response.sendRedirect("css/html/pages/cpage.jsp");
			break;
		default:
			out.print("Please login first");
			response.sendRedirect("css/html/pages/sign-in.jsp");
	}
}
else
{
	// out.print("Please login first");
	// request.getRequestDispatcher("login.jsp").include(request, response);
	
	out.println("<script type=\"text/javascript\">");
    out.println("alert('Please log in!');");
    out.println("location='sign-in.jsp';");
    out.println("</script>");
}
out.close();
%>
</body>
</html>