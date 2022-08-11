/**
 *
 * @author DUNGHUYNH
 */
package entiry;

public class UserCart {
    
    private int cartnumber;
    private int piid;
    private int quantity;
    private int cartid;

    public UserCart(int cartnumber, int piid, int quatity, int cartid) {
        this.cartnumber = cartnumber;
        this.piid = piid;
        this.quantity = quatity;
        this.cartid = cartid;
    }

    public int getCartnumber() {
        return cartnumber;
    }

    public void setCartnumber(int cartnumber) {
        this.cartnumber = cartnumber;
    }

    public int getPiid() {
        return piid;
    }

    public void setPiid(int piid) {
        this.piid = piid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quatity) {
        this.quantity = quatity;
    }

    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
    }

    @Override
    public String toString() {
        return "UserCart{" + "cartnumber=" + cartnumber + ", piid=" + piid + ", quantity=" + quantity + ", cartid=" + cartid + '}';
    }

    

}

   