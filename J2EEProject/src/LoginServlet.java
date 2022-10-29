
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try
		{
	
		//getting input values from jsp page
		String id = request.getParameter("userid");
		String pwd = request.getParameter("password");
		String utype_str = request.getParameter("usertype");
//		System.out.println(id);
		int utype=10;
		switch(utype_str) {
		    case "Supplier":
		        utype=0;
		        break;
		    case "Distributor":
		        utype=1;
		        break;
		    case "Retailer":
		        utype=2;
		        break;
		    case "Customer":
		        utype=3;
		        break;
		}

		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/supplychainDB"; 
 		String username = "susply"; //MySQL username
 		String password = "sus"; //MySQL password
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); 
 		System.out.println("Printing connection object "+con);
 		HttpSession session = request.getSession();
 		PrintWriter out = response.getWriter();

		//Prepared Statement to get hashed password
		PreparedStatement st = con.prepareStatement(
				"SELECT pass FROM user WHERE user_id = ? AND user_type = ?;"
				);
 		st.setString(1, id);
 		st.setInt(2, utype);
// 		System.out.println(st.toString());
 		if(utype>=0 && utype<=3) {
     		ResultSet rset = st.executeQuery();
    		if(rset.next()){
    		    System.out.println("tester");
    			String pass_db = rset.getString("pass");
    			System.out.println("pass hash = "+ pass_db);
    			PreparedStatement st_in = con.prepareStatement(
    					"SELECT SHA2(? , 256) AS hash;"
    					);
    	 		st_in.setString(1, pwd);
    	 		ResultSet rset_in = st_in.executeQuery();
    			rset_in.next();
    			String pass_in = rset_in.getString("hash");
    			System.out.println("input hash = "+ pass_in);
    			
    			if(pass_in.equals(pass_db))
    			{
    			    System.out.println("correct password");
    				RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/loggedin.jsp");
    				session.setAttribute("userid", id);
    				session.setAttribute("usertype", utype);
    				rd.forward(request, response);
    			} else { 
    	            RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sign-in.jsp");
    	            out.println("<font color=red> Password is wrong. </font>"); 
    	            rd.include(request, response); 
    	        }
    			
    		} else { 
//    			System.out.println("No such user!!!");
//                RequestDispatcher rd = request.getRequestDispatcher("login.jsp"); 
//                out.println("<font color=red> User ID does not exist </font>");
//                rd.include(request, response); 
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User not present!');");
                out.println("location='css/html/pages/sign-in.jsp';");
                out.println("</script>");
            }
    		out.close();
 		} else {
 		   out.println("<script type=\"text/javascript\">");
 		    out.println("alert('Invalid user type!');");
 		    out.println("location='css/html/pages/sign-in.jsp';");
 		    out.println("</script>");
 		}
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}
	}
}


