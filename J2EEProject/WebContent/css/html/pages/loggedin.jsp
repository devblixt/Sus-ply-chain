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
	out.print("Hello, "+name+" ! You Are Logged In. Redirecting you shortly.");
	int utype = (int)session.getAttribute("usertype");
	switch(utype){
		case 0:
			request.getRequestDispatcher("spage.jsp").include(request, response);
			break;
		case 1:
			request.getRequestDispatcher("dpage.jsp").include(request, response);
			break;
		case 2:
			request.getRequestDispatcher("rpage.jsp").include(request, response);
			break;
		case 3:
			request.getRequestDispatcher("cpage.jsp").include(request, response);
			break;
		default:
			out.print("Please login first");
			request.getRequestDispatcher("sign-in.jsp").include(request, response);
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