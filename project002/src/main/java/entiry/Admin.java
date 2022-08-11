   /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

/**
 *
 * @author pc
 */
public class Admin {
    private int adminid;
    private String adminname;
    private String adminpass;

    public Admin(int adminid, String adminname, String adminpass) {
        this.adminid = adminid;
        this.adminname = adminname;
        this.adminpass = adminpass;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getAdminpass() {
        return adminpass;
    }

    public void setAdminpass(String adminpass) {
        this.adminpass = adminpass;
    }

    @Override
    public String toString() {
        return "Admin{" + "adminid=" + adminid + ", adminname=" + adminname + ", adminpass=" + adminpass + '}';
    }

    
}
