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
	out.println("<script type=\"text/javascript\">");
    out.println("alert('Successfully Added Stock for Product with ID = "+p_id+" !");
    out.println("location='css/html/pages/addStock.jsp';");
    out.println("</script>");
}
else
{
	// out.print("Please login first");
	// request.getRequestDispatcher("login.jsp").include(request, response);
	
	out.println("<script type=\"text/javascript\">");
    out.println("alert('Please log in!');");
    out.println("location='css/html/pages/sign-in.jsp';");
    out.println("</script>");
}
// out.close();
%>
</body>
</html>