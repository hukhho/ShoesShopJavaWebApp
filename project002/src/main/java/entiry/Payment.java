/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;


/**
 *
 * @author pc
 */
public class Payment {
    private int paymentid;
    private String paymentmethod;
    private int totalamount;
    private int orderid;
    private String paymentstatus;
    private String paymentdate;

    public Payment(int paymentid, String paymentmethod, int totalamount, int orderid, String paymentstatus, String paymentdate) {
        this.paymentid = paymentid;
        this.paymentmethod = paymentmethod;
        this.totalamount = totalamount;
        this.orderid = orderid;
        this.paymentstatus = paymentstatus;
        this.paymentdate = paymentdate;
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

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getPaymentstatus() {
        return paymentstatus;
    }

    public void setPaymentstatus(String paymentstatus) {
        this.paymentstatus = paymentstatus;
    }

    public String getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(String paymentdate) {
        this.paymentdate = paymentdate;
    }

    @Override
    public String toString() {
        return "Payment{" + "paymentid=" + paymentid + ", paymentmethod=" + paymentmethod + ", totalamount=" + totalamount + ", orderid=" + orderid + ", paymentstatus=" + paymentstatus + ", paymentdate=" + paymentdate + '}';
    }
    

     
}
