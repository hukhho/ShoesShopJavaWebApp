/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import entiry.LogDeleted;
import dao.Dao;
import entiry.Admin;
import entiry.AdminSession;
import entiry.Brand;
import entiry.Color;
import entiry.OrderFullInfo;
import entiry.OrderItemList;
import entiry.OrderProduct;
import entiry.Product;
import entiry.ProductFullInfo;
import entiry.ProductTotalQuantity;
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
public class AdminControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @SuppressWarnings("null")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession ssss = request.getSession(true);
        AdminSession ad = (AdminSession) ssss.getAttribute("adminsession");

        Admin info = (Admin) ssss.getAttribute("admininfo");

        if (ad == null) {
            response.sendRedirect(request.getContextPath() + "/adminlogin");
            return;
        }

        //Create new dao     
        Dao adminDao = new Dao();
        //Get path  
        String path = request.getPathInfo();

        //if path is 
        if (path == null) {

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);

        } else if (path.equals("/logsomething") && path != null) {
            request.setAttribute("tittle", "logsomething");

            int page = 1;

            if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<LogDeleted> log1 = adminDao.logDeleted(-1);
            List<LogDeleted> log2 = adminDao.logDeleted(page);
            int totalLog = log1.size();
            int totalShow = log2.size();

            int totalPage = (int) Math.ceil((double) totalLog / 10);

            request.setAttribute("totalLog", totalLog);
            request.setAttribute("totalShow", totalShow);

            request.setAttribute("totalPage", totalPage);

            request.setAttribute("listL", log2);

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);

        } else if (path.contains("/order") && path != null) {

            request.setAttribute("tittle", "order");

            String orderby = "orderid";
            String ascdesc = "asc";
            String searchkey = "";
            String searchfield = "name";
            int page = 1;

            if (request.getParameter("orderby") != null && !request.getParameter("orderby").trim().equals("")) {
                orderby = request.getParameter("orderby");
            }
            if (request.getParameter("ascdesc") != null && !request.getParameter("ascdesc").trim().equals("")) {
                ascdesc = request.getParameter("ascdesc");
            }
            if (request.getParameter("searchkey") != null && !request.getParameter("searchkey").trim().equals("")) {
                searchkey = request.getParameter("searchkey");
            }
            if (request.getParameter("searchfield") != null && !request.getParameter("searchfield").trim().equals("")) {
                searchfield = request.getParameter("searchfield");
            }
            if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<OrderFullInfo> listorder = adminDao.getFullInfoOrderByAdmin(page, orderby, ascdesc, searchkey, searchfield);
            List<OrderFullInfo> listorder1 = adminDao.getFullInfoOrderByAdmin(-1, orderby, ascdesc, searchkey, searchfield);

            int totalOrder = listorder1.size();
            int totalShow = listorder.size();

            int totalPage = (int) Math.ceil((double) totalOrder / 10);

            request.setAttribute("totalOrder", totalOrder);
            request.setAttribute("totalShow", totalShow);

            request.setAttribute("totalPage", totalPage);
            request.setAttribute("listO", listorder);

            if (path.equals("/order/shiptocustomer")) {
                request.setAttribute("status", "null");

                int orderid = 0;

                if (request.getParameter("orderid") != null) {
                    if (Integer.parseInt(request.getParameter("orderid")) > 0) {
                        orderid = Integer.parseInt(request.getParameter("orderid"));

                        String status = adminDao.shipToCustomer(orderid, info.getAdminid());
                        if (status.contains("Success")) {
                            request.setAttribute("statusColor", "green");
                        } else {
                            request.setAttribute("statusColor", "red");
                        }
                        request.setAttribute("status", "Shipping to orderid: " + orderid + " " + status);

                    }
                } else {
                    request.setAttribute("status", "null");
                }

                listorder = adminDao.getFullInfoOrderByAdmin(page, orderby, ascdesc, searchkey, searchfield);
                request.setAttribute("listO", listorder);

            } else if (path.equals("/order/doneship") && path != null) {

                int orderid = 0;

                if (request.getParameter("orderid") != null) {
                    if (Integer.parseInt(request.getParameter("orderid")) > 0) {
                        orderid = Integer.parseInt(request.getParameter("orderid"));

                        String status = adminDao.doneShip(orderid, info.getAdminid());
                        if (status.contains("Success")) {
                            request.setAttribute("statusColor", "green");
                        } else {
                            request.setAttribute("statusColor", "red");
                        }

                        request.setAttribute("status", "Done Ship to orderid: " + orderid + " " + status);

                        listorder = adminDao.getFullInfoOrderByAdmin(page, orderby, ascdesc, searchkey, searchfield);
                        request.setAttribute("listO", listorder);
                    }
                } else {
                    request.setAttribute("status", "null");
                }

            } else if (path.equals("/order/vieworder") && path != null) {
                int itemuserid = 0;
                if (request.getParameter("itemuserid") != null && !request.getParameter("itemuserid").trim().equals("")) {
                    itemuserid = Integer.parseInt(request.getParameter("itemuserid"));
                }
                int itemorderid = 0;
                if (request.getParameter("itemorderid") != null && !request.getParameter("itemorderid").trim().equals("")) {
                    itemorderid = Integer.parseInt(request.getParameter("itemorderid"));
                }

                if (request.getParameter("itemuserid") != null && request.getParameter("itemorderid") != null) {
                    if (Integer.parseInt(request.getParameter("itemuserid")) > 0 && Integer.parseInt(request.getParameter("itemorderid")) > 0) {

                        itemuserid = Integer.parseInt(request.getParameter("itemuserid"));
                        itemorderid = Integer.parseInt(request.getParameter("itemorderid"));

                        List<OrderItemList> listitem = adminDao.getOrderListItem(itemorderid, itemuserid);

                        HashMap<OrderItemList, ProductFullInfo> ordermap = new HashMap<OrderItemList, ProductFullInfo>();

                        List<ProductFullInfo> productlist = adminDao.getAllProductFullInfo();

                        for (int i = 0; i < listitem.size(); i++) {
                            for (int j = 0; j < productlist.size(); j++) {
                                if (listitem.get(i).getItempiid() == productlist.get(j).getPiid()) {
                                    ordermap.put(listitem.get(i), productlist.get(j));
                                }
                            }
                        }

                        request.setAttribute("ordermap", ordermap);
                        if (listitem != null) {
                            request.setAttribute("open", "true");
                            request.setAttribute("listitem", listitem);
                        }
                    }
                }

            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);

        } else if (path.contains("/user") && path != null) {

            String orderby = "id";
            String ascdesc = "asc";
            String searchkey = "";
            String searchfield = "username";
            int page = 1;

            if (request.getParameter("orderby") != null && !request.getParameter("orderby").trim().equals("")) {
                orderby = request.getParameter("orderby");
            }
            if (request.getParameter("ascdesc") != null && !request.getParameter("ascdesc").trim().equals("")) {
                ascdesc = request.getParameter("ascdesc");
            }
            if (request.getParameter("searchkey") != null && !request.getParameter("searchkey").trim().equals("")) {
                searchkey = request.getParameter("searchkey");
            }
            if (request.getParameter("searchfield") != null && !request.getParameter("searchfield").trim().equals("")) {
                searchfield = request.getParameter("searchfield");
            }
            if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<User> u = adminDao.getUserInfoByAdmin(orderby, page, ascdesc, searchkey, searchfield);
            List<User> u1 = adminDao.getUserInfoByAdmin(orderby, -1, ascdesc, searchkey, searchfield);
            List<User> full = adminDao.getUserInfoByAdmin("id", -1, "asc", "", "username");

            int totalUser = u1.size();
            int totalShow = u.size();

            int totalPage = (int) Math.ceil((double) totalUser / 10);
            request.setAttribute("listuser", u);
            request.setAttribute("tittle", "user");
            request.setAttribute("totalUser", totalUser);
            request.setAttribute("totalShow", totalShow);

            request.setAttribute("totalPage", totalPage);

            if (path.contains("/user/edituser")) {
                int userid = 0;

                if (path.equals("/user/edituser") && request.getParameter("userid") != null) {
                    if (Integer.parseInt(request.getParameter("userid")) > 0) {

                        userid = Integer.parseInt(request.getParameter("userid"));
                        User userinfo = null;

                        for (User x : full) {
                            if (userid == x.getId()) {
                                userinfo = x;
                            }
                        }

                        if (userinfo != null) {
                            request.setAttribute("open", "true");
                            request.setAttribute("userid", userinfo.getId());
                            request.setAttribute("name", userinfo.getName());
                            request.setAttribute("pass", userinfo.getPassword());
                            request.setAttribute("sex", userinfo.getSex());
                            request.setAttribute("email", userinfo.getEmail());
                            request.setAttribute("phone", userinfo.getPhone());
                            request.setAttribute("address", userinfo.getAddress());
                            request.setAttribute("cash", userinfo.getCash());
                        }

                        if (request.getParameter("submit") != null && userid > 0) {
                            if (request.getParameter("submit").equals("true")) {
                                userid = Integer.parseInt(request.getParameter("userid"));
                                String name = request.getParameter("name");
                                String pass = request.getParameter("pass");
                                String sex = request.getParameter("sex");
                                String email = request.getParameter("email");
                                String phone = request.getParameter("phone");
                                String address = request.getParameter("address");
                                int cash = Integer.parseInt(request.getParameter("cash"));

                                String status = adminDao.editUser(info.getAdminid(), userid, name, pass, sex, email, phone, address, cash);

                                u = adminDao.getUserInfoByAdmin(orderby, page, ascdesc, searchkey, searchfield);

                                request.setAttribute("listuser", u);

                                if (status != null && status.contains("Success")) {
                                    request.setAttribute("statusColor", "green");
                                } else {
                                    request.setAttribute("statusColor", "red");
                                }

                                request.setAttribute("status", "Edit user: " + userid + " " + status);

                                if (status == null) {
                                    request.setAttribute("status", "Edit user: " + "FAIL!! Please enter vaild value");
                                }
                                request.setAttribute("open", "false");
                            }
                        }
                    }
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                    rd.forward(request, response);
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);

        } else if (path.contains("/product") && path != null) {
            Dao dao = new Dao();

            String orderby = "pid";
            String ascdesc = "asc";
            String searchkey = "";
            String searchfield = "name";
            int page = 1;

            if (request.getParameter("orderby") != null && !request.getParameter("orderby").trim().equals("")) {
                orderby = request.getParameter("orderby");
            }
            if (request.getParameter("ascdesc") != null && !request.getParameter("ascdesc").trim().equals("")) {
                ascdesc = request.getParameter("ascdesc");
            }
            if (request.getParameter("searchkey") != null && !request.getParameter("searchkey").trim().equals("")) {
                searchkey = request.getParameter("searchkey");
            }
            if (request.getParameter("searchfield") != null && !request.getParameter("searchfield").trim().equals("")) {
                searchfield = request.getParameter("searchfield");
            }
            if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<ProductTotalQuantity> listproduct1 = dao.getAllProduct(page, orderby, ascdesc, searchkey, searchfield);
            List<ProductTotalQuantity> listproduct2 = dao.getAllProduct(-1, orderby, ascdesc, searchkey, searchfield);

            int totalShow = listproduct1.size();
            int totalProduct = listproduct2.size();

            int totalPage = (int) Math.ceil((double) totalProduct / 10);

            request.setAttribute("totalProduct", totalProduct);
            request.setAttribute("totalShow", totalShow);
            request.setAttribute("listP", listproduct1);
            request.setAttribute("totalPage", totalPage);

            List<Brand> listbr = dao.getAllBrand();

            request.setAttribute("tittle", "product");
            request.setAttribute("listbr", listbr);

            if (path.contains("/product/addproduct") && path != null) {
                {
                    if (request.getParameter("submit") != null) {
                        if (request.getParameter("submit").equals("true")) {
                            String pid;
                            int brandid = 0;
                            int price = 0;
                            String name = "";
                            String review = "";
                            String image_link = "";

                            if (request.getParameter("pid") != null) {
                                pid = request.getParameter("pid");
                            } else {
                                request.setAttribute("errorMess", "Add product fail! " + " pid " + " can't be empty!!!");
                                return;
                            }
                            if (Integer.parseInt(request.getParameter("brandid")) != 0) {
                                brandid = Integer.parseInt(request.getParameter("brandid"));
                            } else {
                                request.setAttribute("errorMess", "Add product fail! " + " brandid " + " can't be empty!!!");
                                return;
                            }
                            if (request.getParameter("price") != null) {
                                price = Integer.parseInt(request.getParameter("price"));
                            } else {
                                request.setAttribute("errorMess", "Add product fail! " + " price " + " can't be empty!!!");
                                return;
                            }
                            if (request.getParameter("name") != null) {
                                name = request.getParameter("name");
                            } else {
                                request.setAttribute("errorMess", "Add product fail! " + " image_link " + " can't be empty!!!");
                                return;
                            }
                            if (request.getParameter("review") != null) {
                                review = request.getParameter("review");
                            } else {
                                request.setAttribute("errorMess", "Add product fail! " + " review " + " can't be empty!!!");
                                return;
                            }

                            if (request.getParameter("image_link") != null) {
                                image_link = request.getParameter("image_link");
                            } else {
                                request.setAttribute("errorMess", "Add product fail! " + " image_link " + " can't be empty!!!");
                                return;
                            }

                            boolean status = adminDao.addNewProduct(pid, name, brandid, price, review, image_link);

                            if (status) {
                                request.setAttribute("statusColor", "green");
                                request.setAttribute("status", "Add product user: " + pid + " " + status);
                            } else {
                                request.setAttribute("statusColor", "red");
                                request.setAttribute("status", "Add product user: " + " " + status);
                            }

                            listproduct1 = dao.getAllProduct(page, orderby, ascdesc, searchkey, searchfield);
                            request.setAttribute("listP", listproduct1);

                            request.setAttribute("tittle", "product");
                            request.setAttribute("listbr", listbr);
                        }
                    }
                }
            }

            if (path.contains("/product/editproduct") && path != null) {
                String pid;
                if (path.contains("/product/editproduct") && request.getParameter("pid") != null) {
                    if (request.getParameter("pid") != null) {
                        pid = request.getParameter("pid");
                        Product productInfo = null;
                        List<Product> list = dao.getAllProduct();
                        for (Product x : list) {
                            if (pid.equalsIgnoreCase(x.getPid())) {
                                productInfo = x;
                            }
                        }

                        if (productInfo != null) {
                            request.setAttribute("openEdit", "true");
                            request.setAttribute("pid", productInfo.getPid());
                            request.setAttribute("name", productInfo.getName());
                            request.setAttribute("brandid", productInfo.getBrandid());
                            request.setAttribute("price", productInfo.getPrice());
                            request.setAttribute("review", productInfo.getReview());
                            request.setAttribute("image_link", productInfo.getImage_link());
                        }

                        if (request.getParameter("submit") != null && pid != null) {
                            if (request.getParameter("submit").equals("true")) {

                                pid = request.getParameter("pid");
                                String name = request.getParameter("name");
                                int brandid = Integer.parseInt(request.getParameter("brandid"));
                                int price = Integer.parseInt(request.getParameter("price"));

                                String review = request.getParameter("review");
                                String image_link = request.getParameter("image_link");

                                boolean status = adminDao.editProduct(pid, name, brandid, price, review, image_link);

                                request.setAttribute("openEdit", "false");

                                if (status) {
                                    request.setAttribute("statusColor", "green");
                                    request.setAttribute("status", "Edit product: " + pid + " " + status);
                                } else {
                                    request.setAttribute("statusColor", "red");
                                    request.setAttribute("status", "Edit product: " + " " + status);
                                }
                                listproduct1 = dao.getAllProduct(page, orderby, ascdesc, searchkey, searchfield);
                                request.setAttribute("listP", listproduct1);

                                request.setAttribute("tittle", "product");
                                request.setAttribute("listbr", listbr);

                            }
                        }
                    }
                }
            }

            if (path.contains("/product/delete") && path != null) {
                String pid;
                if (path.contains("/product/delete") && request.getParameter("pid") != null) {
                    if (request.getParameter("pid") != null) {
                        pid = request.getParameter("pid");

                        if (request.getParameter("submit") != null && pid != null && request.getParameter("submit") != null) {
                            if (request.getParameter("submit").equals("true")) {

                                pid = request.getParameter("pid");

                                String status = adminDao.deleteProduct(pid, info.getAdminid());

                                if (status.equalsIgnoreCase("Success")) {
                                    request.setAttribute("statusColor", "green");
                                    request.setAttribute("status", "Delete product: " + pid + " " + status);
                                } else {
                                    request.setAttribute("statusColor", "red");
                                    request.setAttribute("status", "Delete product: " + " " + status);
                                }
                                listproduct1 = dao.getAllProduct(page, orderby, ascdesc, searchkey, searchfield);
                                request.setAttribute("listP", listproduct1);

                                request.setAttribute("tittle", "product");
                                request.setAttribute("listbr", listbr);
                            }
                        }
                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);
        } else if (path.contains("/inventory") && path != null) {
            Dao dao = new Dao();

            String orderby = "piid";
            String ascdesc = "asc";
            String searchkey = "";
            String searchfield = "name";
            int page = 1;

            if (request.getParameter("orderby") != null && !request.getParameter("orderby").trim().equals("")) {
                orderby = request.getParameter("orderby");
            }
            if (request.getParameter("ascdesc") != null && !request.getParameter("ascdesc").trim().equals("")) {
                ascdesc = request.getParameter("ascdesc");
            }
            if (request.getParameter("searchkey") != null && !request.getParameter("searchkey").trim().equals("")) {
                searchkey = request.getParameter("searchkey");
            }
            if (request.getParameter("searchfield") != null && !request.getParameter("searchfield").trim().equals("")) {
                searchfield = request.getParameter("searchfield");
            }
            if (request.getParameter("page") != null && !request.getParameter("page").trim().equals("")) {
                page = Integer.parseInt(request.getParameter("page"));
            }
            List<ProductFullInfo> listproduct1 = dao.getAllProductFullInfo(page, orderby, ascdesc, searchkey, searchfield);
            List<ProductFullInfo> listproduct2 = dao.getAllProductFullInfo(-1, orderby, ascdesc, searchkey, searchfield);

            int totalShow = listproduct1.size();
            int totalProduct = listproduct2.size();

            int totalPage = (int) Math.ceil((double) totalProduct / 10);

            request.setAttribute("totalProduct", totalProduct);
            request.setAttribute("totalShow", totalShow);
            request.setAttribute("listP", listproduct1);
            request.setAttribute("totalPage", totalPage);

            request.setAttribute("listfull", listproduct1);
            request.setAttribute("tittle", "inventory");

            List<Color> listcl1 = dao.getAllColor();
            request.setAttribute("listcl", listcl1);

            if (path.contains("/inventory/add") && path != null) {
                {
                    if (request.getParameter("submit") != null) {
                        if (request.getParameter("submit").equals("true")) {
                            String pid;
                            int size = 0;
                            int colorid = 0;
                            int amount = 0;

                            if (request.getParameter("pid") != null) {
                                pid = request.getParameter("pid");
                            } else {
                                request.setAttribute("errorMess", "Add Inventory fail! " + " pid " + " can't be empty!!!");
                                return;
                            }
                            if (Integer.parseInt(request.getParameter("size")) >= 30 && Integer.parseInt(request.getParameter("size")) <= 50 && request.getParameter("size") != null) {
                                size = Integer.parseInt(request.getParameter("size"));
                            } else {
                                request.setAttribute("errorMess", "Add Inventory fail! " + " Size " + " need >= 30 && <= 50");
                                return;
                            }

                            if (Integer.parseInt(request.getParameter("colorid")) > 0 && request.getParameter("colorid") != null) {
                                colorid = Integer.parseInt(request.getParameter("colorid"));
                            } else {
                                request.setAttribute("errorMess", "Add Inventory fail! " + " Colorid " + " not vaild!!!");
                                return;
                            }
                            if (Integer.parseInt(request.getParameter("amount")) > 0 && request.getParameter("amount") != null) {
                                amount = Integer.parseInt(request.getParameter("amount"));
                            } else {
                                request.setAttribute("errorMess", "Add Inventory fail! " + " amount " + " not vaild!!!");
                                return;
                            }

                            boolean status = adminDao.addInventory(pid, size, colorid, amount);

                            if (status) {
                                request.setAttribute("statusColor", "green");
                                request.setAttribute("status", "Add inventory " + pid + " " + status);
                            } else {
                                request.setAttribute("statusColor", "red");
                                request.setAttribute("status", "Add inventory : " + pid + " " + status);
                            }

                            List<ProductFullInfo> listfull1 = dao.getAllProductFullInfo(page, orderby, ascdesc, searchkey, searchfield);
                            listcl1 = dao.getAllColor();

                            request.setAttribute("listfull", listfull1);
                            request.setAttribute("listcl", listcl1);
                        }
                    }
                }
            }

            if (path.contains("/inventory/edit") && path != null) {
                {
                    if (request.getParameter("submit") != null) {
                        if (request.getParameter("submit").equals("true")) {
                            int piid = 0;
                            int amount = 0;

                            if (Integer.parseInt(request.getParameter("piid")) > 0 && request.getParameter("piid") != null) {
                                piid = Integer.parseInt(request.getParameter("piid"));
                            } else {
                                request.setAttribute("errorMess", "Edit Inventory fail! " + " PIID " + " need > 0");
                                return;
                            }

                            if (Integer.parseInt(request.getParameter("amount")) >= 0 && request.getParameter("amount") != null) {
                                amount = Integer.parseInt(request.getParameter("amount"));
                            } else {
                                request.setAttribute("errorMess", "Edit Inventory fail! " + " amount " + " need >= 0");
                                return;
                            }

                            boolean status = adminDao.updateAmount(piid, amount);

                            if (status) {
                                request.setAttribute("statusColor", "green");
                                request.setAttribute("status", "Edit inventory " + piid + " " + status);
                            } else {
                                request.setAttribute("statusColor", "red");
                                request.setAttribute("status", "Edit inventory : " + piid + " " + status);
                            }

                            List<ProductFullInfo> listfull1 = dao.getAllProductFullInfo(page, orderby, ascdesc, searchkey, searchfield);
                            listcl1 = dao.getAllColor();

                            request.setAttribute("listfull", listfull1);
                            request.setAttribute("listcl", listcl1);
                        }
                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);
        } else if (path.equals("/brand") && path != null) {
            Dao dao = new Dao();
            List<Brand> br = dao.getAllBrand();

            request.setAttribute("brand", br);
            request.setAttribute("tittle", "brand");

            request.setAttribute("edit", "false");
            request.setAttribute("add", "false");
            request.setAttribute("delete", "false");

            String edit = "false";

            if (request.getParameter("edit") != null) {
                if (request.getParameter("edit").equalsIgnoreCase("true")) {
                    edit = request.getParameter("edit");
                    request.setAttribute("edit", "true");
                }
            }

            if (request.getParameter("submit") != null) {
                if (request.getParameter("submit").equalsIgnoreCase("true")) {
                    if (request.getParameter("editbrandid") != null && request.getParameter("editbrandname") != null) {
                        if (!request.getParameter("editbrandid").equals("") && !request.getParameter("editbrandname").equals("")) {
                            Dao editDao = new Dao();
                            int editbrandid = Integer.parseInt(request.getParameter("editbrandid"));

                            String editbrandname = request.getParameter("editbrandname");

                            boolean check = editDao.editBrand(editbrandid, editbrandname);
                            if (check) {
                                request.setAttribute("errorEditBrand", "Success!!!");
                            } else {
                                request.setAttribute("errorEditBrand", "Fail!!");
                            }
                            List<Brand> brand = dao.getAllBrand();
                            request.setAttribute("brand", brand);

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("errorEditBrand", "Brandid and brand name cant not be null");

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorEditBrand", "Brandid and brand name cant not be null");

                        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }
                }
            }

            String add = "false";
            if (request.getParameter("add") != null) {
                if (request.getParameter("add").equalsIgnoreCase("true")) {
                    edit = request.getParameter("add");
                    request.setAttribute("add", "true");
                }
            }

            if (request.getParameter("submitadd") != null) {
                if (request.getParameter("submitadd").equalsIgnoreCase("true")) {
                    if (request.getParameter("addbrandname") != null) {
                        if (!request.getParameter("addbrandname").equals("")) {
                            Dao addDao = new Dao();

                            String addbrandname = request.getParameter("addbrandname");

                            boolean check = addDao.insertBrand(addbrandname);

                            if (check) {
                                request.setAttribute("errorAddBrand", "Success!!!");
                            } else {
                                request.setAttribute("errorAddBrand", "Fail!!");
                            }
                            List<Brand> brand = dao.getAllBrand();
                            request.setAttribute("brand", brand);

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("errorAddBrand", "Brandname cant not be null");

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorAddBrand", "Brand name cant not be null");

                        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }
                }
            }

            String delete = "false";

            if (request.getParameter("delete") != null) {
                if (request.getParameter("delete").equalsIgnoreCase("true")) {
                    edit = request.getParameter("delete");
                    request.setAttribute("delete", "true");
                }
            }

            if (request.getParameter("submitdelete") != null) {
                if (request.getParameter("submitdelete").equalsIgnoreCase("true")) {
                    if (request.getParameter("deletebrandid") != null) {
                        if (!request.getParameter("deletebrandid").equals("")) {
                            Dao deleteDao = new Dao();
                            int deletebrandid = Integer.parseInt(request.getParameter("deletebrandid"));

                            String editbrandname = request.getParameter("editbrandname");

                            deleteDao.deleteBrand(deletebrandid, info.getAdminid());

                            List<Brand> brand = dao.getAllBrand();
                            request.setAttribute("brand", brand);

                            int countCheck = 0;

                            for (Brand x : brand) {
                                if (deletebrandid == x.getBrandid()) {
                                    countCheck += 1;
                                }
                            }

                            if (countCheck == 0) {
                                request.setAttribute("errorDeleteBrand", "Success!!!");
                            } else {
                                request.setAttribute("errorDeleteBrand", "Fail!!");
                            }

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("errorDeleteBrand", "Brandid cant not be null");

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorDeleteBrand", "Brandid  cant not be null");

                        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);

        } else if (path.equals("/color") && path != null) {
            Dao dao = new Dao();
            List<Color> cl = dao.getAllColor();

            request.setAttribute("color", cl);
            request.setAttribute("tittle", "color");

            request.setAttribute("edit", "false");
            request.setAttribute("add", "false");
            request.setAttribute("delete", "false");

            String edit = "false";

            if (request.getParameter("edit") != null) {
                if (request.getParameter("edit").equalsIgnoreCase("true")) {
                    edit = request.getParameter("edit");
                    request.setAttribute("edit", "true");
                }
            }

            if (request.getParameter("submit") != null) {
                if (request.getParameter("submit").equalsIgnoreCase("true")) {
                    if (request.getParameter("editcolorid") != null && request.getParameter("editcolorname") != null) {
                        if (!request.getParameter("editcolorid").equals("") && !request.getParameter("editcolorname").equals("")) {
                            Dao editDao = new Dao();
                            int editcolorid = Integer.parseInt(request.getParameter("editcolorid"));

                            String editcolorname = request.getParameter("editcolorname");

                            boolean check = editDao.editColor(editcolorid, editcolorname);
                            if (check) {
                                request.setAttribute("errorEditColor", "Success!!!");
                            } else {
                                request.setAttribute("errorEditColor", "Fail!!");
                            }
                            List<Color> cl1 = dao.getAllColor();
                            request.setAttribute("color", cl1);

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("errorEditColor", "Colorid and Colorname cant not be null");

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorEditColor", "Colorid and Colorname cant not be null");

                        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }
                }
            }

            String add = "false";
            if (request.getParameter("add") != null) {
                if (request.getParameter("add").equalsIgnoreCase("true")) {
                    edit = request.getParameter("add");
                    request.setAttribute("add", "true");
                }
            }

            if (request.getParameter("submitadd") != null) {
                if (request.getParameter("submitadd").equalsIgnoreCase("true")) {
                    if (request.getParameter("addcolorname") != null) {
                        if (!request.getParameter("addcolorname").equals("")) {
                            Dao addDao = new Dao();

                            String addcolorname = request.getParameter("addcolorname");

                            boolean check = addDao.insertColor(addcolorname);

                            if (check) {
                                request.setAttribute("errorAddColor", "Success!!!");
                            } else {
                                request.setAttribute("errorAddColor", "Fail!!");
                            }
                            List<Color> cl1 = dao.getAllColor();
                            request.setAttribute("color", cl1);

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("errorAddColor", "Colorname cant not be null");

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorAddColor", "Colorname name cant not be null");

                        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }
                }
            }

            String delete = "false";

            if (request.getParameter("delete") != null) {
                if (request.getParameter("delete").equalsIgnoreCase("true")) {
                    edit = request.getParameter("delete");
                    request.setAttribute("delete", "true");
                }
            }

            if (request.getParameter("submitdelete") != null) {
                if (request.getParameter("submitdelete").equalsIgnoreCase("true")) {
                    if (request.getParameter("deletecolorid") != null) {
                        if (!request.getParameter("deletecolorid").equals("")) {
                            Dao deleteDao = new Dao();
                            int deletecolorid = Integer.parseInt(request.getParameter("deletecolorid"));

                            deleteDao.deleteColor(deletecolorid, info.getAdminid());

                            List<Color> cl1 = dao.getAllColor();
                            request.setAttribute("color", cl1);

                            int countCheck = 0;
                            for (Color x : cl1) {
                                if (deletecolorid == x.getColorid()) {
                                    countCheck += 1;
                                }
                            }

                            if (countCheck == 0) {
                                request.setAttribute("errorDeleteColor", "Success!!!");
                            } else {
                                request.setAttribute("errorDeleteColor", "Fail!!");
                            }

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        } else {
                            request.setAttribute("errorDeleteColor", "Colorid cant not be null");

                            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                            rd.forward(request, response);
                        }
                    } else {
                        request.setAttribute("errorDeleteColor", "Colorid  cant not be null");

                        RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
                        rd.forward(request, response);
                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/admin.jsp");
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
