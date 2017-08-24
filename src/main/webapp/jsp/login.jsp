<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登入</title>
<SCRIPT src="../js/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>
<style>
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
/* side */
.side{position:fixed;width:54px;height:275px;right:0;top:214px;z-index:100;}
.side ul li{width:54px;height:54px;float:left;position:relative;border-bottom:1px solid #444;}
.side ul li .sidebox{position:absolute;width:54px;height:54px;top:0;right:0;transition:all 0.3s;background:#000;opacity:0.8;filter:Alpha(opacity=80);color:#fff;font:14px/54px "微软雅黑";overflow:hidden;}
.side ul li .sidetop{width:54px;height:54px;line-height:54px;display:inline-block;background:#000;opacity:0.8;filter:Alpha(opacity=80);transition:all 0.3s;}
.side ul li .sidetop:hover{background:#ae1c1c;opacity:1;filter:Alpha(opacity=100);}
.side ul li img{float:left;}
</style>
<STYLE>
body {
	background: #ebebeb;
	font-family: "Helvetica Neue", "Hiragino Sans GB", "Microsoft YaHei",
		"\9ED1\4F53", Arial, sans-serif;
	color: #222;
	font-size: 12px;
}

* {
	padding: 0px;
	margin: 0px;
}

.top_div {
	background: #008ead;
	width: 100%;
	height: 400px;
}

.ipt {
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

.ipt:focus {
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6)
}

.u_logo {
	background: url('../image/username.png') no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;
}

.p_logo {
	background: url('../image/password.png') no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}

a {
	text-decoration: none;
}

.tou {
	background: url('../image/tou.png') no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}

.left_hand {
	background: url('../image/left_hand.png') no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}

.right_hand {
	background: url('../image/right_hand.png') no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}

.initial_left_hand {
	background: url('../image/hand.png') no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}

.initial_right_hand {
	background: url('../image/hand.png') no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}

.left_handing {
	background: url('../image/left-handing.png') no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}

.right_handinging {
	background: url('../image/right_handing.png') no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}
 #canvas {
     
      display: block;
    }
</STYLE>
<SCRIPT type="text/javascript">
	$(function() {
		//得到焦点
		$("#password").focus(function() {
			$("#left_hand").animate({
				left : "150",
				top : " -38"
			}, {
				step : function() {
					if (parseInt($("#left_hand").css("left")) > 140) {
						$("#left_hand").attr("class", "left_hand");
					}
				}
			}, 2000);
			$("#right_hand").animate({
				right : "-64",
				top : "-38px"
			}, {
				step : function() {
					if (parseInt($("#right_hand").css("right")) > -70) {
						$("#right_hand").attr("class", "right_hand");
					}
				}
			}, 2000);
		});
		//失去焦点
		$("#password").blur(function() {
			$("#left_hand").attr("class", "initial_left_hand");
			$("#left_hand").attr("style", "left:100px;top:-12px;");
			$("#right_hand").attr("class", "initial_right_hand");
			$("#right_hand").attr("style", "right:-112px;top:-12px");
		});
	});
</SCRIPT>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#kaptchaImage').click(function () { 
            $(this).attr('src', '../kaptcha.jpg?' + Math.floor(Math.random()*100) ); 
        });
    });
</script>
</head>
<body>

	 <div class="top_div"> 
	
	<canvas id="canvas"></canvas>
 <!--  <script src="../js/a.js"></script> -->
	</div> 

	<div
		style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
		 <form action="login" method="post"> 
		<div style="width: 165px; height: 96px; position: absolute;">
			<div class="tou"></div>
			<div class="initial_left_hand" id="left_hand"></div>
			<div class="initial_right_hand" id="right_hand"></div>
		</div>
		<p style="padding: 30px 0px 10px; position: relative;">
			<span class="u_logo"></span> <input class="ipt" type="text" name="username"
				placeholder="请输入用户名或邮箱" value="">
		</p>
		<p style="position: relative;">
			<span class="p_logo"></span> <input class="ipt" id="password" name="password"
				type="password" placeholder="请输入密码" value="">
		</p>
	
		<p style="position: relative;">
    	<input style="width: 190px"   type="text" name="kaptcha"id="kaptcha" value="" placeholder="请输入验证码" class="ipt"/>
    	<img  style="width: 100px ;height: 37px;" src="../kaptcha.jpg" id="kaptchaImage"/>
		</p>
		<div
			style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			<p style="margin: 0px 35px 20px 45px;">
				<span style="float: left;"><a
					style="color: rgb(204, 204, 204);" href="toForget.do" >忘记密码?</a>
				</span>
				 <span style="float: right;">
				<a style="color: rgb(204, 204, 204); margin-right: 10px;" href="toRegist.do">注册</a>
					<input type="submit"
					style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
					value="登入"></span>
			</p>
		</div>
		
		 </form> 
	</div>
	<div class="side">
	<ul>
	  <li><a href="javascript:void(0);" ><div class="sidebox"><img src="http://demo.lanrenzhijia.com/2014/service1108/side_icon04.png">QQ客服</div></a></li>
	  <li style="border:none;"><a href="javascript:goTop();" class="sidetop"><img src="http://demo.lanrenzhijia.com/2014/service1108/side_icon05.png"></a></li>
  </ul>
</div>
<script src="../js/jquery-1.9.1.min.js"></script>	
<script>
$(function(){
	$(".side ul li").hover(function(){
		$(this).find(".sidebox").stop().animate({"width":"124px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#ae1c1c"})
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"0.8","filter":"Alpha(opacity=80)","background":"#000"})	
	});
	$(".side ul li").click(function(){
	
		var link = 'http://wpa.qq.com/msgrd?v=3&uin=1358134297&site=qq&menu=yes';
		window.open(link,'_blank');
	});
});
//回到顶部函数
function goTop(){
	$('html,body').animate({'scrollTop':0},300);
}
</script>
</body>
</html>