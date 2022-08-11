/**
 *
 * @author DUNGHUYNH
 */
package entiry;

public class UserCartFull {
    
    private int cartnumber;
    private int piid;
    private int quatity;
    private int cartid;
    private String username;
    private String pid;
    private String name;
    private String brandname;
    private int price;
    private String review;
    private String image_link;
    private String colorname;
    private int size;
    private int amount;

    public UserCartFull(int cartnumber, int piid, int quatity, int cartid, String username, String pid, String name, String brandname, int price, String review, String image_link, String colorname, int size, int amount) {
        this.cartnumber = cartnumber;
        this.piid = piid;
        this.quatity = quatity;
        this.cartid = cartid;
        this.username = username;
        this.pid = pid;
        this.name = name;
        this.brandname = brandname;
        this.price = price;
        this.review = review;
        this.image_link = image_link;
        this.colorname = colorname;
        this.size = size;
        this.amount = amount;
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

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getImage_link() {
        return image_link;
    }

    public void setImage_link(String image_link) {
        this.image_link = image_link;
    }

    public String getColorname() {
        return colorname;
    }

    public void setColorname(String colorname) {
        this.colorname = colorname;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
}

   