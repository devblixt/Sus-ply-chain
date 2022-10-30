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
	String newuserid = (String)session.getAttribute("newuserid");
	String newusertype = (String)session.getAttribute("newusertype");
	out.print("Hello, user with ID: "+ newuserid +" ! You will be redirected shortly to sign in.");
	//response.sendRedirect("css/html/pages/addStock.jsp");
	
	out.print("<script type=\"text/javascript\">");
    out.print("alert('Successfully Added new "+ newusertype +" with ID = "+newuserid+" ! Please sign in.');");
    out.print("location='sign-in.jsp';");
    out.print("</script>");
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
// out.close();
%>
</body>
</html>