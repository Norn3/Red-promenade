<%@ page import="com.servlet.record" %>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.recordDaoImpl" %>
<%@ page import="com.servlet.questionDaoImpl" %>
<%@ page import="com.servlet.turnString" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>答题记录</title>
    <style>
        table{
           margin-left: 450px;
        }
        body{
            background: url(./4.png);
            background-size: 1540px 700px;
        }
    </style>
</head>
<body>
<%
    List<record> list = (List<record>) request.getAttribute("recordList");
    String uID = (String) request.getAttribute("uID");
    questionDaoImpl questionDao = new questionDaoImpl();
    turnString t =new turnString();
    int i = 1;
    if(list==null){System.out.println("list is empty");}
%>
<a href="showQues?uID=<%=uID%>" style="text-decoration: none"><——点击返回继续答题</a><br/>
<h2 style="text-align: center"><%=uID%>的答题记录</h2>
<%
        for(record r:list){
%>
<table width="700px" align="center" border="0px">
    <tr><td><br/>第<%=i++%>次答题记录</td></tr>
    <tr><td>1.<%=questionDao.getQuestion(r.getQID1()).getQuestion()%></td></tr>
    <tr><td>回答：<%=t.turn(r.getAnswer1()) %>&nbsp;&nbsp;答案：<%=t.turn(questionDao.getQuestion(r.getQID1()).getSolution())%></td></tr>
    <tr><td>2.<%=questionDao.getQuestion(r.getQID2()).getQuestion()%></td></tr>
    <tr><td>回答：<%=t.turn(r.getAnswer2()) %>&nbsp;&nbsp;答案：<%=t.turn(questionDao.getQuestion(r.getQID2()).getSolution())%></td></tr>
    <tr><td>3.<%=questionDao.getQuestion(r.getQID3()).getQuestion()%></td></tr>
    <tr><td>回答：<%=t.turn(r.getAnswer3()) %>&nbsp;&nbsp;答案：<%=t.turn(questionDao.getQuestion(r.getQID3()).getSolution())%></td></tr>
    <tr><td>4.<%=questionDao.getQuestion(r.getQID4()).getQuestion()%></td></tr>
    <tr><td>回答：<%=t.turn(r.getAnswer4()) %>&nbsp;&nbsp;答案：<%=t.turn(questionDao.getQuestion(r.getQID4()).getSolution())%></td></tr>
    <tr><td>5.<%=questionDao.getQuestion(r.getQID5()).getQuestion()%></td></tr>
    <tr><td>回答：<%=t.turn(r.getAnswer5()) %>&nbsp;&nbsp;答案：<%=t.turn(questionDao.getQuestion(r.getQID5()).getSolution())%></td></tr>
    <tr><td>成绩：<%=r.getScore()%></td></tr>
    <tr><td><br/></td></tr>
</table>
<%}%>
</body>
</html>
