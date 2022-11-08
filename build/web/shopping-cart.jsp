<%-- 
    Document   : shopping-cart
    Created on : May 17, 2022, 6:23:22 PM
    Author     : duchuydeptraivodich
--%>
<%@page import="entity.Cart"%>
<%@page import="entity.Dish"%>

<%@page import="entity.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>Shopping Cart</title>

        <style>
            body {
                font-family: Arial;
                font-size: 17px;
                padding: 8px;
            }

            * {
                box-sizing: border-box;
            }

            .row {
                display: -ms-flexbox; /* IE10 */
                display: flex;
                -ms-flex-wrap: wrap; /* IE10 */
                flex-wrap: wrap;
                margin: 0 -16px;
            }

            .col-25 {
                -ms-flex: 25%; /* IE10 */
                flex: 25%;
            }

            .col-50 {
                -ms-flex: 50%; /* IE10 */
                flex: 50%;
            }

            .col-75 {
                -ms-flex: 75%; /* IE10 */
                flex: 75%;
            }

            .col-25,
            .col-50,
            .col-75 {
                padding: 0 16px;
            }

            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }

            input[type=text] {
                width: 100%;
                margin-bottom: 20px;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            label {
                margin-bottom: 10px;
                display: block;
            }

            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
            }

            .btn {
                background-color: #04AA6D;
                color: white;
                padding: 12px;
                margin: 10px 0;
                border: none;
                width: 100%;
                border-radius: 3px;
                cursor: pointer;
                font-size: 17px;
            }

            .btn:hover {
                background-color: #45a049;
            }

            a {
                color: #2196F3;
            }

            hr {
                border: 1px solid lightgrey;
            }

            span.price {
                float: right;
                color: grey;
            }
            .bill{
                width: 600px;
                text-align: right;
                font-size: 30px;
                color: #fff;
                margin-left: auto;


            }
            #legalcopy{
                text-align: center;
                font-size: 30px;
                color: black;

            }
            .billTable{
                margin-right: auto;
            }
            h2{
                color: black;
            }
            p{
                color: black;
            }
            .table{
                font-size: 15px;
                color: black;
            }
            #checkout{
                padding-top: 10px;
                text-align: center;
                margin-left: auto;
                margin-right: auto;

            }

            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .col-25 {
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>

        <a href="ClientAddDishServlet?mode=viewdish">Continue Order</a>
        <hr>





        <div class="col-25">
            <div class="container">
                <table class="table">
                    <thead>
                        <% 
                            Cart myCart=(Cart)request.getSession().getAttribute("myCart");
                            ArrayList<CartItem> listItem = myCart.getListItem() ; 
                        
                        
                        %>
                        


                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Dish</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">#</th>
                        </tr>
                    </thead>
                    <tbody>
                      
                        <% for (int i = 0; i < listItem.size(); i++){ %>
                        <tr>
                            <th scope="row"></th>
                            <td> <%=listItem.get(i).getDish().getName()%></td>
                            <td> <%=listItem.get(i).getQuantity() %></td>
                            <td><%=listItem.get(i).getDish().getPrice() %></td>
                            <td>
                                <a href="ManagerDish?mode=delete&id=<%=listItem.get(i).getDish().getID()%>" class="tm-product-delete-link"/>
                                <i class="far fa-trash-alt tm-product-delete-icon"></i>
                            </td>

                        </tr>
                       <%}%>


                        <!--                        <tr>
                                                    <th scope="row">2</th>
                                                    <td>Salad</td>
                                                    <td>3</td>
                                                    <td>150.000</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                    <td>Chips</td>
                                                    <td>4</td>
                                                    <td>50.000</td>
                                                </tr>-->
                    </tbody>
                </table>
                <div class="billTable">
                    <table class="bill"">
                        <tr>
                            <th style="color: black">Total:</th>
                            <th style="color: black"><%=myCart.getTotal() %></th>
                        </tr>
                    </table> 
                </div>

            </div>
        </div>
        <div id="checkout"><input name="chkout" type="submit" value="Checkout"  style="margin-left: auto" />
        </div>




    </body>
</html>

