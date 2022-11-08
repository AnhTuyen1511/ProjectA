/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.oreilly.servlet.MultipartRequest;
import configPkg.ConfigInfo;
import entity.Dish;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class addNewProductServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            DishManager myDishManager = new DishManager();
            myDishManager.getByteData();
          
            String target = "ViewProduct.jsp";
            String ID, name, description, type;
            int price;
            ID = request.getParameter("idDish");
            name =  request.getParameter("name");
            description = request.getParameter("description");
            price = Integer.parseInt(request.getParameter("price"));
            type = request.getParameter("type");
            String pictureName = ID+".jpg";
            Part imgFilePart = request.getPart("image");
            
            
            Dish newDish = new Dish(ID, name, type, price, description, pictureName);

//            tempDish.add(newDish);
            System.out.println(newDish.getDescription() + "-------------");
            String mess = "nothing";
            if (myDishManager.addDish(newDish)) {
                mess = "Add success";
                myDishManager.saveByteData();
                imgFilePart.write(ConfigInfo.getCtxRealPath() + "\\dishImages\\" + pictureName);
            } else {
                mess = " Add failed";
            }
            request.setAttribute("mess", mess);
            target = "ManagerDish?mode=view";

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
