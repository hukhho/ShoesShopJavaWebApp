/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public class OrderItemList {
    private int itemlistnumber;
    private int itempiid;
    private int itemquantity;
    private int priceitem;
    private int orderid;

    public OrderItemList(int itemlistnumber, int itempiid, int itemquantity, int priceitem, int orderid) {
        this.itemlistnumber = itemlistnumber;
        this.itempiid = itempiid;
        this.itemquantity = itemquantity;
        this.priceitem = priceitem;
        this.orderid = orderid;
    }

    public int getItemlistnumber() {
        return itemlistnumber;
    }

    public void setItemlistnumber(int itemlistnumber) {
        this.itemlistnumber = itemlistnumber;
    }

    public int getItempiid() {
        return itempiid;
    }

    public void setItempiid(int itempiid) {
        this.itempiid = itempiid;
    }

    public int getItemquantity() {
        return itemquantity;
    }

    public void setItemquantity(int itemquantity) {
        this.itemquantity = itemquantity;
    }

    public int getPriceitem() {
        return priceitem;
    }

    public void setPriceitem(int priceitem) {
        this.priceitem = priceitem;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    @Override
    public String toString() {
        return "OrderItemList{" + "itemlistnumber=" + itemlistnumber + ", itempiid=" + itempiid + ", itemquantity=" + itemquantity + ", priceitem=" + priceitem + ", orderid=" + orderid + '}';
    }
    
}
