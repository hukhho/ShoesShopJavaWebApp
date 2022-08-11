/**
 *
 * @author DUNGHUYNH
 */
package entiry;

public class Product {
    
    private String pid;
    private String name;
    private int brandid;
    private int price;
    private String review;
    private String image_link;
    private String brandname;

    public Product(String pid, String name, int brandid, int price, String review, String image_link, String brandname) {
        this.pid = pid;
        this.name = name;
        this.brandid = brandid;
        this.price = price;
        this.review = review;
        this.image_link = image_link;
        this.brandname = brandname;
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

    public int getBrandid() {
        return brandid;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
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

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

    @Override
    public String toString() {
        return "Product{" + "pid=" + pid + ", name=" + name + ", brandid=" + brandid + ", price=" + price + ", review=" + review + ", image_link=" + image_link + ", brandname=" + brandname + '}';
    }

    
    
 
}
