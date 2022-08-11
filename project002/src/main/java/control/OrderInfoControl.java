/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;


import dao.Dao;
import entiry.OrderItemList;
import entiry.Payment;
import entiry.Product;
import entiry.ProductFullInfo;
import entiry.Ship;
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
public class OrderInfoControl extends HttpServlet {

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

        Dao orderinfo = new Dao();
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        
        List<OrderItemList> itemlist = orderinfo.getOrderListItem(orderid, info.getId());
        
       // List<UserCart> cartlist = cartdao.getUserCart(us.getUsername());
        request.setAttribute("itemlist", itemlist);

        HashMap<OrderItemList, ProductFullInfo> ordermap = new HashMap<OrderItemList, ProductFullInfo>();

        List<ProductFullInfo> productlist = orderinfo.getAllProductFullInfo();

        for (int i = 0; i < itemlist.size(); i++) {
            for (int j = 0; j < productlist.size(); j++) {
                if (itemlist.get(i).getItempiid()== productlist.get(j).getPiid()) {
                    ordermap.put(itemlist.get(i), productlist.get(j));
                }
            }
        }

        request.setAttribute("ordermap", ordermap);
        request.setAttribute("userinfo", info);
        
        request.setAttribute("orderid", orderid);
        int totalOrder = orderinfo.getTotalOrder(orderid, info.getId());
        request.setAttribute("totalOrder", totalOrder);
        
        Payment payment = orderinfo.getPayment(orderid, info.getId());
        request.setAttribute("payment", payment);
        
        Ship ship = orderinfo.getShip(orderid, info.getId());
        request.setAttribute("ship", ship);
        
        User info1 = orderinfo.getUserInfo(info.getId());
        
        request.setAttribute("info1", info1);
        
        RequestDispatcher rd = request.getRequestDispatcher("orderinfo.jsp");
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
