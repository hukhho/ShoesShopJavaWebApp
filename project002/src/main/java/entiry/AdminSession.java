/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entiry;

import java.util.Date;

/**
 *
 * @author DUNGHUYNH
 */
public class AdminSession {

    private String adminname;
    private Date loginDate;

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public AdminSession(String adminname, Date loginDate) {
        this.adminname = adminname;
        this.loginDate = loginDate;
    }

    @Override
    public String toString() {
        return "AdminSession{" + "adminname=" + adminname + ", loginDate=" + loginDate + '}';
    }


   
 

}
