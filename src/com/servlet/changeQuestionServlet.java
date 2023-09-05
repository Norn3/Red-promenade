package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;

public class changeQuestionServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

        String change = req.getParameter("change");
        questionDaoImpl questionDao = new questionDaoImpl();
        if(Objects.equals(change, "new"))
        {
            int qID=Integer.parseInt(req.getParameter("newQID"));
            System.out.println(qID);
            String question = req.getParameter("question");
            String answer1 = req.getParameter("answer1");
            String answer2 = req.getParameter("answer2");
            String answer3 = req.getParameter("answer3");
            String answer4 = req.getParameter("answer4");
            int solution=Integer.parseInt(req.getParameter("solution"));
            question q= new question(qID,question,answer1,answer2,answer3,answer4,solution);
            questionDao.insert(q);
        }
        else if(Objects.equals(change, "change"))
        {
            String  sql = "null";
            int qID=Integer.parseInt(req.getParameter("changeQID"));
            String changeItem = req.getParameter("changeItem");
            if(Objects.equals(changeItem, "newQID"))
            {
                sql = "update questions set qid = ? where qid = ?";
            }
            else if(Objects.equals(changeItem, "question"))
            {
                sql = "update questions set question = ? where qid = ?";
            }
            else if(Objects.equals(changeItem, "answer1"))
            {
                sql = "update questions set answer1 = ? where qid = ?";
            }
            else if(Objects.equals(changeItem, "answer2"))
            {
                sql = "update questions set answer2 = ? where qid = ?";
            }
            else if(Objects.equals(changeItem, "answer3"))
            {
                sql = "update questions set answer3 = ? where qid = ?";
            }
            else if(Objects.equals(changeItem, "answer4"))
            {
                sql = "update questions set answer4 = ? where qid = ?";
            }
            else if(Objects.equals(changeItem, "solution"))
            {
                sql = "update questions set solution = ? where qid = ?";
            }
            String newItem = req.getParameter("newItem");
            questionDao.update(sql,newItem,qID);
        }
        else if(Objects.equals(change, "delete"))
        {
            int qID=Integer.parseInt(req.getParameter("deleteQID"));
            questionDao.delete(qID);
        }
        List<question> list = questionDao.select();  //获得所有题目
        req.setAttribute("list",list);
        req.getRequestDispatcher("manageQues.jsp").forward(req, resp); //跳转
    }
    public void destroy() {
        super.destroy();
    }

}

