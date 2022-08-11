/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.fptuni.prj301.demo.utils.Something;
import dao.Dao;
import entiry.OrderItemList;
import entiry.OrderProduct;
import entiry.Payment;
import entiry.Product;
import entiry.ProductFullInfo;
import entiry.User;
import entiry.UserCart;
import entiry.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pc
 */
public class UserControl extends HttpServlet {

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

        HttpSession ss = request.getSession();
        UserSession us = (UserSession) ss.getAttribute("usersession");
        User info = (User) ss.getAttribute("userinfo");

        if (us == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String path = request.getPathInfo();

        if (path.equals("/updateinfo") && path != null && path != "") {

            String name = "";
            String email = "";
            String phone = "";
            String address = "";
            
            if (request.getParameter("name") != null && !request.getParameter("name").trim().equals("")) {
                name = request.getParameter("name");
            } 
            if (request.getParameter("email") != null && !request.getParameter("email").trim().equals("")) {
                email = request.getParameter("email");
            }
            if (request.getParameter("phone") != null && !request.getParameter("phone").trim().equals("")) {
                phone = request.getParameter("phone");
            }
            if (request.getParameter("address") != null && !request.getParameter("address").trim().equals("")) {
                address = request.getParameter("address");
            }
            
            Dao update = new Dao();
            Something check = new Something();

            String errorMess = null;
            boolean checkUpdate = false;

            if (check.checkPhone(phone) == false) {
                errorMess = "Please enter vaild phone!!!";
            } else if (check.isValidEmailAddress(email) == false) {
                errorMess.concat(" Please enter vaild mail!!!");
            } else if (name.length() <= 3) {
                errorMess.concat(" Please enter least 3 character!!!");
            } else if (address.length() <= 5) {
                errorMess.concat(" Please enter least 5 character!!!");
            } else {
                //checkUpdate = update.updateInfo(info.getId(), name, email, phone, address);
            }

            if (errorMess != null) {
                response.sendRedirect(request.getContextPath() + "/checkout?" + "errorMess=" + errorMess + "&update=" + checkUpdate);
            } else {
                response.sendRedirect(request.getContextPath() + "/checkout?update=" + checkUpdate);
            }

        } else if (path.equals("/delete")) {
            
            
            
            RequestDispatcher rd = request.getRequestDispatcher("/test.jsp");
            rd.forward(request, response);
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
