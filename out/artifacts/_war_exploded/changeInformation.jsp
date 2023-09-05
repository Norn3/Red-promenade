<%@ page import="com.servlet.information" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更改个人信息</title>
</head>
<body>
<%
    information info = (information)request.getAttribute("info");
%>
<h3 style="text-align: center">请按原格式更改个人信息，并点击更改按钮</h3>
<form method="post" name="hidden form">
    <input type="hidden" name="uID" value="<%=info.getUID()%>">
    <input type="hidden" name="changeItem" id="changeItem" value="">
    <input type="hidden" name="newItem" id="newItem" value="">
</form>
<br /><br />
<form style="margin-left: 600px" >
    &nbsp;姓&nbsp;名：&nbsp;
    <input type="text" id="userName" value="<%=info.getName()%>" onfocus="this.value=null"/>
    <input type="button" value="更改用户名" onclick="sendTo('userName')">
    <br /><br />
    &nbsp;账&nbsp;号：&nbsp;
    <input type="text" id="userID" value="<%=info.getUID()%>" onfocus="this.value=null" />
    <input type="button" value="更改账号" onclick="sendTo('userID')">
    <br /><br />
    &nbsp;密&nbsp;码：&nbsp;
    <input type="password" id="userPassword" value="<%=info.getPassword()%>" onfocus="this.value=null"/>
    <input type="button" value="更改密码" onclick="sendTo('userPassword')">
    <br /><br />
    出生年月：
    <input type="text" id="userBirth" value="<%=info.getBirth()%>" onfocus="this.value=null"/>
    <input type="button" value="更改出生年月" onclick="sendTo('userBirth')">
    <br /><br />
    性别：
    <input type="text" id="userSex" value="<%=info.getSex()%>" onfocus="this.value=null"/>
    <input type="button" value="更改性别" onclick="sendTo('userSex')">
    <br /><br />
    <p>
        <input type="reset" value="重置" style="margin-left: 150px"/>
    </p>
</form>
<script>
        function sendTo(id){
        let inside = document.getElementById(id).value;
        console.log(id+" "+inside)
        let changeID = id;
        if(changeID === "userName" || changeID === "userID"  || changeID === "userPassword")
        {
            if(inside == null )
            {
                alert("不可为空！");
                return false;
            }
        }
        document.getElementById("changeItem").value=changeID;
        document.getElementById("newItem").value=inside;
        document.forms['hidden form'].action="changeInfo";
        document.forms['hidden form'].submit();
        console.log(document.forms['hidden form']);
    };

</script>
</body>

</html>
