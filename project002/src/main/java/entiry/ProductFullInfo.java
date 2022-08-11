/**
 *
 * @author DUNGHUYNH
 */
package entiry;

public class ProductFullInfo {
    private int piid;
    private String pid;
    private String name;
    private String brandname;
    private int price;
    private String review;
    private String image_link;
    private String colorname;
    private int size;
    private int amount;

    public ProductFullInfo(int piid, String pid, String name, String brandname, int price, String review, String image_link, String colorname, int size, int amount) {
        this.piid = piid;
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

    public int getPiid() {
        return piid;
    }

    public void setPiid(int piid) {
        this.piid = piid;
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

    @Override
    public String toString() {
        return "ProductFullInfo{" + "piid=" + piid + ", pid=" + pid + ", name=" + name + ", brandname=" + brandname + ", price=" + price + ", review=" + review + ", image_link=" + image_link + ", colorname=" + colorname + ", size=" + size + ", amount=" + amount + '}';
    }
    
}

   