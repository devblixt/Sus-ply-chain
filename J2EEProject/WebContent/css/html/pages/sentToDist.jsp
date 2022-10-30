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

out.print("<script type=\"text/javascript\">");
//out.print("alert('Successfully Sent to Distributor!!!');");
//out.print("location='suptodist.jsp';");
//out.print("</script>");

switch(err){
case 0:
	out.print("alert('Successfully Sent to Distributor!!!');");
	break;
case 1:
	out.print("alert('You don't have enough stock for this. Please add stock.');");
	System.out.println("attempted alert");
	break;
case 2:
	int p_id = (Integer) session.getAttribute("p_id");
	out.print("alert('Product with ID "+p_id+" does not exist!! ');");
	break;
case 3:
	int d_id = (Integer) session.getAttribute("d_id");
	out.print("alert('Distributor with ID "+d_id+" does not exist!! ');");
	break;
default:
	out.print("alert('An unexpected error occurred. Please Try again!! ');");
}
//out.print("alert('You don't have enough stock for this. Please add stock.');");

out.print("location='suptodist.jsp';");
out.print("</script>");
}
%>
</body>
</html>