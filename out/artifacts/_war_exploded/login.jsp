<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>

    <style>

        body{
            padding-top: 5%;
            text-align: center;
            background: url(./2.png) center 50px no-repeat;
            background-size: 1540px 700px;

        }

        fieldset{
            width: 350px;
        }

        legend{
            text-align:center;
        }

    </style>
</head>
<body>

<script>
    <%
    String err = (String)request.getAttribute("error");
    if(err == "error1")
        {
    %>
            alert("用户账号不存在，请重新输入！");
    <%
        }
    else if(err == "error2")
        {
    %>
            alert("密码错误，请重新输入！")
    <%
        }
    %>

    function check(){
        let id=document.forms[0].userID.value;
        let pwd=document.forms[0].password.value;
        if(!id)
        {
            alert("账号不可为空！");
            return false;
        }
        else if(!pwd)
        {
            alert("密码不可为空！");
            return false;
        }
        else
        {
            document.forms[0].action="login";
        }
    }
</script>

<h1>欢迎登录</h1>
<br>
<form method="post" action="">
    <br />
    &nbsp;账&nbsp;号：&nbsp;
    <input type="text" name="userID" />
    <br />
    &nbsp;密&nbsp;码：&nbsp;
    <input type="password" name="password" />
    <br />

    <p>
        <input type="submit" value="登录" onclick="check()"/>
        <input type="reset" value="重置" />
    </p>
</form>


</body>
</html>