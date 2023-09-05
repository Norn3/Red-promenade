package com.servlet;

public class information {
    /*information实体类*/
    private String userID;
    private String userName;
    private String userPassword;
    private String userSex;
    private String userBirth;
    private String userAuthority;


    public information() {
    }

    public information(String userID,String userName,String userPassword,String userSex,String userBirth,String userAuthority) {
        this.userID = userID;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userSex = userSex;
        this.userBirth = userBirth;
        this.userAuthority = userAuthority;
    }

    public String getUID() {
        return userID;
    }

    public void setUID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return userName;
    }

    public void setName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return userPassword;
    }

    public void setPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getSex() {
        return userSex;
    }

    public void setSex(String userSex) {
        this.userSex = userSex;
    }
    public String getBirth() {
        return userBirth;
    }

    public void setBirth(String userBirth) {
        this.userBirth = userBirth;
    }
    public String getAuthority() {
        return userAuthority;
    }

    public void setAuthority(String userAuthority) {
        this.userAuthority = userAuthority;
    }

    @Override
    public String toString() {
        return "information{" +
                "uID=" + userID +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userSex='" + userSex + '\'' +
                ", userBirth='" + userBirth + '\'' +
                ", userAuthority=" + userAuthority +
                '}';
    }

}