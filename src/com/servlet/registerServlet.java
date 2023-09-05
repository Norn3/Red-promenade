package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class registerServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

        String userID = req.getParameter("userID");
        String userName = req.getParameter("userName");
        String userPassword = req.getParameter("password");
        String userSex = req.getParameter("userSex");
        String userBirthY = req.getParameter("birthYear");
        String userBirthM = req.getParameter("birthMonth");

        String userBirth = userBirthY+"-"+userBirthM;

        information info = new information();
        info.setUID(userID);
        info.setName(userName);
        info.setPassword(userPassword);
        info.setSex(userSex);
        info.setBirth(userBirth);
        info.setAuthority("普通用户");

        //将信息存入数据库
        informationDaoImpl information = new informationDaoImpl();
        information.insert(info);

        req.setAttribute("info", info);
        req.getRequestDispatcher("showInformation.jsp").forward(req, resp); //跳转
    }
    public void destroy() {
        super.destroy();
    }

}

