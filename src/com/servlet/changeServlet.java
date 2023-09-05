package com.servlet;

import com.dao.informationDao;
import com.servlet.record;
import com.servlet.recordDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

    public class changeServlet extends HttpServlet {
        @Override
        protected void service(HttpServletRequest req, HttpServletResponse resp)
                throws ServletException, IOException {
            req.setCharacterEncoding("utf-8");
            resp.setContentType("text/html;charset=utf-8");

            PrintWriter out = resp.getWriter();

            String uID = req.getParameter("uID");
            String changeItem = req.getParameter("changeItem");
            String sql = "null";
            if(Objects.equals(changeItem, "userName"))
            {
                sql = "update information set userName = ? where userid = ?";
            }
            else if(Objects.equals(changeItem, "userID"))
            {
                sql = "update information set userID = ? where userid = ?";
            }
            else if(Objects.equals(changeItem, "userPassword"))
            {
                sql = "update information set userPassword = ? where userid = ?";
            }
            else if(Objects.equals(changeItem, "userBirth"))
            {
                sql = "update information set userBirth = ? where userid = ?";
            }
            else if(Objects.equals(changeItem, "userSex"))
            {
                sql = "update information set userSex = ? where userid = ?";
            }
            String newItem = req.getParameter("newItem");

            //update信息
            informationDaoImpl informationDao = new informationDaoImpl();
            informationDao.update(sql,newItem,uID);

            //获得新信息
            information info ;
            if(!Objects.equals(changeItem, "userID"))
            {
                info=informationDao.getInformation(uID);
            }
            else
            {
                info=informationDao.getInformation(newItem);
            }
            String change = "y";
            req.setAttribute("info", info);
            req.setAttribute("change", change);
            req.getRequestDispatcher("showInformation.jsp").forward(req, resp); //跳转回展示页面
        }
        public void destroy() {
            super.destroy();
        }

    }
