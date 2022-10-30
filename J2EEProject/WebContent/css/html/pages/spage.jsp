<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Primary Meta Tags -->
    <title>Supplier Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="title" content="Pixel Bootstrap 5 - Sign in" />
    <meta name="author" content="Themesberg" />
    <meta name="description"
        content="Open source and free Bootstrap 5 UI Kit featuring 80 UI components, 5 example pages, and a Gulp and Sass workflow." />
    <link rel="canonical" href="https://themesberg.com/product/ui-kit/pixel-free-bootstrap-5-ui-kit" />

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://demo.themesberg.com/pixel-bootstrap-5-ui-kit" />
    <meta property="og:title" content="Pixel Bootstrap 5 - Sign in" />
    <meta property="og:description"
        content="Open source and free Bootstrap 5 UI Kit featuring 80 UI components, 5 example pages, and a Gulp and Sass workflow." />
    <meta property="og:image"
        content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg" />

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image" />
    <meta property="twitter:url" content="https://demo.themesberg.com/pixel-bootstrap-5-ui-kit" />
    <meta property="twitter:title" content="Pixel Bootstrap 5 - Sign in" />
    <meta property="twitter:description"
        content="Open source and free Bootstrap 5 UI Kit featuring 80 UI components, 5 example pages, and a Gulp and Sass workflow." />
    <meta property="twitter:image"
        content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg" />

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="120x120" href="../../assets/img/favicon/apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../../assets/img/favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/img/favicon/favicon-16x16.png" />
    <link rel="manifest" href="../../assets/img/favicon/site.webmanifest" />
    <link rel="mask-icon" href="../../assets/img/favicon/safari-pinned-tab.svg" color="#ffffff" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="theme-color" content="#ffffff" />

    <!-- Fontawesome -->
    <link type="text/css" href="../../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />

    <!-- Pixel CSS -->
    <link type="text/css" href="../../css/pixel.css" rel="stylesheet" />
    <style>
        .grid-container-element {
            display: grid;
            grid-template-columns: 2fr 1.2fr;
            /* grid-gap: 20px;  */
            /* border: 1px solid black;  */
            /* width: 50%;  */
        }
        .grid-child-element { 
    margin: 10px; 
}

.flex-parent-element {
  display: flex;
  width: 50%;
}

.flex-child-element {
  flex: 1;
  border: 2px solid blueviolet;
  margin: 10px;
}

.flex-child-element:first-child {
  margin-right: 20px;
}

.float-container{
padding:20px;
}
.float-child1{
width:70%;
float:left;
padding:20px;
}
.float-child2{
width:30%;
float:right;
padding:20px;
}


    </style>
</head>

<body>
    <main>
        <div class="preloader bg-dark flex-column justify-content-center align-items-center">
            <svg id="loader-logo" xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 64 78.4">
                <path fill="#fff" d="M10,0h1.2V11.2H0V10A10,10,0,0,1,10,0Z" />
                <rect fill="none" stroke="#fff" stroke-width="11.2" x="40" y="17.6" width="0" height="25.6" />
                <rect fill="none" stroke="#fff" stroke-opacity="0.4" stroke-width="11.2" x="23" y="35.2" width="0"
                    height="25.6" />
                <path fill="#fff" d="M52.8,35.2H64V53.8a7,7,0,0,1-7,7H52.8V35.2Z" />
                <rect fill="none" stroke="#fff" stroke-width="11.2" x="6" y="52.8" width="0" height="25.6" />
                <path fill="#fff" d="M52.8,0H57a7,7,0,0,1,7,7h0v4.2H52.8V0Z" />
                <rect fill="none" stroke="#fff" stroke-opacity="0.4" stroke-width="11.2" x="57.8" y="17.6" width="0"
                    height="11.2" />
                <rect fill="none" stroke="#fff" stroke-width="11.2" x="6" y="35.2" width="0" height="11.2" />
                <rect fill="none" stroke="#fff" stroke-width="11.2" x="40.2" y="49.6" width="0" height="11.2" />
                <path fill="#fff" d="M17.6,67.2H28.8v1.2a10,10,0,0,1-10,10H17.6V67.2Z" />
                <rect fill="none" stroke="#fff" stroke-opacity="0.4" stroke-width="28.8" x="31.6" width="0"
                    height="11.2" />
                <rect fill="none" stroke="#fff" x="14" stroke-width="28.8" y="17.6" width="0" height="11.2" />
            </svg>
        </div>

        <!-- Section -->
        <section class="min-vh-100 d-flex align-items-center section-image overlay-soft-dark"
            data-background="../../assets/img/pages/form-image.jpg">
            <div class="container-xl grid-container-element">
            
                <div class="container grid-child-element">
                    <div class="row justify-content-center">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div
                                class="signin-inner my-4 my-lg-0 bg-white shadow-soft border rounded border-gray-300 p-4 p-lg-5 w-100 fmxw-500">
                                <div class="text-center text-md-center mb-4 mt-md-0">
                                    <h1 class="mb-0 h3">Inventory of Supplier 
                                    <% 
                                    String s_id = (String)session.getAttribute("userid");
                                    out.println(s_id);
                                    %>
                                    </h1>
                                    
                                    <%
                                    // Printwriter out = response.getWriter();
                                    Connection con = null;
                             		String url = "jdbc:mysql://localhost:3306/supplychainDB"; //MySQL URL and followed by the database name
                             		String username = "susply"; //MySQL username
                             		String password = "sus"; //MySQL password
                            		
                            		Class.forName("com.mysql.jdbc.Driver");
                            		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
                             		System.out.println("Printing connection object "+con);
                            		// s_id = (String)session.getAttribute("userid");
                            		int u_type = (Integer)session.getAttribute("usertype");
                            		
                             		if(u_type == 0){
	                             		PreparedStatement checker = con.prepareStatement("SELECT * FROM product NATURAL JOIN has WHERE s_id = ? ;");
	                             		
	                             		checker.setString(1, s_id); 
	                             		ResultSet rs = checker.executeQuery();
	                            		rs.next();
	                            		
	                            		out.println("<table class='table table-dark' style='margin:10px'>");
	                                    out.println("<tr><th scope='col'>Product ID</th> <th scope='col'>Name</th> <th scope='col'>Quantity</th></tr>");
	                                    while(rs.next()){
	    
	                                    out.println("<tr>");
	                                    out.println("<td scope='row'>"+rs.getString("p_id")+"</td>");
	                                    out.println("<td scope='row'>"+rs.getString("p_name")+"</td>");
	                                    out.println("<td scope='row'>"+rs.getString("has_qty")+"</td>");
	                                    // Get the data from rows, put within td
	                                    out.println("</tr>");
	                                    }
	                                    out.println("</table>");
	                                    
                             		} else{
                             			out.println("<script type=\"text/javascript\">");
                             		    out.println("alert('Invalid login');");
                             		    out.println("location='css/html/pages/sign-in.jsp';");
                             		    out.println("</script>");
                             		}
                                    %>
                                
                                
                                </div>
                                
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
                
                
                
                <div class="container grid-child-element">
                    <div class="row justify-content-center">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div
                                class="signin-inner my-4 my-lg-0 bg-white shadow-soft border rounded border-gray-300 p-4 p-lg-5 w-100 fmxw-500">
                                <div class="text-center text-md-center mb-4 mt-md-0">
                                    <h1 class="mb-0 h3">Supplier Options</h1>
                                </div>
                                <div class="text-center text-md-center mb-4 mt-md-0">
                                    <a href="addStock.jsp" class="text-default me-3">
                                        <button class="btn btn-outline-primary" type="button">
                                            Add Stock
                                        </button>
                                    </a>
                                    <!-- </button> -->
                                </div>
                                <div class="text-center text-md-center mb-4 mt-md-0">
                                    <a href="shipToDist.jsp" class="text-default me-3">
                                        <button class="btn btn-outline-primary" type="button">
                                            Ship to Distributor
                                        </button>
                                    </a>
                                    <!-- </button> -->
                                </div>
                                <form action="${pageContext.request.contextPath}/LogoutServlet" method="post">
                                <div class="text-center text-md-center mb-4 mt-md-0">
                                    	<button class="btn btn-outline-primary" type="submit">
                                            Log Out
                                        </button>
                                    <!-- </button> -->
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Core -->
    <script src="../../vendor/@popperjs/core/dist/umd/popper.min.js"></script>
    <script src="../../vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../../vendor/headroom.js/dist/headroom.min.js"></script>

    <!-- Vendor JS -->
    <script src="../../vendor/onscreen/dist/on-screen.umd.min.js"></script>
    <script src="../../vendor/jarallax/dist/jarallax.min.js"></script>
    <script src="../../vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="../../vendor/vivus/dist/vivus.min.js"></script>
    <script src="../../vendor/vanillajs-datepicker/dist/js/datepicker.min.js"></script>

    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Pixel JS -->
    <script src="../../assets/js/pixel.js"></script>
</body>

</html>