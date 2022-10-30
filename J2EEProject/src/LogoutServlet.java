
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try
		{
            PrintWriter out=response.getWriter();  
              
            //request.getRequestDispatcher("css/html/pages/sign-in.jsp").include(request, response);  
            
            HttpSession session=request.getSession();  
            session.invalidate();  
            out.print("<script type=\"text/javascript\">");
            out.print("alert('Successfully logged out! ');");
            out.print("location='css/html/pages/sign-in.jsp';");
            out.print("</script>");
            
              
            out.close(); 
		}
		 catch (Exception e) 
 		{
 			e.printStackTrace();
 		}
	}
}


