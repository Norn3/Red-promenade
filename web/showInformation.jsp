<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.servlet.information" %>
<%@ page import="static java.util.Objects.toString" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <title>用户信息</title>
    <style>
        table{
            margin-left: 610px;
            background-color: #e0f8ff;
            text-align: center;
            position: center;
            width: 300px;
            height: 300px;
        }
        #ask{
            margin-right: 300px;
            margin-top: 10px;
            padding-top: 14px;
            float: right;
            width: 150px;
            height: 30px;
            border-radius: 10px;
            background-color: #ea3e3e;
        }
        #change{
            margin-left: 300px;
            margin-top: 10px;
            padding-top: 14px;
            float: left;
            width: 150px;
            height: 30px;
            border-radius: 10px;
            background-color: #a3f1ff;
        }
        #ques{
            margin-right: 400px;
            margin-top: 10px;
            padding-top: 14px;
            float: right;
            width: 300px;
            height: 30px;
            border-radius: 10px;
            background-color: #ffe2e2;
        }
        #rec{
            margin-left: 400px;
            margin-top: 10px;
            padding-top: 14px;
            float: left;
            width: 300px;
            height: 30px;
            border-radius: 10px;
            background-color: #e5fffc;
        }
    </style>
</head>
<body style="text-align: center; background-image: url(./3.png)">
<%
    information info = (information)request.getAttribute("info");
    String change = (String)request.getAttribute("change");
    if(change=="y"){
%>
    <h3 style="color: #dac7f1">修改已完成！</h3>
<%}%>
<h2 align="center">用户信息</h2>
<table border=0px >
    <tr>
        <td>用户名:</td>
        <td><%=info.getName()%></td>
    </tr>
    <tr>
        <td>账号:</td>
        <td><%=info.getUID()%></td>
    </tr>
    <tr>
        <td>性别:</td>
        <td><%=info.getSex()%></td>
    </tr>
    <tr>
        <td>出生年月:</td>
        <td><%=info.getBirth()%></td>
    </tr>
    <tr>
        <td>权限:</td>
        <td><%=info.getAuthority()%></td>
    </tr>
</table>
<div >
    <%
        if(Objects.equals(info.getUID(), "admin"))
        {%>
    <div id="ques">
        <a style="text-decoration: none; color: #ac85c5" href="admin?authority=question">进入题目管理界面</a>
    </div>
    <div id="rec">
        <a style="text-decoration: none; color: #dca7af" href="admin?authority=record">进入用户答题记录浏览页面</a>
    </div>

    <%}%>
</div>
<div>
    <div id="change">
        <a style="text-decoration: none; color: #d283bc" href="login?change=y&userID=<%=info.getUID()%>&password=<%=info.getPassword()%>">更改账户信息</a>
    </div>
    <div id="ask">
        <a style="text-decoration: none; color: #ffd145" href="showQues?uID=<%=info.getUID()%>">党建知识竞答</a>
    </div>
</div>




</body>
</html>
