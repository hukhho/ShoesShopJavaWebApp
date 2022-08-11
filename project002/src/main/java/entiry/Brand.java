/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public class Brand {
    private int brandid;
    private String brandname;

    public int getBrandid() {
        return brandid;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

    public Brand(int brandid, String brandname) {
        this.brandid = brandid;
        this.brandname = brandname;
    }

    @Override
    public String toString() {
        return "Brand{" + "brandid=" + brandid + ", brandname=" + brandname + '}';
    }


    
}
