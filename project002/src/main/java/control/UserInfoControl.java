/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.fptuni.prj301.demo.utils.Something;
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
public class UserInfoControl extends HttpServlet {

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
        log(path);
        System.out.println(path);

        Dao cartdao = new Dao();
        Something checkString = new Something();

        List<UserCart> cartlist = cartdao.getUserCart(us.getUsername());
        request.setAttribute("cartlist", cartlist);

        HashMap<UserCart, ProductFullInfo> productmap = new HashMap<UserCart, ProductFullInfo>();

        List<ProductFullInfo> productlist = cartdao.getAllProductFullInfo();

        for (int i = 0; i < cartlist.size(); i++) {
            for (int j = 0; j < productlist.size(); j++) {
                if (cartlist.get(i).getPiid() == productlist.get(j).getPiid()) {
                    productmap.put(cartlist.get(i), productlist.get(j));
                }
            }
        }

        int totalCart = 0;

        for (UserCart cart : cartlist) {
            totalCart += cart.getQuantity() * productmap.get(cart).getPrice();
        }

        request.setAttribute("productmap", productmap);

        Dao dao1 = new Dao();
        User info1 = dao1.getUserInfo(info.getId());

        request.setAttribute("userinfo", info1);
        request.setAttribute("info1", info1);
        request.setAttribute("totalCart", totalCart);

        //------------------------------------------------------CHANGE PASS-------------------------------------------//
        String changepass = "";
        String updateinfo = "";

        if (request.getParameter("changepass") != null && !request.getParameter("changepass").trim().equals("")) {
            changepass = request.getParameter("changepass");
            if (changepass.equalsIgnoreCase("true")) {

                String oldpass = "";
                String newpass = "";
                String renewpass = "";

                if (request.getParameter("oldpass") != null && !request.getParameter("oldpass").trim().equals("")) {
                    oldpass = request.getParameter("oldpass");
                    if (!oldpass.equalsIgnoreCase(info1.getPassword())) {
                        request.setAttribute("errorChangePass", "Please enter true oldpass");
                    } else {
                        if (request.getParameter("newpass") != null && !request.getParameter("newpass").trim().equals("") && request.getParameter("renewpass") != null && !request.getParameter("renewpass").trim().equals("")) {
                            newpass = request.getParameter("newpass");
                            renewpass = request.getParameter("renewpass");
                            if (newpass.length() < 6 || newpass.length() > 19) {
                                request.setAttribute("errorChangePass", "New pass must >= 6 and < 20 chars and numbers  ");
                            } else if (!checkString.getSpecialCharacterCount(newpass)) {
                                request.setAttribute("errorChangePass", "New pass only chars and numbers, please don't input special characters");
                            } else {
                                if (newpass.equalsIgnoreCase(renewpass)) {
                                    int check = dao1.updatePassUser(info1.getId(), oldpass, newpass);
                                    if (check > 0) {
                                        request.setAttribute("errorChangePass", "Sucess!");
                                    } else {
                                        request.setAttribute("errorChangePass", "Fail!");
                                    }
                                } else {
                                    request.setAttribute("errorChangePass", "Renewpass and pass not same");
                                }
                            }
                        } else {
                            request.setAttribute("errorChangePass", "Please enter vail new pass and re-newpass");
                        }
                    }
                } else {
                    request.setAttribute("errorChangePass", "Please enter vaild oldpass");
                }
                //dao1.updatePassUser(info1.getId(), path, changepass)
            }
        } else if (request.getParameter("updateinfo") != null && !request.getParameter("updateinfo").trim().equals("")) {

            updateinfo = request.getParameter("updateinfo");

            if (updateinfo.equalsIgnoreCase("true")) {
                String name = "";
                String email = "";
                String phone = "";
                String address = "";
                String sex = "";

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

                if (request.getParameter("sex") != null && !request.getParameter("sex").trim().equals("")) {
                    sex = request.getParameter("sex");
                } else {
                    request.setAttribute("errorUpdate", "Please enter sex!");
                }

                Dao update = new Dao();
                Something check = new Something();

                boolean checkUpdate = false;
                if (check.checkPhone(phone) == false) {
                    request.setAttribute("errorUpdate", "Phone not vaild! ");
                } else if (check.isValidEmailAddress(email) == false) {
                    request.setAttribute("errorUpdate", "Email not vaild! ");
                } else if ((name.length() <= 6 || name.length() >= 29)) {
                    request.setAttribute("errorUpdate", "Name must in 6 to 29 length ");
                } else if (!check.getSpecialCharacterCount(name.replaceAll(" ", ""))) {
                    request.setAttribute("errorUpdate", "Name must no special char ");
                } else if ((address.length() <= 6 || address.length() >= 99) ) {
                    request.setAttribute("errorUpdate", "Address must in 6 to 99 length");
                } else if (email.length() <= 6 || email.length() >= 29) {
                    request.setAttribute("errorUpdate", "Email must in 6 to 29 length ");
                } else if (!sex.equalsIgnoreCase("Male") && !sex.equalsIgnoreCase("Fermale")) {
                    request.setAttribute("errorUpdate", sex + "Sex must in Male or Fermale ");
                } else {
                    checkUpdate = update.updateInfo(info1.getId(), name, sex, email, phone, address);
                    if (checkUpdate == true) {
                        request.setAttribute("errorUpdate", "Success!!!");
                    } else {
                        request.setAttribute("errorUpdate", "Something was wrong!! Check again!!!");
                    }
                }
            }
        }

        info1 = dao1.getUserInfo(info.getId());
        request.setAttribute("userinfo", info1);
        request.setAttribute("info1", info1);
        RequestDispatcher rd = request.getRequestDispatcher("userinfo.jsp");
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
