
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Dish"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Product Page - Admin HTML Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
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
                                <i class="far fa-file-alt"></i> Report
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
                            <a class="nav-link d-block" href='Logout?mode=logout'>
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <%
                                ArrayList<Dish> listDish = (ArrayList<Dish>) request.getAttribute("listDish");
                            %>
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>

                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">ID </th>
                                        <th scope="col">DISH NAME</th>
                                        <th scope="col">PRICE</th>
                                        <th scope="col">TYPE</th>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">&nbsp;</th>

                                    </tr>
                                </thead>
                                <tbody>

                                    <% for (int i = 0; i < listDish.size(); i++) {%>
                                    <tr>
                                        <th scope="row"><input type="checkbox" /></th>
                                        <td><%=listDish.get(i).getID()%></td>
                                        <td class="tm-product-name"><%=listDish.get(i).getName()%></td>
                                        <td><%=listDish.get(i).getPrice()%></td>

                                        <td><%=listDish.get(i).getType()%></td>
                                        <td><img src="dishImages/<%=listDish.get(i).getPicture() %>" style="max-width: 100%;width: 115px;height: 115px;" alt="loading" loading="lazy"> </td>
                                        <td>
                                            <a href="ManagerDish?mode=delete&id=<%=listDish.get(i).getID()%>" class="tm-product-delete-link"/>
                                            <i class="far fa-trash-alt tm-product-delete-icon"></i>

                                        </td>
                                        <td>
                                            <a href="UpdateDish?mode=view&id=<%= listDish.get(i).getID()%>" class="tm-product-delete-link">
                                                <i class="fas fa-pen"></i>                                           
                                            </a>

                                        </td>

                                    </tr>  
                                    <% }%>                                                                      
                                </tbody>
                            </table>
                        </div><!--
                        <!-- table container -->
                        <a href="AddProduct.jsp" class="btn btn-primary btn-block text-uppercase mb-3">Add new dish</a>
                        <button class="btn btn-primary btn-block text-uppercase">
                            Delete selected products
                        </button>
                    </div>
                </div>
            </div>

            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved. 

                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </div>
            </footer>

            <script src="js/jquery-3.3.1.min.js"></script>
            <!-- https://jquery.com/download/ -->
            <script src="js/bootstrap.min.js"></script>
            <!-- https://getbootstrap.com/ -->
            <script>
                $(function () {
                    $(".tm-product-name").on("click", function () {
                        window.location.href = "edit-product.html";
                    });
                });
            </script>
    </body>
</html>