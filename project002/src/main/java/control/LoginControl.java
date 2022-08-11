/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.fptuni.prj301.demo.utils.Something;
import dao.Dao;
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
public class LoginControl extends HttpServlet {

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

        String username = "";
        String password = "";
        String repassword = "";

        Something checkDegit = new Something();

        if (request.getParameter("username") != null && !request.getParameter("username").trim().equals("")) {
            username = request.getParameter("username");
        }
        if (request.getParameter("password") != null && !request.getParameter("password").trim().equals("")) {
            password = request.getParameter("password");
        }
        if (request.getParameter("repassword") != null && !request.getParameter("repassword").trim().equals("")) {
            repassword = request.getParameter("repassword");
        }

        String logout = request.getParameter("logout");
        String reg = request.getParameter("reg");

        HttpSession ss = request.getSession(true);

        UserSession us = (UserSession) ss.getAttribute("usersession");

        if (logout != null) {
            if (logout.equalsIgnoreCase("true")) {
                ss = request.getSession(true);

                ss.setAttribute("usersession", null);

                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }

        } else if (reg != null) {

            if (reg.equalsIgnoreCase("true")) {

                Dao regis = new Dao();

                int checkUsername = -1;

                checkUsername = regis.checkUsername(username);

                if (checkUsername == 0) {
                    if (checkDegit.getSpecialCharacterCount(username) && checkDegit.getSpecialCharacterCount(password) && checkDegit.getSpecialCharacterCount(repassword)) {
                        if ((username.length() > 19 || username.length() < 6) || (password.length() > 19 || password.length() < 6)) {
                            request.setAttribute("mess", "Username and password lenght in 6 to 19 chars and numbers");
                        } else {
                            if (password.equalsIgnoreCase(repassword)) {
                                ss = request.getSession(true);
                                ss.setAttribute("usersession", null);
                                UserSession us1 = regis.regUserSession(username, password);
                                ss = request.getSession(true);
                                ss.setAttribute("usersession", us1);

                                if (us1 != null) {
                                    User info = regis.getUserInfo(us1.getUserid());
                                    ss.setAttribute("userinfo", info);

                                    response.sendRedirect(request.getContextPath() + "/home");
                                    return;
                                } else {
                                    request.setAttribute("mess", "Something Wrong!");
                                }
                            } else {
                                request.setAttribute("mess", "Password and repassword not same!!!");
                            }
                        }
                    } else {
                        request.setAttribute("mess", "Username and password cant not be contains specials char!!");
                    }
                } else {
                    request.setAttribute("mess", "Username already exists!!");
                }
            }

        } else {
            if (username != "" && password != "") {
                Dao dao = new Dao();

                UserSession us1 = dao.loginSession(username, password);

                ss = request.getSession(true);
                ss.setAttribute("usersession", us1);

                if (us1 != null) {
                    User info = dao.getUserInfo(us1.getUserid());
                    ss.setAttribute("userinfo", info);
                    response.sendRedirect(request.getContextPath() + "/home");
                    return;
                } else {
                    request.setAttribute("mess", "Wrong username or password!!");
                }
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
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
