package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

public class loginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

        String userID = req.getParameter("userID");
        String userPassword = req.getParameter("password");
        String change = req.getParameter("change");

        //根据userID获取用户信息
        informationDaoImpl information = new informationDaoImpl();
        information info=information.getInformation(userID);
        if(info==null)
        {
            String error = "error1";
            req.setAttribute("error", error);
            req.getRequestDispatcher("login.jsp").forward(req, resp); //跳转回登陆页面
        }
        else if(!Objects.equals(info.getPassword(), userPassword))
        {
            String error = "error2";
            req.setAttribute("error", error);
            req.getRequestDispatcher("login.jsp").forward(req, resp); //跳转回登陆页面
        }
        else
        {
            req.setAttribute("info", info);
            if(Objects.equals(change, "y"))
            {
                req.getRequestDispatcher("changeInformation.jsp").forward(req, resp); //跳转到信息页面
            }
            else
            {
                req.getRequestDispatcher("showInformation.jsp").forward(req, resp); //跳转到信息页面
            }
        }

    }
    public void destroy() {
        super.destroy();
    }

}