<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result of Package Supply</title>
</head>
<body>
<%
response.setContentType("text/html");
if(session!=null){
int err = (Integer)session.getAttribute("errorType");
System.out.println("errorType = "+ err);
String msg = "";

//out.print("<script type=\"text/javascript\">");
//out.print("alert('Successfully Sent to Distributor!!!');");
//out.print("location='suptodist.jsp';");
//out.print("</script>");

switch(err){
case 0:
	msg = "alert('Successfully Sent to Customer!!!');";
	//out.print("alert('Successfully Sent to Distributor!!!');");
	break;
case 1:
	msg = "alert('You do not have enough stock for this. Please add stock.');";
	// out.print("alert('You don't have enough stock for this. Please add stock.');");
	System.out.println("attempted alert");
	break;
case 2:
	int p_id = (Integer) session.getAttribute("p_id");
	msg = "alert('Product with ID "+p_id+" does not exist!! ');";
	// out.print("alert('Product with ID "+p_id+" does not exist!! ');");
	break;
case 3:
	int c_id = (Integer) session.getAttribute("c_id");
	msg = "alert('Customer with ID "+c_id+" does not exist!! ');";
	//out.print("alert('Distributor with ID "+d_id+" does not exist!! ');");
	break;
default:
	msg = "alert('An unexpected error occurred. Please Try again!! ');";
	//out.print("alert('An unexpected error occurred. Please Try again!! ');");
}
//out.print("alert('You don't have enough stock for this. Please add stock.');");

//out.print("location='suptodist.jsp';");
//out.print("</script>");

out.print("<script type=\"text/javascript\">");
out.print(msg);
out.print("location='RetToCust.jsp';");
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
%>
</body>
</html>