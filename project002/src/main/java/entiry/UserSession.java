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
public class UserSession {
    private int userid;
    private String username;
    private Date loginDate;

    public UserSession(int userid, String username, Date loginDate) {
        this.userid = userid;
        this.username = username;
        this.loginDate = loginDate;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public UserSession(String username, Date loginDate) {
        this.username = username;
        this.loginDate = loginDate;
    }

   
 

}
