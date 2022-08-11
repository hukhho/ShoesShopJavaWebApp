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
public class CheckoutControl extends HttpServlet {

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
        ////////////
        //String pid = request.getParameter("pid");  

        String path = request.getPathInfo();
        log(path);
        System.out.println(path);

        Dao cartdao = new Dao();

        List<UserCart> cartlist = cartdao.getUserCart(us.getUsername());
        request.setAttribute("cartlist", cartlist);
       
        
        
        HashMap<UserCart, ProductFullInfo> productmap = new HashMap<UserCart, ProductFullInfo>();
        
        List<ProductFullInfo> productlist = cartdao.getAllProductFullInfo();
        
        for (int i = 0; i < cartlist.size(); i++) {
            for (int j = 0; j < productlist.size(); j++) {
                if (cartlist.get(i).getPiid() == productlist.get(j).getPiid())
                    productmap.put(cartlist.get(i), productlist.get(j));
            }
        }
        
        int totalCart = 0;
        
        for (UserCart cart : cartlist) {
            totalCart += cart.getQuantity()*productmap.get(cart).getPrice();
        }

        
        request.setAttribute("productmap", productmap);
        
        Dao dao1 = new Dao();
        User info1 = dao1.getUserInfo(info.getId());

        if (info1.getCash() < totalCart)
        {
            request.setAttribute("errorCash", "Not Enouh Cash To Payment, Please recharge!!!");
        }
            
        request.setAttribute("userinfo", info1);
        request.setAttribute("info1", info1);
        request.setAttribute("totalCart", totalCart);

        RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
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
