<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Dish"%>
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
                    <a class="navbar-brand" href="index.html">
                        <h1 class="tm-site-title mb-0">Product Admin</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link active" href="ManagerDish?mode=view">
                                    <i class="far fa-file-alt"></i>
                                    Reports
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link"  href="ManagerDish?mode=view">
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


                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>


                                        <tr>
                                            <th scope="col">&nbsp;</th>
                                            <th scope="col">ID </th>
                                            <th scope="col">DISH NAME</th>
                                            <th scope="col">UNIT SOLD</th>
                                            <th scope="col">STATUS</th>
                                            <th scope="col">&nbsp;</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><input type="checkbox" /></th>
                                            <td></td>
                                            <td class="tm-product-name"></td>
                                            <td>1</td>

                                            <td></td>

                                            <td>
                                                <a href="UpdateStatus.jsp" class="tm-product-delete-link">
                                                    <i class="fas fa-pen"></i>                                          
                                                </a>

                                            </td>
                                        </tr>
                                       

                                    </tbody>
                                </table>
                            </div>
                            <!-- table container -->
                        </div>
                    </div>
                </div>
                <footer class="tm-footer row tm-mt-small">
                    <div class="col-12 font-weight-light">
                        <p class="text-center text-white mb-0 px-4 small">
                            Copyright ? <b>2018</b> All rights reserved.
                        </p>
                    </div>
                </footer>
            </div>

            <script src="js/jquery-3.3.1.min.js"></script>
            <!-- https://jquery.com/download/ -->
            <script src="js/moment.min.js"></script>
            <!-- https://momentjs.com/ -->
            <script src="js/Chart.min.js"></script>
            <!-- http://www.chartjs.org/docs/latest/ -->
            <script src="js/bootstrap.min.js"></script>
            <!-- https://getbootstrap.com/ -->
            <script src="js/tooplate-scripts.js"></script>
            <script>
                Chart.defaults.global.defaultFontColor = 'white';
                let ctxLine,
                        ctxBar,
                        ctxPie,
                        optionsLine,
                        optionsBar,
                        optionsPie,
                        configLine,
                        configBar,
                        configPie,
                        lineChart;
                barChart, pieChart;
                // DOM is ready
                $(function () {
                    drawLineChart(); // Line Chart
                    drawBarChart(); // Bar Chart
                    drawPieChart(); // Pie Chart

                    $(window).resize(function () {
                        updateLineChart();
                        updateBarChart();
                    });
                })
            </script>
    </body>

</html>