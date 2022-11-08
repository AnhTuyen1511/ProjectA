<%-- 
    Document   : OrderManagement
    Created on : May 15, 2022, 12:43:59 PM
    Author     : phuon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Admin - Dashboard HTML Template</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="ViewProduct.jsp">
                        <h1 class="tm-site-title mb-0">Product Admin</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link active" href="ViewOrder.jsp">
                                    <i class="far fa-file-alt"></i>
                                    Reports
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href=" href="ManagerDish?mode=view"">
                                    <i class="fas fa-shopping-cart"></i>
                                    Dishes
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="Billing.jsp">
                                    <i class="fas fa-money-bill-wave"></i>
                                    Billing
                                </a>
                            </li>

                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link d-block" href='Login?mode=logout'>
                                 <b>Logout</b>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </nav>
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12">
                                    <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-6 col-lg-6 col-md-12">
                                    <form action="" method="post" class="tm-edit-product-form">
                                        <div class="form-group mb-3">
                                            <label
                                                for="name"
                                                >ID
                                            </label>
                                            <input
                                                id="name"
                                                name="idDish"
                                                type="text"
                                                value=""
                                                class="form-control validate"
                                                />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="category"
                                                >Dish Name</label
                                            >
                                            <input
                                                id="stock"
                                                name="name"
                                                type="text"
                                                value=""
                                                class="form-control validate"
                                                />

                                        </div>
                                        <div class="form-group mb-3">
                                            <label
                                                for="description"
                                                >Description</label
                                            >
                                            <textarea                    
                                                class="form-control validate tm-small"
                                                rows="5"
                                                required
                                                ></textarea>
                                        </div>

                                        <div class="row">
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="expire_date"
                                                    >Units In Sold
                                                </label>
                                                <input
                                                    id="expire_date"
                                                    name="price"
                                                    type="text"
                                                    value=""
                                                    class="form-control validate"
                                                    data-large-mode="true"
                                                    />
                                            </div>
                                            <div class="form-group mb-3 col-xs-12 col-sm-6">
                                                <label
                                                    for="stock"
                                                    >Status
                                                </label>

                                                <select
                                                    class="custom-select tm-select-accounts"
                                                    id="category"
                                                    >
                                                    <option selected="">Select status</option>
                                                    <option value="1">Available</option>
                                                    <option value="2">Sold Out</option>
                                                    <!--<option value="3">Dersert</option>-->
                                                </select>
                                            </div>
                                        </div>

                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                    <div class="tm-product-img-dummy mx-auto">
                                        <i
                                            class="fas fa-cloud-upload-alt tm-upload-icon"
                                            onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                    </div>
                                    <div class="custom-file mt-3 mb-3">
                                        <input id="fileInput" type="file" style="display:none;" />
                                        <input
                                            type="button"
                                            class="btn btn-primary btn-block mx-auto"
                                            value="UPLOAD PRODUCT IMAGE"
                                            onclick="document.getElementById('fileInput').click();"
                                            />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved. 
                    </p>
                </div>
            </footer> 

            <script src="js/jquery-3.3.1.min.js"></script>
            <!-- https://jquery.com/download/ -->
            <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
            <!-- https://jqueryui.com/download/ -->
            <script src="js/bootstrap.min.js"></script>
            <!-- https://getbootstrap.com/ -->
            <script>
                                                $(function () {
                                                    $("#expire_date").datepicker();
                                                });
            </script>
    </body>
</html>
