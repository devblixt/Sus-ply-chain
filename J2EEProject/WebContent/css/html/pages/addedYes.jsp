<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Added Product!</title>
</head>
<body>
<%
response.setContentType("text/html");
if(session!=null){
	String name = (String)session.getAttribute("userid");
	String p_id = (String)session.getAttribute("p_id");
	out.print("Hello, user with ID: "+name+" ! Product has been added. You will be redirected shortly.");
	int utype = (Integer)session.getAttribute("usertype");
	//response.sendRedirect("css/html/pages/addStock.jsp");
	
	out.print("<script type=\"text/javascript\">");
    out.print("alert('Successfully Added Stock for Product with ID = "+p_id+" ! ');");
    out.print("location='css/html/pages/addStock.jsp';");
    out.print("</script>");
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