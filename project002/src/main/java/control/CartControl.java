/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.Dao;
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
public class CartControl extends HttpServlet {

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
        
        if (path.equals("/add")) {

            String pid = "";
            
            String colorname = "";
            
            int size = 0;
            int amount = 0;
            int checkAmount = 0;
            
            if (request.getParameter("pid") != null && !request.getParameter("pid").trim().equals("")) {
                pid = request.getParameter("pid");
            }
            if (request.getParameter("colorname") != null && !request.getParameter("colorname").trim().equals("")) {
                colorname = request.getParameter("colorname");
            }
            if (request.getParameter("size") != null && !request.getParameter("size").trim().equals("")) {
                size = Integer.parseInt(request.getParameter("size"));
            }

            if (request.getParameter("amount") != null && !request.getParameter("amount").trim().equals("")) {
                amount = Integer.parseInt(request.getParameter("amount"));
            }

            Dao insertCart = new Dao();
                     
            checkAmount = insertCart.checkAmountProduct(colorname, size, pid);
            
            
            if (amount < 1) {
                String amountCheckError2 = "Amount must >= 1";

                response.sendRedirect(request.getContextPath() + "/productdetail?pid=" + pid + "&errorMess=" + amountCheckError2);
            } else if (checkAmount >= amount && amount > 0) {
                UserCart usc = insertCart.insertToCart(info.getId(), colorname, size, amount, pid);
                response.sendRedirect(request.getContextPath() + "/cart");

            } else {
                String amountCheckError = "Not enough quantity of this product with pid: " + pid + " - color : " + colorname + "  - size: " + size;

                response.sendRedirect(request.getContextPath() + "/productdetail?pid=" + pid + "&errorMess=" + amountCheckError);
            }

        } else if (path.equals("/delete")) {
            int cartnumber = Integer.parseInt(request.getParameter("cartnumber"));
            Dao delete = new Dao();

            int check = delete.deleteCart(info.getId(), cartnumber);

            response.sendRedirect(request.getContextPath() + "/cart");

        } else if (path.equals("/addquantity")) {
            int cartnumber = Integer.parseInt(request.getParameter("cartnumber"));
            Dao dao = new Dao();

            boolean check = dao.addReduceQuantityCart(info.getId(), cartnumber, "add");

            String success = "";
            if (check) {
                success += "true";
            } else {
                success += "false";
            }

            response.sendRedirect(request.getContextPath() + "/cart?success=" + success);

        } else if (path.equals("/reducequantity")) {
            int cartnumber = Integer.parseInt(request.getParameter("cartnumber"));
            Dao dao = new Dao();

            boolean check = dao.addReduceQuantityCart(info.getId(), cartnumber, "reduce");

            String success = "";
            if (check) {
                success += "true";
            } else {
                success += "false";
            }

            response.sendRedirect(request.getContextPath() + "/cart?success=" + success);

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
