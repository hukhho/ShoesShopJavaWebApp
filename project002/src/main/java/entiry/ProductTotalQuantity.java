/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public abstract class ProductTotalQuantity extends Product{
    int totalQuantity; 

    public ProductTotalQuantity(String pid, String name, int brandid, int price, String review, String image_link, String brandname) {
        super(pid, name, brandid, price, review, image_link, brandname);
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    @Override
    public String toString() {
        return "ProductTotalQuantity{" + "totalQuantity=" + totalQuantity + '}';
    }
    
}
