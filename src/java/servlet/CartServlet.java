/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import configPkg.ConfigInfo;
import entity.Cart;
import entity.CartItem;
import entity.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import manager.DishManager;

/**
 *
 * @author phuon
 */
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            DishManager myDishManager = new DishManager();
            int count = myDishManager.getByteData();
            

            /* TODO output your page here. You may use following sample code. */
            String mode = request.getParameter("mode");
            String target = "index.jsp";
            HttpSession mySession = request.getSession();
            Cart myCart= (Cart)mySession.getAttribute("myCart");
            
            if(myCart==null)
            {
                 myCart=new Cart(new ArrayList<CartItem>());
            }

            if (mode.equals("addCartItem")) {

                String id = request.getParameter("id");
                Dish tempDish = myDishManager.getDishbyID(id);
                CartItem newItem=new CartItem(tempDish, 1);
                myCart.addItem(newItem);
                mySession.setAttribute("myCart", myCart);

                
                 target = "shopping-cart.jsp";
                 
//                int totalCost = 0;
//                int quantity = 0;
//                mySession.setAttribute("total", totalCost);
//                int value = (Integer) mySession.getAttribute("total");
//                String id = request.getParameter("id");
//                Dish tempDish = myDishManager.getDishbyID(id);
//                int price = tempDish.getPrice();
//                quantity += 1;
//                value = price * quantity;
//                target = "shopping-cart.jsp";
//                request.setAttribute("tempDish", tempDish);
//                ArrayList list = (ArrayList) request.getAttribute("temDish");
//                mySession.setAttribute("listCart", list);
//                mySession.setAttribute("totalValue", value);
//                mySession.setAttribute("quantity", quantity);

            }

            if (mode.equals("delete")) {
                String id = request.getParameter("idCart");
                String mess = "nothing";
                if (myDishManager.deleteDishbyID(id)) {
                    mess = "Delete Successful";
                    myDishManager.saveByteData();
                } else {
                    mess = "Delete failed";
                }
                target = "CartServlet?mode=addCartItem";

                request.setAttribute("mess", mess);

            }
            RequestDispatcher dis = request.getRequestDispatcher(target);
            dis.forward(request, response);

        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
