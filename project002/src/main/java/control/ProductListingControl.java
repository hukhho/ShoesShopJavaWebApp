/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.Dao;
import entiry.Brand;
import entiry.Color;
import entiry.Product;
import entiry.ProductFullInfo;
import entiry.User;
import entiry.UserCart;
import entiry.UserSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.persistence.metamodel.SetAttribute;
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
public class ProductListingControl extends HttpServlet {

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

        Dao dao = new Dao();

        List<Brand> listbr = dao.getAllBrand();
        List<Integer> listSize = dao.getAllSize();
        List<Color> listColor = dao.getAllColor();
       

        List<ProductFullInfo> listfull = dao.getAllProductFullInfo();

        request.setAttribute("listbr", listbr);
        request.setAttribute("listSize", listSize);
        request.setAttribute("listColor", listColor);

        int brandid = 0;
        int size = 0;
        int colorid = 0;
        int price1 = 0;
        int price2 = 0;
        int page = 1;
        String orderby = "pid";
        String ascdesc = "asc";
        String searchkey = "";

        if (request.getParameter("brandid") != null && !request.getParameter("brandid").trim().equals("")) {
            brandid = Integer.parseInt(request.getParameter("brandid"));
        }
        if (request.getParameter("size") != null && !request.getParameter("size").trim().equals("")) {
            size = Integer.parseInt(request.getParameter("size"));
        }
        if (request.getParameter("colorid") != null && !request.getParameter("colorid").trim().equals("")) {
            colorid = Integer.parseInt(request.getParameter("colorid"));
        }
        if (request.getParameter("price1") != null && !request.getParameter("price1").trim().equals("")) {
            price1 = Integer.parseInt(request.getParameter("price1"));
        }
        if (request.getParameter("price2") != null && !request.getParameter("price2").trim().equals("")) {
            price2 = Integer.parseInt(request.getParameter("price2"));
        }
        if (request.getParameter("orderby") != null && !request.getParameter("orderby").trim().equals("")) {
            orderby = request.getParameter("orderby");
        }
        if (request.getParameter("ascdesc") != null && !request.getParameter("ascdesc").trim().equals("")) {
            ascdesc = request.getParameter("ascdesc");
        }
        if (request.getParameter("searchkey") != null && !request.getParameter("searchkey").trim().equals("")) {
            searchkey = request.getParameter("searchkey");
        }
        if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        List<Product> listCount = dao.getProductByBrandColorSizePrice(brandid, size, colorid, price1, price2, searchkey, orderby, ascdesc, -1);
      
        request.setAttribute("count1", listCount.size());
        int pageNumber = listCount.size() / 8;     
        int tempPageNumber = listCount.size() % 8;
        if (tempPageNumber != 0) {
            pageNumber++;
        } 
        
        int index = (page-1)*8;
        
        List<Product> list = dao.getProductByBrandColorSizePrice(brandid, size, colorid, price1, price2, searchkey, orderby, ascdesc, index);
        request.setAttribute("listP", list);
        request.setAttribute("count2", list.size());
        request.setAttribute("pageNumber", pageNumber);
        
        if (us != null) {
            Dao cartdao = new Dao();

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
            
            request.setAttribute("productmap", productmap);
            User info1 = dao.getUserInfo(info.getId());

            request.setAttribute("info1", info1);

            request.getRequestDispatcher("productlisting.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("productlisting.jsp").forward(request, response);
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
