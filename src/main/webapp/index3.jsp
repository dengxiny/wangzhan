<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta charset="UTF-8">
   <!--  <title>贪吃蛇</title>
    <style>
    *{margin: 0;padding: 0;list-style: none;}
    #wrap{width: 100%;height: 100%;min-width: 660px;}
    #box{width: 598px;height: 398px;margin: 50px auto;background:#748B7B;border: 4px solid #333333;padding: 2px;}
    #main{width: 598px;height: 398px;position: relative;}
    #box span{width: 10px; height: 10px;border: 2px solid #666666;margin: 0 2px 2px 0;position: absolute;padding: 2px;left: 0;top: 0;}
    #box span i{width: 10px; height: 10px;background: #666666;display: block;}
    #box .food{width: 10px; height: 10px;border: 2px solid #000;margin: 0 2px 2px 0;position: absolute;padding: 2px;left: 0;top: 0;}
    #box .food i{background: #F00;}
    #box .snake{width: 10px; height: 10px;border: 2px solid #000;margin: 0 2px 2px 0;position: absolute;padding: 2px;left: 0;top: 0;}
    #box .snake i{background: #000;}
    </style>
    <script> -->
    window.onload=function(){
        var oBox=document.getElementById('box');
        var oMain=document.getElementById('main');
        var h=30;
        var s=20;
        var aSnakePos=[];
        var aFoodPos=[];
        var timer=null;
        var bOk=false;
        var oldKey=0;
        var bLeft=false,bTop=false,bRight=false,bDown=false;
        var oFragment = document.createDocumentFragment();
        for(var i = 0 ; i < s; i ++) {
            for (var j = 0; j < h; j++) {
                var oSpan = document.createElement('span');
                oSpan.style.top=i*20+'px';
                oSpan.style.left=j*20+'px';
                oSpan.id=toDou(i)+''+toDou(j);
                var oTxt = document.createElement('i');
                oSpan.appendChild(oTxt);
                oFragment.appendChild(oSpan);
            }
        }
        oMain.appendChild(oFragment);

        //两位数补零
        function toDou(n){
            return n<10?'0'+n:''+n;
        }
        //随机食物
        rndFood();
        function rndFood(){
            var a=toDou(rnd(0,s));
            var b=toDou(rnd(0,h));
            var aFPos={left:a,right:b};
            function findArr(obj,arr){
                for (var i = 0; i < arr.length; i++) {
                    if(obj.left==arr[i].left&&obj.right==arr[i].right){
                        a=toDou(rnd(0,s));
                        b=toDou(rnd(0,h));
                    }
                }
                return aFPos={left:a,right:b};
            }
            findArr(aFPos,aSnakePos);
            aFoodPos.push(aFPos);
            var oFood=document.getElementById(a+''+b);
            oFood.className='food';
        }
        //随机蛇
        rndSnake();
        function rndSnake(){
            var a=toDou(rnd(0,20));
            var b=toDou(rnd(0,30));
            aSnakePos.push({left:a,right:b});
        }

        //蛇加样式
        snake();
        function snake(){
            for (var i = 0; i < aSnakePos.length; i++) {
                var a=aSnakePos[i].left;
                var b=aSnakePos[i].right;
                var oSnake=document.getElementById(a+''+b);
                // console.log(a+',,,'+b);
                oSnake.className='snake';
            }

        }
        
        function rnd(n,m){
            return parseInt(Math.random()*(m-n)+n);
        }

        //键盘控制移动
        document.onkeydown=function(ev){
            var oEvent=ev || event;
            bOk=true;
            if (oEvent.keyCode==37&&oldKey!=39) {
                bLeft=true;
                bTop=false;
                bRight=false;
                bDown=false;
            }
            if (oEvent.keyCode==38&&oldKey!=40) {
                bLeft=false;
                bTop=true;
                bRight=false;
                bDown=false;
            }
            if (oEvent.keyCode==39&&oldKey!=37) {
                bLeft=false;
                bTop=false;
                bRight=true;
                bDown=false;
            }
            if (oEvent.keyCode==40&&oldKey!=38) {
                bLeft=false;
                bTop=false;
                bRight=false;
                bDown=true;
            }
            return false;
        }
        var bSnakePos = {};
        
        timer=setInterval(function(){
            if (bOk) {
                //获取出第一个头的位置，进行加减找下一个位置
                var oFirst=aSnakePos[0];
                var lPos=oFirst.left;
                var rPos=oFirst.right;
                //蛇尾
                if(aSnakePos.length==1){
                    lastSnake=oFirst;
                }
                else{
                    lastSnake=aSnakePos.pop();
                    delete bSnakePos[lastSnake.left + ',' + lastSnake.right];
                }
                var oldleft=lastSnake.left;
                var oldright=lastSnake.right;
                var oElement=document.getElementById(lastSnake.left+''+lastSnake.right);
                oElement.className='';
                if(bLeft&&oldKey!=39){
                    oFirst.right=toDou(Number(rPos)-1);
                    if (rPos<=0) {
                        alert('游戏结束');
                        clearInterval(timer);
                        window.location.reload();
                        return false;
                    }
                    oldKey=37;
                }
                if (bTop&&oldKey!=40) {
                    oFirst.left=toDou(Number(lPos)-1);
                    //console.log(lPos);
                    if (lPos<=0) {
                        alert('游戏结束');
                        clearInterval(timer);
                        window.location.reload();
                        return false;
                    }
                    oldKey=38;
                }
                if (bRight&&oldKey!=37) {
                    oFirst.right=toDou(Number(rPos)+1);
                    if (rPos>=29) {
                        alert('游戏结束');
                        clearInterval(timer);
                        window.location.reload();
                        return false;
                    }
                    oldKey=39;
                }
                if (bDown&&oldKey!=38) {
                    oFirst.left=toDou(Number(lPos)+1);
                    if (lPos>=19) {
                        alert('游戏结束');
                        clearInterval(timer);
                        window.location.reload();
                        return false;
                    }
                    oldKey=40;
                }
                if (bSnakePos.hasOwnProperty(oFirst.left + ',' + oFirst.right)) {
                    alert('咬死自己啦，游戏结束');
                    clearInterval(timer);
                    window.location.reload();
                    return false;
                }
                
                if ((oFirst.left==aFoodPos[0].left)&&(oFirst.right==aFoodPos[0].right)) {
                    aSnakePos.unshift({left:oFirst.left,right:oFirst.right});
                    aSnakePos.push({left:oldleft,right:oldright});
                    bSnakePos[oldleft + ',' + oldright] = 1;
                    
                    aFoodPos=[];
                    rndFood();
                }else{
                    aSnakePos.unshift({left:oFirst.left,right:oFirst.right});
                }
                bSnakePos[oFirst.left + ',' + oFirst.right] = 1;
                
                snake();
            }
        },300);

    };
    </script>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
  
  <body>
  <div id="container">


    <%-- <a>${user.username}</a>
    <a>${user.password}</a> --%>
    <form action="index" method="post">
    <input type="text" value="${user1.username}">
    <input type="text" name="introduce">
    <input type="submit" value="submit">
    
    </form>
    
   
    </div>
  <!--   <div id="wrap">
        <div id="box">
            <div id="main">
            </div>
            <br />
            <p>介绍：红色是食物，用←、↑、→、↓控制黑色移动即可。</p>
        </div>
    </div> -->
  </body>
</html>

