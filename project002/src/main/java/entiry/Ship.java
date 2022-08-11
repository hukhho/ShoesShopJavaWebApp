/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public class Ship {
    private int shipid;
    private String deliverystartdate;
    private int orderid;
    private String shipstatus;
    private String shipaddress;
    private String shipphone;
    private String shipname;

    public Ship(int shipid, String deliverystartdate, int orderid, String shipstatus, String shipaddress, String shipphone, String shipname) {
        this.shipid = shipid;
        this.deliverystartdate = deliverystartdate;
        this.orderid = orderid;
        this.shipstatus = shipstatus;
        this.shipaddress = shipaddress;
        this.shipphone = shipphone;
        this.shipname = shipname;
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

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public String getShipstatus() {
        return shipstatus;
    }

    public void setShipstatus(String shipstatus) {
        this.shipstatus = shipstatus;
    }

    public String getShipaddress() {
        return shipaddress;
    }

    public void setShipaddress(String shipaddress) {
        this.shipaddress = shipaddress;
    }

    public String getShipphone() {
        return shipphone;
    }

    public void setShipphone(String shipphone) {
        this.shipphone = shipphone;
    }

    public String getShipname() {
        return shipname;
    }

    public void setShipname(String shipname) {
        this.shipname = shipname;
    }

    @Override
    public String toString() {
        return "Ship{" + "shipid=" + shipid + ", deliverystartdate=" + deliverystartdate + ", orderid=" + orderid + ", shipstatus=" + shipstatus + ", shipaddress=" + shipaddress + ", shipphone=" + shipphone + ", shipname=" + shipname + '}';
    }
    
    
}
