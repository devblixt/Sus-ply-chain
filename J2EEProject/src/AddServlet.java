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
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		HttpSession session = request.getSession();
		String p_id = request.getParameter("p_id");
		String p_name = request.getParameter("p_name");
		float p_rate = Float.parseFloat(request.getParameter("p_rate"));
        int p_qty = Integer.parseInt(request.getParameter("p_qty"));
        String p_feature = request.getParameter("p_feature");
        
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
 
    //		System.out.println(student_id);
    //		System.out.println(rset.getInt("C"));
    		if (rset.getInt("C") == 0) {
    			PreparedStatement st = con.prepareStatement("INSERT INTO product VALUES (?, ?, ?, ?);");
    	 		st.setString(1, p_id);
    			st.setString(2, p_name);
    			st.setFloat(3, p_rate);
    			st.setString(4, p_feature);
    			int result=st.executeUpdate();
    			st.close();
    			System.out.println(result+ " record added! new product ...");
//    			out.println("<script type=\"text/javascript\">");
//                out.println("alert('New product successfully added!');");
//                out.println("location='css/html/pages/addStock.jsp';");
//                out.println("</script>");
    		
    		}
    		else {
    		    System.out.println("Product with given ID already exists!");
//    			RequestDispatcher rd = request.getRequestDispatcher("IssueError.jsp");
//    			rd.forward(request, response);
    		}
    		checker.close();
    		
    		PreparedStatement checker2 = con.prepareStatement("SELECT COUNT(*) as C FROM has WHERE p_id = ? AND s_id = ? ;");
            checker2.setString(1, p_id);
            checker2.setString(2, s_id);
            ResultSet rset2 = checker2.executeQuery();
            rset2.next();
            int result = 0;
            if (rset2.getInt("C") == 0) {
                PreparedStatement st = con.prepareStatement("INSERT INTO has VALUES (?, ?, ?);");
                st.setString(1, s_id);
                st.setString(2, p_id);
                st.setInt(3, p_qty);
                result=st.executeUpdate();
                st.close();
            
            }
            else { 
                // if item exists and supplier HAS it, then irrespective of what they enter for other details, they can update qty.
                PreparedStatement st = con.prepareStatement("UPDATE has SET has_qty = has_qty + ? WHERE p_id = ? AND s_id = ?;");
                st.setInt(1, p_qty);
                st.setString(2, p_id);
                st.setString(3, s_id);
                result=st.executeUpdate();
                st.close();
            }
            checker2.close();
            if(result>0) {
                System.out.println("successfully added!");
                RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/addedYes.jsp");
                session.setAttribute("p_id", p_id);
                rd.forward(request, response);
            
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Successfully Added Stock for Product with ID = "+p_id+" !");
//                out.println("location='css/html/pages/addStock.jsp';");
//                out.println("</script>");
            }
            
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


