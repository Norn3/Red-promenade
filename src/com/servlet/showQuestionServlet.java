package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class showQuestionServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin","*");
        questionDaoImpl service = new questionDaoImpl();
        List<question> list = service.select();  //获得所有题目
        request.setAttribute("list",list);
        String uID=request.getParameter("uID");
        request.setAttribute("uID",uID);
        request.getRequestDispatcher("main.jsp").forward(request,response);
    }

}