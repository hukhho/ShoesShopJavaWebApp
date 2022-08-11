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
public class AddToOrder extends HttpServlet {

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
        } else {
            String name = "";
            String email = "";
            String phone = "";
            String address = "";

            if (request.getParameter("name") != null && !request.getParameter("name").trim().equals("")) {
                name = request.getParameter("name");
            } else {
                request.setAttribute("errorUpdate", "Please enter name!");
            }

            if (request.getParameter("email") != null && !request.getParameter("email").trim().equals("")) {
                email = request.getParameter("email");
            } else {
                request.setAttribute("errorUpdate", "Please enter email!");
            }

            if (request.getParameter("phone") != null && !request.getParameter("phone").trim().equals("")) {
                phone = request.getParameter("phone");
            } else {
                request.setAttribute("errorUpdate", "Please enter phone!");
            }

            if (request.getParameter("address") != null && !request.getParameter("address").trim().equals("")) {
                address = request.getParameter("address");
            } else {
                request.setAttribute("errorUpdate", "Please enter address!");
            }

            Dao addorder = new Dao();
            Something check = new Something();

            int orderid = -1;

            String errorMessCheckout = " ";

            Something checkDigit = new Something();

            if (check.checkPhone(phone) == false) {
                errorMessCheckout = " Please enter vaild phone!!!";
            } else if (check.isValidEmailAddress(email) == false) {
                errorMessCheckout = (" Please enter vaild mail!!!");
            } else if ((name.length() <= 6 || name.length() >= 29)) {
                errorMessCheckout = (" Name must in 6 to 29 length ");
            } else if (!checkDigit.getSpecialCharacterCount(name.replaceAll(" ", ""))) {
                errorMessCheckout = (" Name must no special char!!! ");
            } else if ((address.length() <= 6 || address.length() >= 99)) {
                errorMessCheckout = (" Address must in 6 to 99 length ");
            } else if (email.length() <= 6 || email.length() >= 29) {
                errorMessCheckout = (" Email must in 6 to 29 length ");
            } else {
                orderid = addorder.addToOrder(info.getId(), address, phone, name);
                if (orderid > 0) {
                    response.sendRedirect(request.getContextPath() + "/orderinfo?orderid=" + orderid);
                    return;
                }
            }

            if (orderid == -1) {
                errorMessCheckout += (" .Fail!");
                response.sendRedirect(request.getContextPath() + "/checkout?errorMess=" + errorMessCheckout);
                return;
            }

        }

//        RequestDispatcher rd = request.getRequestDispatcher("order.jsp");
//        rd.forward(request, response);
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
