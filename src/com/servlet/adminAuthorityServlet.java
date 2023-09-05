package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

public class adminAuthorityServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

        String authority = req.getParameter("authority");

        if(Objects.equals(authority, "question"))
        {
            questionDaoImpl service = new questionDaoImpl();
            List<question> list = service.select();  //获得所有题目
            req.setAttribute("list",list);
            req.getRequestDispatcher("manageQues.jsp").forward(req,resp);
        }
        else if(Objects.equals(authority, "record"))
        {
            recordDaoImpl recordDao = new recordDaoImpl();
            List<record> list = recordDao.select();  //获得所有答题记录
            req.setAttribute("recordList",list);
            req.getRequestDispatcher("viewRecord.jsp").forward(req,resp);
        }

    }
    public void destroy() {
        super.destroy();
    }

}