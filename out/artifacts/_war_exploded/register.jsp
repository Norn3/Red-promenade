<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>

    <style>

        body{
            padding-top: 5%;
            text-align: center;
            background: url(./R.jpg) center no-repeat;
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
    function check(){
        let name=document.forms[0].userName.value;
        let id=document.forms[0].userID.value;
        let pwd=document.forms[0].password.value;
        let pwde=document.forms[0].passwordEnsure.value;
        if(!name)
        {
            alert("用户名不可为空！");
            return false;
        }
        else if(!id)
        {
            alert("账号不可为空！");
            return false;
        }
        else if(!pwd)
        {
            alert("密码不可为空！");
            return false;
        }
        else if(!pwde)
        {
            alert("确认密码不可为空！");
            return false;
        }
        else if(pwd!==pwde)
        {
            alert("密码与确认密码不一致！");
            return false;
        }
        else
        {
            document.forms[0].action="register";
        }
    }
</script>

<h1>欢迎注册</h1>
<br>
<form method="post" action="">
    &nbsp;姓&nbsp;名：&nbsp;
    <input type="text" name="userName" />
    <br />
    &nbsp;账&nbsp;号：&nbsp;
    <input type="text" name="userID" />
    <br />
    &nbsp;密&nbsp;码：&nbsp;
    <input type="password" name="password" />
    <br />
    确认密码：&nbsp;
    <input type="password" name="passwordEnsure" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    出生年月：
    <select id="birthYear" name="birthYear">
        <option value="2000">2000</option>
        <option value="2001">2001</option>
        <option value="2002">2002</option>
        <option value="2003">2003</option>
        <option value="2004">2004</option>
        <option value="2005">2005</option>
    </select>
    年
    <select id="birthMonth" name="birthMonth">
        <option value="01">1</option>
        <option value="02">2</option>
        <option value="03">3</option>
        <option value="04">4</option>
        <option value="05">5</option>
        <option value="06">6</option>
        <option value="07">7</option>
        <option value="08">8</option>
        <option value="09">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
    </select>
    月

    <br />
    <br />
    性别：
    <input type="radio" name="userSex" value="男" />男
    <input type="radio" name="userSex" value="女" checked="checked" />女
    <br />
    <br />
    <p>
        <input type="submit" value="注册" onclick="check()"/>
        <input type="reset" value="重置" />
    </p>
</form>


</body>
</html>