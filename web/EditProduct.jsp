<%-- 
    Document   : AddProduct
    Created on : May 14, 2022, 7:41:16 PM
    Author     : phuon
--%>

<%@page import="entity.Dish"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
        <style>
            #edit{
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="index.html">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="ViewOrder.jsp">
                                <i class="far fa-file-alt"></i> Reports
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" href="ManagerDish?mode=view">
                                <i class="fas fa-shopping-cart"></i> Dishes
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="Billing.jsp">
                                <i class="fas fa-money-bill-wave"></i> Billing
                            </a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="Logout?mode=logout">
                                Admin, <b>Logout</b>
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
                                <h2 class="tm-block-title d-inline-block">Edit Dish </h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-10"id="edit" >
                                <form action="UpdateDish" method="post" class="tm-edit-product-form" enctype="multipart/form-data">
                                    <div class="form-group mb-3">
                                        <input type="hidden" name="mode" value="edit">
                                         <% Dish editDish= (Dish)request.getAttribute("tempDish"); %>
                                        <label
                                            for="name"
                                            >ID
                                        </label>
                                        <input
                                            id="name"
                                            name="idDish"
                                            type="text"
                                            value="<%=editDish.getID()%>"
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
                                            value="<%=editDish.getName()%>"
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
                                            rows="5" name="description" value=""
                                            required 
                                            ><%=editDish.getDescription()%></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="expire_date"
                                                >Price
                                            </label>
                                            <input
                                                id="expire_date"
                                                name="price"
                                                type="text"
                                                value="<%=editDish.getPrice()%>"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="stock"
                                                >Category
                                            </label>

                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="category" name="type"
                                                >
                                                <option selected=""><%=editDish.getType()%></option>
                                                <option value="Main Dish" name = "type">Main Dish</option>
                                                <option value="Sides" name="type">Sides</option>
                                                <option value="Dessert" name="type">Dessert</option>
                                            </select>
                                        </div>
                                    </div>
                                        <div class="custom-file mt-3 mb-3">
                                    <input id="fileInput" type="file" name="image"  size="50" accept=".png, .jpg, .jpeg, .gif"  />                                   
                                </div>

                            </div>
                           
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Dish Now</button>
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
