import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
//import java.text.SimpleDateFormat;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;

/**
 * Servlet implementation class IssueServlet
 */
@WebServlet("/SendToDist")
public class SendToDist extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SendToDist() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		HttpSession session = request.getSession();
		String p_id = request.getParameter("p_id");
		String d_id = request.getParameter("d_id");
        int qty = Integer.parseInt(request.getParameter("qty"));
        
        int utype = (Integer)session.getAttribute("usertype");
        String s_id = (String)session.getAttribute("userid");
        
        if(utype == 0) {
    //		java.util.Date i_date = new SimpleDateFormat("yyyy-MM-dd").parse(idate);
    //		java.sql.Date issue_date = new java.sql.Date(i_date.getTime());
            
    //		String rdate = request.getParameter("return_date");
    //		java.util.Date r_date = new SimpleDateFormat("yyyy-MM-dd").parse(rdate);
    //		java.sql.Date return_date = new java.sql.Date(r_date.getTime());
    
    		Connection con = null;
     		String url = "jdbc:mysql://localhost:3306/supplychainDB"; //MySQL URL and followed by the database name
     		String username = "susply"; //MySQL username
     		String password = "sus"; //MySQL password
    		
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
     		System.out.println("Printing connection object "+con);
     		PrintWriter out = response.getWriter();
     		
     		PreparedStatement checker = con.prepareStatement("SELECT COUNT(*) as C FROM product WHERE p_id = ? ;");
     		checker.setString(1, p_id); 
     		ResultSet rset = checker.executeQuery();
    		rset.next();
    		
    		PreparedStatement checker2 = con.prepareStatement("SELECT COUNT(*) as C2 FROM distributor WHERE d_id = ? ;");
            checker2.setString(1, d_id); 
            ResultSet rset2 = checker2.executeQuery();
            rset2.next();
 
    		if (rset.getInt("C") == 1 && rset2.getInt("C2") == 1) { // then p_id, d_id exists
    		    
    		    PreparedStatement glance2 = con.prepareStatement( // get qty that supplier has
    		            "SELECT has_qty FROM has WHERE p_id = ? AND s_id = ? ;");
                glance2.setString(1, p_id);
                glance2.setString(2, s_id);
                ResultSet hist2 = glance2.executeQuery();
                hist2.next();
                int has_qty = hist2.getInt("has_qty");
                System.out.println("sup has "+ has_qty+ " and wants to give "+qty);
                if(has_qty > qty) {

    		    PreparedStatement glance = con.prepareStatement("SELECT COUNT(*) as C3 FROM dist_inv WHERE p_id = ? AND d_id = ? ;");
    			glance.setString(1, p_id);
    			glance.setString(2, d_id);
    			ResultSet hist = glance.executeQuery();
                hist.next();
                int result = 0;
                
                PreparedStatement st4 = con.prepareStatement(
                        "INSERT INTO supplies(transac_id, p_id, s_id, d_id, date, s_qty) "
                        + "SELECT MAX(transac_id) + 1 , ?, ?, ?, MAX(CURDATE()), ? FROM supplies;");
                // allow multiple such supplies in same day. possible IRL!!!!!!!!!!!!!
                st4.setString(1, p_id);
                st4.setString(2, s_id);
                st4.setString(3, d_id);
                st4.setInt(4, qty);
                int result2=st4.executeUpdate();
                st4.close();
                PreparedStatement st7 = con.prepareStatement(
                        "UPDATE has SET has_qty = has_qty - ? WHERE p_id = ? AND s_id = ? ;");
                st7.setInt(1, qty);
                st7.setString(2, p_id);
                st7.setString(3, s_id);
                int result7=st7.executeUpdate();
                st7.close();
                
                if(hist.getInt("C3") == 1) { // dist already has the product
                    PreparedStatement st = con.prepareStatement("UPDATE dist_inv SET has_qty = has_qty + ? WHERE p_id = ? AND d_id = ? ;");
                    st.setInt(1, qty);
                    st.setString(2, p_id);
                    st.setString(3, d_id);
                    result=st.executeUpdate();
                    st.close();
                } else { // dist doesn't already have the product
                    PreparedStatement st = con.prepareStatement("INSERT INTO dist_inv VALUES (?, ?, ?);");
                    st.setString(1, d_id);
                    st.setString(2, p_id);
                    st.setInt(3, qty);
                    result=st.executeUpdate();
                    st.close();
                }
                hist.close();
                if(result>0) {
                    System.out.println("Successfully sent supplies to distributor!!! ");
                    
//                  out.println("<script type=\"text/javascript\">");
//                  out.println("alert('Successfully Sent to Distributor!!!');");
//                  out.println("location='css/html/pages/suptodist.jsp';");
//                  out.println("</script>");
                    
                    //RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sentToDist.jsp");
                    session.setAttribute("errorType", 0);
                    response.sendRedirect("css/html/pages/sentToDist.jsp");
                    //rd.forward(request, response);
                
                }
                } else {
                    System.out.println("You don't have enough stock for this.");
//                    out.print("<script type=\"text/javascript\">");
//                    out.print("alert('You don't have enough stock for this. Please add stock.');");
//                    out.print("location='css/html/pages/suptodist.jsp';");
//                    out.print("</script>");
                   // RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sentToDist.jsp");
                    session.setAttribute("errorType", 1);
                   // rd.forward(request, response);
                    response.sendRedirect("css/html/pages/sentToDist.jsp");
                }
    		}
    		else {
    		   if(rset.getInt("C")!=1) {
    		       System.out.println("Product with given ID does not exist");
    		       session.setAttribute("p_id", p_id);
//    		       out.print("<script type=\"text/javascript\">");
//    		       out.print("alert('Product with ID "+p_id+" does not exist!! ');");
//    		       out.print("location='css/html/pages/suptodist.jsp';");
//    		       out.print("</script>");
    		       RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sentToDist.jsp");
                   session.setAttribute("errorType", 2);
                   rd.forward(request, response);
    		   } else {
    		       System.out.println("Distributor with given ID does not exist");
    		       session.setAttribute("d_id", d_id);
//    		       out.print("<script type=\"text/javascript\">");
//                   out.print("alert('Distributor with ID "+d_id+" does not exist!! ');");
//                   out.print("location='css/html/pages/suptodist.jsp';");
//                   out.print("</script>");
    		       RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sentToDist.jsp");
                   session.setAttribute("errorType", 3);
                   rd.forward(request, response);
    		   }
    		}
    		checker.close();
    		checker2.close();
            
        } else {
            System.out.println("Not a supplier !!! Illegal Access");
            RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sign-in.jsp");
            session.invalidate();
            rd.forward(request, response);
        }
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}

	}

}


