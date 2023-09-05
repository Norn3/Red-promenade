<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <style>
        body{
            background: url(./1.png) center no-repeat;
            background-size: 1540px 700px;
        }
        * {
            box-sizing: border-box;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        /* 为每个链接设定样式 */
        .item {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 25px;
            text-decoration: none;
        }
        /* 鼠标放置链接时改变样式 */
        .menu:hover      /*聚焦menu，改变自身*/
        {
            background-color: #f34949;
            color: white;
        }

        .menu {
            display: inline-block;
        }

        /* 下拉菜单设置样式 */
        .submenu {
            /* 隐藏菜单 */
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            /* 设置链接元素的最小宽度 */
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(12, 12, 12, 0.2);
            overflow: auto;
        }
        .submenu a {          /*设置子菜单中的a标签*/
            display: block;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
        }

        .submenu a:hover {
            background-color: #f1f1f1

        }
        .menu:hover .submenu {  /*聚焦menu，改变submenu*/
            display: block;
        }

        .webName{
            text-align: center;
            letter-spacing: 3px;
            padding-top: 5px;
            font-size: 30px;
            font-weight: 700;
            color: #f34949;
            float: right;
            display: inline-block;
        }

    </style>
</head>

<body>

<ul>
    <div class="menu">
        <a href="#" class="item">登录/注册</a>
        <div class="submenu">
            <a href="login.jsp" target="_blank">登录</a>
            <a href="register.jsp" target="_blank">注册</a>
        </div>
    </div>
    <div class="webName">广州大学红色长廊&nbsp;</div>
</ul>

</body>

</html>

