/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import entity.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manager.DishManager;

/**
 *
 * @author phuon
 */
public class ManagerDishServlet extends HttpServlet {

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
            /* TODO output your page here. You mayn use following sample code. */
            DishManager myDishManager = new DishManager();
            int count = myDishManager.getByteData();

            String mode = request.getParameter("mode");
            String target = "Home.jsp";

            if (mode.equals("view")) {
                ArrayList<Dish> listDish = myDishManager.getListDish();
                System.out.println("servlet get" + listDish.size() + "-----");
                target = "ViewProduct.jsp";
                request.setAttribute("listDish", listDish);
            }

            if (mode.equals("delete")) {
                String id = request.getParameter("id");
                String mess = "nothing";
                if (myDishManager.deleteDishbyID(id)) {
                    mess = "Delete Successful";
                    myDishManager.saveByteData();
                } else {
                    mess = "Delete failed";
                }
                target = "ManagerDish?mode=view";

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
