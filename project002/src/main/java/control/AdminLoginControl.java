/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.Dao;
import entiry.Admin;
import entiry.AdminSession;
import entiry.User;
import entiry.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
public class AdminLoginControl extends HttpServlet {

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

        String adminname = request.getParameter("adminname");
        String adminpass = request.getParameter("adminpass");
        
        String logout = request.getParameter("logout");

        HttpSession ssss = request.getSession(true);
        AdminSession ad = (AdminSession) ssss.getAttribute("adminsession");

        if (logout != null) {
            if (logout.equalsIgnoreCase("true")) {
                HttpSession ss = request.getSession(true);

                ss.setAttribute("adminsession", null);
                
                
                response.sendRedirect(request.getContextPath() + "/home");
            }
            return;
        } else {
            if (ad != null) {
                response.sendRedirect(request.getContextPath() + "/admin/order");
                return;
            } else {
                Dao login = new Dao();
                Admin a = login.loginAdmin(adminname, adminpass);

                if (a != null) {
                    AdminSession admin = new AdminSession(a.getAdminname(), new Date());

                    HttpSession ss = request.getSession(true);

                    ss.setAttribute("adminsession", admin);
                    ss.setAttribute("admininfo", a);

                    if (admin != null) {
                        response.sendRedirect(request.getContextPath() + "/admin/order");
                    } else {
                        request.setAttribute("mess", "Wrong username or password1");
                        RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
                        rd.forward(request, response);
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
                    rd.forward(request, response);

                }
            }
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
