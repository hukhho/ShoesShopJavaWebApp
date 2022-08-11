/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public class OrderProduct {
    private int orderid;
    private int userid;
    private String orderdate;

    public OrderProduct(int orderid, int userid, String orderdate) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    @Override
    public String toString() {
        return "OrderProduct{" + "orderid=" + orderid + ", userid=" + userid + ", orderdate=" + orderdate + '}';
    }


    
}
