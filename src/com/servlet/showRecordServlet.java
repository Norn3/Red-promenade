package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class showRecordServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

        String uID = req.getParameter("uID");
        int q1 = Integer.parseInt(req.getParameter("q1"));
        int q2 = Integer.parseInt(req.getParameter("q2"));
        int q3 = Integer.parseInt(req.getParameter("q3"));
        int q4 = Integer.parseInt(req.getParameter("q4"));
        int q5 = Integer.parseInt(req.getParameter("q5"));
        int a1 = Integer.parseInt(req.getParameter("a1"));
        int a2 = Integer.parseInt(req.getParameter("a2"));
        int a3 = Integer.parseInt(req.getParameter("a3"));
        int a4 = Integer.parseInt(req.getParameter("a4"));
        int a5 = Integer.parseInt(req.getParameter("a5"));
        int score = Integer.parseInt(req.getParameter("score"));
        System.out.println(uID+"  "+q1+a1+"  "+q2+a2+"  "+q3+a3+"  "+q4+a4+"  "+q5+a5+"  "+score);

        //根据userID获取答题记录
        recordDaoImpl recordDao = new recordDaoImpl();
        record newRecord =new record(uID,q1,a1,q2,a2,q3,a3,q4,a4,q5,a5,score);
        recordDao.insert(newRecord);

        List<record> list ;
        list=recordDao.getRecord(uID);

        req.setAttribute("uID", uID);
        req.setAttribute("recordList", list);
        req.getRequestDispatcher("showRecord.jsp").forward(req, resp); //跳转回登陆页面

    }
    public void destroy() {
        super.destroy();
    }

}