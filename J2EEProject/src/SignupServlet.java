

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
/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try
        {
    
        //getting input values from jsp page
        //HttpSession session = request.getSession();
        String uid = request.getParameter("userid");
        String uname = request.getParameter("name");
        String ucity = request.getParameter("city");
        String uphone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String pass2 = request.getParameter("password_confirm");
        String utype_str = request.getParameter("usertype");
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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        if(utype <=3 && utype>=0) {
            Connection con = null;
            String url = "jdbc:mysql://localhost:3306/supplychainDB"; //MySQL URL and followed by the database name
            String username = "susply"; //MySQL username
            String password = "sus"; //MySQL password
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
            System.out.println("Printing connection object "+con);
            
            PreparedStatement checker = con.prepareStatement("SELECT COUNT(*) as C FROM user WHERE user_id = ? AND user_type = ? ;");
            checker.setString(1, uid); 
            checker.setInt(2, utype); 
            ResultSet rset = checker.executeQuery();
            rset.next();
 
            if (rset.getInt("C") == 0) {
                if(pass.equals(pass2)) {
                    PreparedStatement st = con.prepareStatement("INSERT INTO user VALUES (?, ?, SHA2( ? , 256));");
                    st.setString(1, uid);
                    st.setInt(2, utype);
                    st.setString(3, pass);
                    int result=st.executeUpdate();
                    st.close();
                    System.out.println(result+ " record added! new user!");
                    String usertype_table ="";
                    switch(utype) {
                        case 0:
                            usertype_table = "supplier";
                            break;
                        case 1:
                            usertype_table = "distributor";
                            break;
                        case 2:
                            usertype_table = "retailer";
                            break;
                        case 3:
                            usertype_table = "customer";
                            break;
                    }
                    PreparedStatement st2 = con.prepareStatement("INSERT INTO "+usertype_table+" VALUES (?, ?, ?, ?);");
                    st2.setString(1, uid);
                    st2.setString(2, uname);
                    st2.setString(3, ucity);
                    st2.setString(4, uphone);
                    int result2=st2.executeUpdate();
                    st2.close();
                    System.out.println(result2+ " record added! new "+usertype_table+" !");
                    session.setAttribute("newusertype", usertype_table);
                    session.setAttribute("newuserid", uid);
                    response.sendRedirect("css/html/pages/signedup.jsp");
//                    out.println("<script type=\"text/javascript\">");
//                    out.println("alert('Successfully Added New "+usertype_table+" with ID = "+uid+" !'); ");
//                    out.println("location='css/html/pages/sign-in.jsp';");
//                    out.println("</script>");

                } else {
                    System.out.println("Password could not be confirmed.");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Password could not be confirmed.');");
                    out.println("location='css/html/pages/sign-up.jsp';");
                    out.println("</script>");
                    //RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sign-up.jsp");
                    //rd.forward(request, response);
                    
                }
                
            } else {
                System.out.println("User with given ID already exists!!");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User with given ID already exists!!');");
                out.println("location='css/html/pages/sign-up.jsp';");
                out.println("</script>");
                //RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sign-up.jsp");
                //rd.forward(request, response);
            }
            checker.close();
        } else {
            System.out.println("Invalid Type of Membership");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Type of Membership! Choose a valid user type.');");
            out.println("location='css/html/pages/sign-up.jsp';");
            out.println("</script>");
            //RequestDispatcher rd = request.getRequestDispatcher("css/html/pages/sign-up.jsp");
            //rd.forward(request, response);
        }
        
        }
         catch (Exception e) 
        {
            e.printStackTrace();
        }
    }
}


