<%@ page import="com.servlet.question" %>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.turnString" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>题库管理界面</title>
    <style>
        form{
            margin-top: 10px;
            margin-left: 1000px;
            position: fixed;
            width: 500px;
            height: 500px;
        }
        body{
            background: url(./5.png);
            background-size: 1540px 700px;
        }
    </style>
</head>
<body>

<br />
<form method="post" name="new">
    新增题目：<br/>
    题&nbsp;号：&nbsp;<input type="text" name="newQID"  id="newQID"/>（不可与现有题号重复）<br/>
    题&nbsp;目：&nbsp;<input type="text" name="question" id="question"/><br/>
    选项A：<input type="text" name="answer1" id="answer1"/><br/>
    选项B：<input type="text" name="answer2" id="answer2"/><br/>
    选项C：<input type="text" name="answer3" id="answer3"/><br/>
    选项D：<input type="text" name="answer4" id="answer4"/><br/>
    答&nbsp;案：&nbsp;<input type="text" name="solution" id="solution"/> (请输入1、2、3、4代指选项）<br/><br/>
    <input type="hidden" name="change" value="new">
    <input type="button" value="新增该题" onclick="newQues()">
    <input type="reset" value="重置" /><br/>
</form>

<br />
<form method="post" name="change" style="margin-top: 250px"><br/>
    修改题目：<br/>
    题&nbsp;号&nbsp;：&nbsp;<input type="text" id="changeQID" name="changeQID"/><br/>
    修改项：<input type="text" id="changeItem" name="changeItem"/><br/>
    (请输入qid(题号)、question(题目)、answer1(A选项)、<br/>answer2(B选项)、answer3(C选项)、answer4(D选项)、<br/>solution(答案)）<br/>
    修改为：<input type="text" id="newItem" name="newItem"/><br/><br/>
    <input type="hidden" name="change" value="change">
    <input type="button" value="修改该题" onclick="changeQues()">
    <input type="reset" value="重置" /><br/>
</form>

<form method="post" name="delete" style="margin-top: 520px">
    删除题目：<br/>
    题&nbsp;号：&nbsp;<input type="text" id="deleteQID" name="deleteQID"/><br/><br/>
    <input type="hidden" name="change" value="delete">
    <input type="button" value="删除该题" onclick="deleteQues()">
    <input type="reset" value="重置" /><br/>
</form>
<h2 style="margin-left: 50px">题库</h2>
<%
    turnString t = new turnString();
    List<question> list = (List<question>) request.getAttribute("list");
    if(list==null){System.out.println("list is empty");}
    else
        for(question q:list){
%>
<table border=0px style="margin-left: 50px">
<tr>
    <td>题号:</td>
    <td><%=q.getQID()%></td>
</tr>
<tr>
    <td>题目:</td>
    <td><%=q.getQuestion()%></td>
</tr>
<tr>
    <td>选项:</td>
    <td>A:<%=q.getAnswer1()%>&nbsp;B:<%=q.getAnswer2()%>&nbsp;C:<%=q.getAnswer3()%>&nbsp;D:<%=q.getAnswer4()%></td>
</tr>
<tr>
    <td>答案:</td>
    <td><%=t.turn(q.getSolution())%></td>
</tr>
    <br/>
</table>
<%}%>
<br>
</body>
<script>
    function newQues ()
    {
        let newQID = document.getElementById('newQID') ;
        let question = document.getElementById('question');
        let answer1 =document.getElementById('answer1');
        let answer2 =document.getElementById('answer2');
        let answer3 =document.getElementById('answer3');
        let answer4 =document.getElementById('answer4');
        let solution =document.getElementById('solution');
        if( newQID.value == null)
        {
            alert("题号不可为空！");
            return false;
        }
        else if( question.value == null)
        {
            alert("题目不可为空！");
            return false;
        }
        else if( answer1.value == null)
        {
            alert("选项不可为空！");
            return false;
        }
        else if( answer2.value == null)
        {
            alert("选项不可为空！");
            return false;
        }
        else if( answer3.value == null)
        {
            alert("选项不可为空！");
            return false;
        }
        else if( answer4.value == null)
        {
            alert("选项不可为空！");
            return false;
        }
        else if( solution.value == null)
        {
            alert("答案不可为空！");
            return false;
        }
        else
        {
            let newForm = document.forms['new'];
            console.log(newForm);
            if(newForm)
            {
                newForm.action="changeQues";
                newForm.submit();
            }
        }
    }
    function changeQues()
    {
        let change =document.getElementById('changeQID');
        let changeItem =document.getElementById('changeItem');
        let newItem =document.getElementById('newItem');
        if( change.value == null)
        {
            alert("题号不可为空！");
            return false;
        }
        else if( changeItem.value == null)
        {
            alert("修改项不可为空！");
            return false;
        }
        else if( newItem.value == null)
        {
            alert("修改内容不可为空！");
            return false;
        }
        else
        {
            let changeForm = document.forms['change'];
            console.log(changeForm);
            if(changeForm)
            {
                changeForm.action="changeQues";
                changeForm.submit();
            }
        }
    }
    function deleteQues()
    {
        let deleteQID =document.getElementById('deleteQID');
        if( deleteQID.value == null)
        {
            alert("题号不可为空！");
            return false;
        }
        else
        {
            let deleteForm = document.forms['delete'];
            console.log(deleteForm);
            if(deleteForm)
            {
                deleteForm.action="changeQues";
                deleteForm.submit();
            }
        }
    }
</script>
</html>
