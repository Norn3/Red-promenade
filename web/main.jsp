<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.servlet.question" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<html lang="en">
<head>
    <!--meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"-->
    <title>党建红色长廊知识竞答</title>
    <style type="text/css">
    <!--
    body{
        background-color: #fffcef;

    }
        * {
            margin: 0;
            padding: 0;                 /*设置页面边界与边距*/
        }

        .wrapper {                      /*设置页面的方块滚动条整体属性*/
            width: 100vw;
            box-sizing: border-box;
            padding: 1vw;
        }

        .box {                         /*设置每个方块的属性*/
            display: inline-block;
            width: 7.5vw;
            height: 7vw;
            background-color: #d70f0f;
            /* margin: 0.2vw; */
        }

        .emblem {                              /*设置滚动的方块*/
            background-image: url(./pic.png);
            background-repeat: no-repeat;
            background-size: 100%;
            background-color: white;
        }

        .container {
            position: relative;
        }

        .rightBox,                       /*设置滚动条左右方块的宽度*/
        .leftBox {
            width: 7.5vw;
            display: inline-block;
        }

        .rightBox {
            position: absolute;
            right: 1vw;
        }

        .topBox,                         /*设置滚动条上下方块的属性*/
        .bottomBox {
            /* width: 100vw; */
            display: flex;                    /*弹性布局*/
            justify-content: space-between;   /*元素等距间隔*/
        }

        .topBox {
            margin-bottom: 0.5vw;
        }

        .mainControl {                    /*设置中央部分属性*/
            display: inline-block;
            width: 83vw;
        }

        .mainControl h1 {                     /*设置主标题以及成绩文字的属性*/
            text-align: center;              /*设置水平居中*/
            color: #f0d310;
            font-weight: 700;
            margin-top: 16vh;
            font-size: 4vw;
        }

        .mainControl h4 {                  /*"点击开始答题"的标题属性*/
            display: inline-block;
            position: absolute;
            right: 9vw;
            font-size: 2vw;
            margin-top: 4vh;
            cursor: pointer;   /*设置鼠标指针移动到上方时的样式转变*/
            transition: all  0.5s;   /*设置转变效果*/
        }

        .mainControl h4:hover {
            color: rgb(121, 121, 121);
        }

        .middleBox {
            display: flex;
        }

        .questionPage h2 {           /*设置问题属性*/
            margin-top: 7vh;
            font-size: 2vw;
            text-align: center;
        }

        .questionPage li {           /*设置答案样式*/
            list-style: none;
            height: 5vh;
            font-size: 1.5vw;
            margin-top: 2vh;
            text-align: center;
        }

        .questionPage li span {
            display: inline-block;
            width: 70%;
            padding: 0.5vh;
            padding-left: 1em;
            background-color: #fef1ba;
            border-radius: 10px;
            transition: all 0.5s;
            cursor: pointer;
        }

        .questionPage li span:hover {             /*设置鼠标指针浮动在上方时的样式*/
            background-color: rgb(247, 230, 160);
        }

        .questionPage .chosen {
            background-color: rgb(161, 189, 215);
        }

        .questionPage .chosen:hover {
            background-color: rgb(161, 189, 215);
        }

        .record{
            margin-left: 1000px;
            margin-top: 10px;
            padding-top: 14px;
            width: 150px;
            height: 30px;
            border-radius: 10px;
            background-color: #dac7f1;
        }

        .title #nextBtn {             /*设置下一题按钮的属性*/
            cursor: pointer;
            position: absolute;
            right: 12%;
            top: 65%;
            padding: 1.5vh;
            background-color: #fe5f5f;
            color: #fff;
            border-radius: 4px;
            transition: all 0.8s;
        }

        .title #timeout{         /*设置计时器属性*/
            position: absolute;
            left: 12%;
            top: 65%;
            font-size: 1.5vw;
        }

        #nextBtn:hover {
            background-color: #ed3535;
        }

        .hide {
            display: none;
        }
        -->
    </style>
</head>

<body>
<%
    String userID = (String) request.getAttribute("uID");
%>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script>
    $.ajax({
        type: "GET",
        url: "http://localhost:8088/_war_exploded/showQues",
        data: 'jsonp',
        contentType: "application/json;charset=UTF-8",
    });
</script>
<div class="wrapper">               <!--创建开始页面-->
    <!-- 上方的方块 -->
    <div class="topBox container">
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
        <div class="box top"></div>
    </div>

    <div class="middleBox">
        <!-- 左边方块 -->
        <div class="leftBox container">
            <div class="box left"></div>
            <div class="box left"></div>
            <div class="box left"></div>
            <div class="box left"></div>
        </div>
        <!-- 中间主要控制部分 -->
        <div class="mainControl">
            <div class="cover">
                <h1>党建红色长廊知识竞答</h1>
                <h4 id="startAnswer">每次五题，每题30秒，按点击此处开始答题......</h4>
            </div>
            <div class="questionPage hide">
                <div class="title">
                    <h2>第<span id="questionId">null</span>题:<span id="questionTitle">null</span></h2><span
                        id="nextBtn">下一题</span>
                    <div id="timeout">0</div>
                </div>
                <ul>
                <li class="options"><span>null</span></li>
                <li class="options"><span>null</span></li>
                <li class="options"><span>null</span></li>
                <li class="options"><span>null</span></li>
                </ul>
            </div>
            <div class="gradePage hide">
                <h1>你的成绩是:<span id="grade">&nbsp</span>分</h1>
                <div class="record">
                    <input type="button" value="点击查看答题记录" onclick="postRecord()">
                </div>
                <form method="post" name="record" >
                    <input type="hidden" name="uID" id="uID" value="0">
                    <input type="hidden" name="q1" id="q1" value="0">
                    <input type="hidden" name="q2" id="q2" value="0">
                    <input type="hidden" name="q3" id="q3" value="0">
                    <input type="hidden" name="q4" id="q4" value="0">
                    <input type="hidden" name="q5" id="q5" value="0">
                    <input type="hidden" name="a1" id="a1" value="0">
                    <input type="hidden" name="a2" id="a2" value="0">
                    <input type="hidden" name="a3" id="a3" value="0">
                    <input type="hidden" name="a4" id="a4" value="0">
                    <input type="hidden" name="a5" id="a5" value="0">
                    <input type="hidden" name="score" id="score" value="0">
                </form>
            </div>
        </div>
        <!-- 右边方块 -->
        <div class="rightBox container">
            <div class="box right"></div>
            <div class="box right"></div>
            <div class="box right"></div>
            <div class="box right"></div>
        </div>
    </div>

    <!-- 下方的方块 -->
    <div class="bottomBox container">
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
        <div class="box bottom"></div>
    </div>
</div>
</body>
<script language="JavaScript">
    // 获取四个方向上的方块
    let topBoxes = document.querySelectorAll('.topBox .box');
    let leftBoxes = document.querySelectorAll('.leftBox .box');
    let rightBoxes = document.querySelectorAll('.rightBox .box');
    let bottomBoxes = document.querySelectorAll('.bottomBox .box');
    let backLeftBox = [], backBottomBox = [];
    // 右边的方块倒序
    for (let i = 0; i < leftBoxes.length; i++) {
        backLeftBox[i] = leftBoxes[leftBoxes.length - i - 1]
    }

    // 下面的方块倒序
    for (let i = 0; i < bottomBoxes.length; i++) {
        backBottomBox[i] = bottomBoxes[bottomBoxes.length - i - 1]
    }

    // 上顺序（从左到右）,右顺序（从上到下）,下倒序（从右到左）,左倒序（从下到上）
    let showBox = [...topBoxes, ...rightBoxes, ...backBottomBox, ...backLeftBox];

    let index = 0;

    //切换显示图片的方块
    function circleShow() {
        showBox[index].classList.add('emblem');
        if (index === 0) showBox[showBox.length - 1].classList.remove('emblem');
        else showBox[index - 1].classList.remove('emblem');
        index++;
        if (index === showBox.length) index = 0;
    }

    // 设定一个循环调用函数，循环调用切换函数
    setInterval("circleShow()", 500);



   // 题库
    /*let data = [{
        "id": 0,
        "question": "____拉开了中国新民主主义革命的序幕。",
        "options": ["新文化运动", "五四运动", "中国共产党成立", "五洲运动"],
        "solution": "1"
    }, {
        "id": 1,
        "question": "中国共产党第一次全国代表大会在____开幕。",
        "options": ["1921年7月1日，南京", "1921年7月21日，上海", "1921年7月30日，南京", "1921年7月23日，上海"],
        "solution": "3"
    }, {
        "id": 2,
        "question": "____第一次提出明确的反帝反封建的民主革命纲领。",
        "options": ["中共一大", "中共二大", "中共三大", "中共四大"],
        "solution": "1"
    }, {
        "id": 3,
        "question": "国共合作实现后，以____为中心，很快开创了反对帝国主义和封建军阀的革命新局面。",
        "options": ["天津", "广州", "杭州", "上海"],
        "solution": "1"
    }, {
        "id": 4,
        "question": "中共四大时，全国党员的人数是____。",
        "options": ["594人", "794人", "994人", "1594人"],
        "solution": "2"
    },{
        "id": 5,
        "question": "1927年中共五大时，全国党员人数已超过____。",
        "options": ["1万人", "3万人", "5万人", "10万人"],
        "solution": "2"
    },{
        "id": 6,
        "question": "1927年____，蒋介石在____发动反革命政变。",
        "options": ["4月2日，南京", "4月12日，上海", "4月12日，南京", "4月2日，上海"],
        "solution": "1"
    },{
        "id": 7,
        "question": "中央五大选举产生了党的历史上第一个中央纪律检查监督机构____，这在党的建设史上有重要意义。",
        "options": ["中央检查局", "中央纪律委员会", "中央监察委员会", "中央纪律监察委员会"],
        "solution": "2"
    },{
        "id": 8,
        "question": "____标志着中国共产党独立地领导革命战争、创建人民军队和武装夺取政权的开始。",
        "options": ["武昌起义", "南昌起义", "秋收起义", "广州起义"],
        "solution": "1"
    },{
        "id": 9,
        "question": "____从进攻大城市转到向农村进军，这是中国人民革命发展史上具有决定意义的新起点。",
        "options": ["武昌起义", "南昌起义", "秋收起义", "广州起义"],
        "solution": "2"
    }]*/

    let data = [];
    let putin = 0;
        <%
        List<question> list = (List<question>) request.getAttribute("list");
        if(list==null){System.out.println("list is empty");}
        else
           for(question q:list){
        %>
        data[putin]={
            "id":<%=q.getQID()%>,
            "question": "<%=q.getQuestion()%>",
            "options": ["<%=q.getAnswer1()%>", "<%=q.getAnswer2()%>","<%=q.getAnswer3()%>","<%=q.getAnswer4()%>"],
            "solution": <%=q.getSolution()%>
        }
        putin++;
        <%}%>

    // 随机从题库中抽取五题放进pickQuestion数组中
    let pickQuestion = [];
    // let pickindexs =[5];
    // let pickindex = 0;
    // //检验有无重复题目
    // let same = 0;
    // // console.log(pickindex);
    // for(let i = 0; i < 5; i++)
    // {
    //     do{
    //         same=0;
    //         pickindex = Math.floor(10 * Math.random())+1;
    //         for(let j = 0; j < i; j++)
    //         {
    //             if(pickindex===pickindexs[j] || pickindex >= data.length){
    //                 same++;
    //             }
    //         }
    //     }while(same)
    //     pickindexs[i]=pickindex;
    // }
    // // console.log(pickQuestion);
    function randomGet(data){
        data.sort(function(){
            return (0.5-Math.random());
        });
        let subArr = data.slice(0,5);
        pickQuestion = [...pickQuestion,...subArr];
    }


    // //将获取的随机数对应的题目从题库中移到所选题目数组中
    // for(let i = 0; i < 5; i++)
    // {
    //     pickQuestion[i]=data[pickindexs[i]-1];
    // }

    randomGet(data);

    let selectOptions = document.querySelectorAll('.options span');
    let chooseAnswer = -1;
    let gradeSum = 0;

    //设定计时器初始值
    let time = 0;

    // 点击开始答题
    let startAnswer = document.getElementById('startAnswer');
    startAnswer.onclick = function () {
        document.getElementById('timeout').innerHTML = 0;
        time = 0;    //重置因停留于开始页面引起的计时
        document.querySelector('.questionPage').classList.remove('hide');
        document.querySelector('.cover').classList.add('hide');
    }

    //答题
    selectOptions.forEach((item, index) => item.onclick = function () {
        if (item.classList.contains('chosen')) {
            // console.log('取消了' + index);
            chooseAnswer = -1
            item.classList.remove('chosen');
        } else {
            // console.log('选择了' + index);
            chooseAnswer = index;
            selectOptions.forEach((item) => item.classList.remove('chosen'));
            item.classList.toggle('chosen');
        }
    })

    let questionIdPresent = 0;
    let nextBtn = document.getElementById('nextBtn');
    let questionId = document.getElementById('questionId');
    let questionTitle = document.getElementById('questionTitle');

    function setQuestion() {
        questionId.innerHTML = questionIdPresent + 1;
        //写入题目
        questionTitle.innerHTML = pickQuestion[questionIdPresent].question;
        selectOptions.forEach((item, index) => {
            // 写入选项
            item.innerHTML = pickQuestion[questionIdPresent].options[index];
        })
    }
    // 显示题目
    setQuestion();

    //计时器
    setInterval(function(){
        document.getElementById('timeout').innerHTML = time++;
        if((time >= 30)&&(questionId!== 0))    //时间到则切换下一题
        {
            chooseAnswer = -1;
            selectOptions.forEach((item) => item.classList.remove('chosen'));
            if (questionIdPresent === pickQuestion.length - 1)    //已到最后一题则直接显示结果
            {
                document.querySelector('.questionPage').classList.add('hide');
                document.querySelector('.gradePage').classList.remove('hide');
                document.getElementById('grade').innerHTML = gradeSum;
            }
             ++questionIdPresent;
            setQuestion();
            time = 0;
        }
    },1000);

    let userAnswer = [];
    let answerNum =0;



    // 点击下一题按钮
    nextBtn.onclick = function () {
        if (questionIdPresent === pickQuestion.length - 1) { // 答到最后一题
            if (chooseAnswer === -1) {
                alert('请先选择答案再点击下一题');
            } else {
                // 答完五题
                time = 0;
                chooseAnswer + 1 === pickQuestion[questionIdPresent].solution ? gradeSum += 20 : gradeSum += 0;
                //alert(chooseAnswer+" "+pickQuestion[questionIdPresent].solution+" "+gradeSum);
                userAnswer[answerNum++]=chooseAnswer+1;
                document.querySelector('.questionPage').classList.add('hide');
                document.querySelector('.gradePage').classList.remove('hide');
                document.getElementById('grade').innerHTML = gradeSum;
            }
        } else {
                //未答完
            if (chooseAnswer === -1) {
                alert('请先选择答案再点击下一题');
            } else {
                time = 0;
                // 将每个选项被选中的状态全部移除
                selectOptions.forEach((item) => item.classList.remove('chosen'));
                // console.log(chooseAnswer);
                // console.log(pickQuestion[questionIdPresent].solution);
                chooseAnswer + 1 === pickQuestion[questionIdPresent].solution ? gradeSum += 20 : gradeSum += 0;
                //alert(chooseAnswer+" "+pickQuestion[questionIdPresent].solution+" "+gradeSum);
                userAnswer[answerNum++]=chooseAnswer+1;
                chooseAnswer = -1;
                ++questionIdPresent;
                setQuestion();
                console.log(gradeSum)
            }
        }
    };
    function postRecord()
    {
        document.getElementById("uID").value="<%=userID%>";
        document.getElementById("q1").value=pickindexs[0];
        console.log( document.getElementById("q1").value);
        document.getElementById("q2").value=pickindexs[1];
        document.getElementById("q3").value=pickindexs[2];
        document.getElementById("q4").value=pickindexs[3];
        document.getElementById("q5").value=pickindexs[4];
        document.getElementById("a1").value=userAnswer[0];
        document.getElementById("a2").value=userAnswer[1];
        document.getElementById("a3").value=userAnswer[2];
        document.getElementById("a4").value=userAnswer[3];
        document.getElementById("a5").value=userAnswer[4];
        document.getElementById("score").value=gradeSum;
        document.forms['record'].action="showRec";
        document.forms['record'].submit();
        console.log(document.forms['record']);
    }

    /*function postRecord()
    {
        let q1=pickindexs[0];
        $.post("showRec?uID=<%--=userID--%>&q1=")

    }*/
    /*let q1=pickindexs[0];

    let xmlHttpRequest ;  // 创建一个变量，用于存放 XMLHttpRequest 对象
    function createXMLHttpRequest() {
        if(window.ActiveXObject()){  // 判断是否是IE浏览器
            xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP")
        }
        else if(window.XMLHttpRequest){  // 判断是否是 Netscape 或者其它 支持 XMLHttpRequest 组件的浏览器
            xmlHttpRequest = new XMLHttpRequest()
        }
    }

    function postRecord(){
        createXMLHttpRequest()  // 调用创建对象的方法
        // 判断XMLHttpRequest对象的readyState属性值是否为 4 ，如果为4则表示异步调用完成
        if(xmlHttpRequest != null){
            xmlHttpRequest.open("post","http://localhost:8088/_war_exploded/showRec",true);
            xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
            xmlHttpRequest.send(JSON.stringify({"uID":<%--=userID--%>,"q1":q1}));
            <%--System.out.println("send");--%>
            //xmlHttpRequest.onreadystatechange = httpStateChange;  // 设置 XMLHttpRequest 对象状态发生改变时调用的函数
        }
    }*/


    /*function postRec(){
        $.ajax({
            type: "POST",
            url: "http://localhost:8088/_war_exploded/showRec/",
            data: {
                "uID":JSON.stringify("<%--=userID--%>"),
                "q1":JSON.stringify(pickindexs[0]),
                "answers":JSON.stringify(userAnswer[0]),
            },
            dataType:"JSON",
            contentType: "application/json;charset=UTF-8",
            success: function (data){ console.log(data)}})
    }*/








</script>

</html>