/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public class OrderFullInfo {

    // select op.ORDERID, op.USERID, op.ORDERDATE, cus.ADDRESS, cus.CASH, cus.EMAIL, cus.ID, cus.NAME, cus.PASSWORD, cus.PHONE, cus.REGTIME, cus.SEX, cus.USERNAME,pay.ORDERID,pay.ORDERID,pay.PAYMENTDATE,pay.PAYMENTID,pay.PAYMENTMETHOD,pay.PAYMENTSTATUS,pay.TOTALAMOUNT,SHIP.DELIVERYSTARTDATE,ship.SHIPID,SHIP.SHIPNAME,SHIP.SHIPPHONE,SHIP.SHIPSTATUS from ORDERPRODUCT op join CUSTOMER cus on op.USERID=cus.ID join payment pay on pay.ORDERID=op.ORDERID join ship on op.ORDERID=ship.ORDERID
    public OrderFullInfo(int orderid, int userid, String orderdate, int id, String username, String name, int shipid, String deliverystartdate, String shipstatus, int paymentid, String paymentmethod, int totalamount, String paymentstatus) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.id = id;
        this.username = username;
        this.name = name;
        this.shipid = shipid;
        this.deliverystartdate = deliverystartdate;
        this.shipstatus = shipstatus;
        this.paymentid = paymentid;
        this.paymentmethod = paymentmethod;
        this.totalamount = totalamount;
        this.paymentstatus = paymentstatus;
    }
    private int orderid;
    private int userid;
    private String orderdate;
    
    private int id;
    private String username;
    private String name;
    
    private int shipid;
    private String deliverystartdate;
    private String shipstatus;

    private int paymentid;
    private String paymentmethod;
    private int totalamount;
    private String paymentstatus;

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getShipid() {
        return shipid;
    }

    public void setShipid(int shipid) {
        this.shipid = shipid;
    }

    public String getDeliverystartdate() {
        return deliverystartdate;
    }

    public void setDeliverystartdate(String deliverystartdate) {
        this.deliverystartdate = deliverystartdate;
    }

    public String getShipstatus() {
        return shipstatus;
    }

    public void setShipstatus(String shipstatus) {
        this.shipstatus = shipstatus;
    }

    public int getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(int paymentid) {
        this.paymentid = paymentid;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public int getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(int totalamount) {
        this.totalamount = totalamount;
    }

    public String getPaymentstatus() {
        return paymentstatus;
    }

    public void setPaymentstatus(String paymentstatus) {
        this.paymentstatus = paymentstatus;
    }

    @Override
    public String toString() {
        return "OrderFullInfo{" + "orderid=" + orderid + ", userid=" + userid + ", orderdate=" + orderdate + ", id=" + id + ", username=" + username + ", name=" + name + ", shipid=" + shipid + ", deliverystartdate=" + deliverystartdate + ", shipstatus=" + shipstatus + ", paymentid=" + paymentid + ", paymentmethod=" + paymentmethod + ", totalamount=" + totalamount + ", paymentstatus=" + paymentstatus + '}';
    }
    
    
}
