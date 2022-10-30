<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Primary Meta Tags -->
    <title>Supply!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="title" content="Pixel Bootstrap 5 - Sign in">
    <meta name="author" content="Themesberg">
    <meta name="description"
        content="Open source and free Bootstrap 5 UI Kit featuring 80 UI components, 5 example pages, and a Gulp and Sass workflow.">
    <link rel="canonical" href="https://themesberg.com/product/ui-kit/pixel-free-bootstrap-5-ui-kit">

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://demo.themesberg.com/pixel-bootstrap-5-ui-kit">
    <meta property="og:title" content="Pixel Bootstrap 5 - Sign in">
    <meta property="og:description"
        content="Open source and free Bootstrap 5 UI Kit featuring 80 UI components, 5 example pages, and a Gulp and Sass workflow.">
    <meta property="og:image"
        content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg">

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://demo.themesberg.com/pixel-bootstrap-5-ui-kit">
    <meta property="twitter:title" content="Pixel Bootstrap 5 - Sign in">
    <meta property="twitter:description"
        content="Open source and free Bootstrap 5 UI Kit featuring 80 UI components, 5 example pages, and a Gulp and Sass workflow.">
    <meta property="twitter:image"
        content="https://themesberg.s3.us-east-2.amazonaws.com/public/products/pixel-lite/pixel-lite-preview.jpg">

    <!-- Favicon -->
    <link rel="apple-touch-icon" sizes="120x120" href="../../assets/img/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../../assets/img/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/img/favicon/favicon-16x16.png">
    <link rel="manifest" href="../../assets/img/favicon/site.webmanifest">
    <link rel="mask-icon" href="../../assets/img/favicon/safari-pinned-tab.svg" color="#ffffff">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">

    <!-- Fontawesome -->
    <link type="text/css" href="../../vendor/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">

    <!-- Pixel CSS -->
    <link type="text/css" href="../../css/pixel.css" rel="stylesheet">

<script language=Javascript>  
function setToInt(event) {
    this.value = parseInt(this.value);
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : evt.keyCode;
   if (charCode != 46 && charCode > 31 
     && (charCode < 48 || charCode > 57))
      return false;

   return true;
}

</script>
<style>
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
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
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 d-flex align-items-center justify-content-center">
                        <div
                            class="signin-inner my-4 my-lg-0 bg-white shadow-soft border rounded border-gray-300 p-4 p-lg-5 w-100 fmxw-500">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <h1 class="mb-0 h3">Supply to Distributor!</h1>
                            </div>
                            <form action="${pageContext.request.contextPath}/SendToDist" class="mt-4" method="post">
                                <!-- Form -->
                                <div class="form-group mb-4">
                                    <label for="text">Product ID</label>
                                    <div class="input-group">
                                        <span class="input-group-text" id="basic-addon1"><span
                                                class="fas fa-user-circle"></span></span>
                                        <input type="text" class="form-control" placeholder="Product ID (e.g. 50001)" name="p_id"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="text">Distributor ID</label>
                                    <div class="input-group">
                                        <span class="input-group-text" id="basic-addon1"><span
                                                class="fas fa-user-circle"></span></span>
                                        <input type="text" class="form-control" placeholder="Distributor ID (e.g. 10001) " name="d_id"
                                            required>
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="text">Quantity</label>
                                    <div class="input-group">
                                        <span class="input-group-text" id="basic-addon1"><span
                                                class="fas fa-user-circle"></span></span>
                                        <input type="number" class="form-control" onchange="setToInt" min="1" max="99999" step="1" placeholder="1000" name="qty" required>
                                    </div>
                                </div>
                                <!-- End of Form -->
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                            <div class="text-center" style="margin:5px; padding: top 5px;">
                                <a href="spage.jsp" class="text-default me-3">
                                    <button class="btn btn-primary" type="button">
                                       Back to Dashboard
                                    </button>
                                </a>
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