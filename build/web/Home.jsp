<%-- 
    Document   : home
    Created on : May 17, 2022, 6:59:02 AM
    Author     : ThanhDaiMacW10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html
    <html lang="e
    <head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Login Page - Product Admin Template</title>
<link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
<!-- https://fonts.google.com/specimen/Open+Sans -->
<link rel="stylesheet" href="css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="css/templatemo-style.css">
<!--
    Product Admin CSS Template
    https://templatemo.com/tm-524-product-admin
-->
<style>
    a:link, a:visited {
        background-color: #f5a623;
        color: white;
        padding: 14px 25px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
    }

    a:hover, a:active {
        background-color: #4e657a;
    }
    h1{
        color: white;
    }
</style>
</head>


<body>
    <div class="container tm-mt-big tm-mb-big">
        <div class="row">
            <div class="col-12 mx-auto tm-login-col">
                <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h1>Hello <%= session.getAttribute("logedUser") %> </h1>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">                           
                                <div class="form-group">
                                    <div class="form-group mt-4">                                        
                                        <a href="ManagerDish?mode=view">Restaurant Management</a>
                                        <a href="Logout?mode=logout">Logout</a>
                                    </div>
                                </div>
                                <div class="form-group mt-3">

                                </div>
                                <div class="form-group mt-4">

                                </div>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
</body>
</html>