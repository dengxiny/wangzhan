<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link href="../css/bootstrap.min.css"  rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">

<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<style>
        *{margin:0px;padding:0px;}
        .checkbox,.radio{display: inline-block;*display: inline;*zoom:1;height: 24px; line-height: 24px; margin-right: 20px;}
        .checkbox ins,.radio ins{display: inline-block;*display: inline;*zoom:1; width: 23px; height: 22px; vertical-align: r; background: url(http://www.bootcss.com/p/icheck/skins/square/blue.png) no-repeat; margin-right: 8px; -webkit-transition:all 0.1s linear; -moz-transition:all 0.1s linear; -o-transition:all 0.1s linear; -ms-transition:all 0.1s linear; transition:all 0.1s linear;vertical-align: middle;}
        .checkbox ins{background-position: 0px 0px; }
        .radio ins{background-position: -120px 0px; }
        .checkbox .hover{background-position: -24px 0px; }
        .checkbox .checked{background-position: -48px 0px; }
        .checkbox .enable{background-position: -96px 0px;}
        .checkbox .disabled{background-position: -72px 0px;}
        .radio .hover{background-position: -144px 0px;}
        .radio .checked{background-position: -168px 0px;}
        .radio .enable{background-position: -214px 0px;}
        .radio .disabled{background-position: -191px 0px;}
        .checkbox span,.radio span{display: inline-block;*display: inline;*zoom:1;vertical-align: middle; }

        .sport,.sex{width: 950px; margin: 100px auto;}
    </style>
    <script>
        (function($) {
            $.icheck = {
                init: function() {
                    var _this = this;
                    _this._checkbox = "checkbox";
                    _this._radio = "radio";
                    _this._disabled = "disabled";
                    _this._enable = "enable";
                    _this._checked = "checked";
                    _this._hover = "hover";
                    _this._arrtype = [_this._checkbox, _this._radio];
                    _this._mobile = /ipad|iphone|ipod|android|blackberry|windows phone|opera mini|silk/i.test(navigator.userAgent);
                    $.each(_this._arrtype, function(k, v) {
                        _this.click(v);
                        if(!_this._mobile){
                            _this.mouseover(v);
                            _this.mouseout(v);
                        }
                    });
                },
                click: function(elem) {
                    var _this = this;
                    elem = "." + elem;
                    $(document).on("click", elem, function() {
                        var $this = $(this),
                            _ins = $this.find("ins");
                        if (!(_ins.hasClass(_this._disabled) || _ins.hasClass(_this._enable))) {
                            if ( !! _ins.hasClass(_this._checked)) {
                                _ins.removeClass(_this._checked).addClass(_this._hover);
                            } else {
                                if (/radio/ig.test(elem)) {
                                    var _name = $this.attr("name");
                                    $(elem + "[name=" + _name + "]").find("ins").removeClass(_this._checked);
                                }
                                $(elem).find("ins").removeClass(_this._hover);
                                _ins.addClass(_this._checked);
                            }
                        }
                    });
                },
                mouseover: function(elem) {
                    var _this = this;
                    elem = "." + elem;
                    $(document).on("mouseover", elem, function() {
                        var $this = $(this);
                        var _ins = $this.find("ins");
                        if (!(_ins.hasClass(_this._disabled) || _ins.hasClass(_this._enable) || _ins.hasClass(_this._checked))) {
                            _ins.addClass(_this._hover);
                            $this.css("cursor","pointer");
                        } else{
                            $this.css("cursor","default");
                        }
                    });
                },
                mouseout: function(elem) {
                    var _this = this;
                    elem = "." + elem;
                    $(document).on("mouseout", elem, function() {
                        $(elem).find("ins").removeClass(_this._hover);
                    });
                }
            };

            $.icheck.init();

        })(jQuery);
    </script>
    <style type='text/css'>
			*{ margin:0; padding:0;}
			body{
				height:auto;
				width:auto;
				background:url(../image/32.gif) top center no-repeat; background-size:cover;;
				overflow:hidden;
			}
			#perspective{
				perspective:800px;
			}
			#wrap{
				width:120px;  /*133:200  4:6  */
				height:180px;
				margin:0 auto;
				position:relative;

				/*搭建3D效果必须的两个属性：一个变换风格变3d，一个场景景深800px*/
				transform-style:preserve-3d;
				transform:rotateX(-10deg) rotateY(0deg);
				
			}
			#wrap img{
				width:100%;
				height:100%;
				position:absolute;
				border-radius:1px;
				box-shadow:0 0 8px #f9f;
				transform:rotateY(0deg) translateZ(0px);
				/*倒影：朝向 偏移 遮盖*//*线性渐变(从哪里开始,开始时候的颜色,结束时候的颜色)*/
				-webkit-box-reflect:below 5px -webkit-linear-gradient(top,rgba(0,0,0,0) 40%,rgba(0,0,0,0.5) 100%);
			}
			#wrap p{
				width:1200px;
				height:1200px;
				background:-webkit-radial-gradient(center center,600px 600px,rgba(244,23,234,0.2),rgba(0,0,0,0));
				border-radius:100%;
				position:absolute;
				left:50%;
				top:102%;
				margin-left:-600px;
				margin-top:-600px;
				transform:rotateX(90deg);
			}
		</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column" align="center">
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=A">A</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=B">B</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=C">C</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=D">D</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=E">E</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=F">F</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=G">G</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=H">H</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=I">I</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=J">J</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=K">K</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=L">L</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=M">M</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=N">N</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=O">O</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=P">P</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=Q">Q</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=R">R</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=S">S</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=T">T</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=U">U</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=V">V</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=W">W</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=X">X</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=Y">Y</a>
	<a class="pagination" style="width: 20px" shape="rect" href="selpic?type=Z">Z</a>
		</div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-12 column" align="center">
		</div>
	</div><div class="row clearfix"><div id="perspective">
			<div id='wrap'>
			<c:forEach items="${pb.list}" var="list">
				<img src="../${list.imagepath}" alt="重新加载图片.." />
				</c:forEach>
			</div>
		</div></div>
		<script type="text/javascript">
			window.onload = function(){
				var oWrap = document.getElementById('wrap');
				var oImg = oWrap.getElementsByTagName('img');
				var oImgLength = oImg.length;
				var Deg = 360 / oImgLength;
				var nowX , nowY , lastX , lastY , minusX = 0, minusY = 0;
				var roY = 0 , roX = -10;
				var timer;

				for ( var i=0;i<oImgLength;i++ )
				{
					oImg[i].style.transform = 'rotateY('+ i*Deg +'deg) translateZ(350px)';
					oImg[i].style.transition = 'transform 1s '+ (oImgLength-1-i)*0.1 +'s';

				}

				mTop();

				window.onresize = mTop;

				function mTop(){
					var wH = document.documentElement.clientHeight;
					oWrap.style.marginTop = wH / 2 - 180 + 'px';
				}
				
				// 拖拽：三个事件-按下 移动 抬起
				//按下
				document.onmousedown = function(ev){
					ev = ev || window.event;

					//鼠标按下的时候，给前一点坐标赋值，为了避免第一次相减的时候出错
					lastX = ev.clientX;
					lastY = ev.clientY;
					
					//移动
					this.onmousemove = function(ev){
						ev = ev || window.event;

						clearInterval( timer );

						nowX = ev.clientX; // clientX 鼠标距离页面左边的距离
						nowY = ev.clientY; // clientY ………………………………顶部………………

						//当前坐标和前一点坐标差值
						minusX = nowX - lastX; 
						minusY = nowY - lastY;
						
						//更新wrap的旋转角度，拖拽越快-> minus变化大 -> roY变化大 -> 旋转快
						roY += minusX*0.2; // roY = roY + minusX*0.2;
						roX -= minusY*0.1;
	 
						oWrap.style.transform = 'rotateX('+ roX +'deg) rotateY('+ roY +'deg)';
						
						/*
						//生成div，让div跟着鼠标动
						var oDiv = document.createElement('div');
						oDiv.style.cssText = 'width:5px;height:5px;background:red;position:fixed;left:'+nowX+'px;top:'+nowY+'px';
						this.body.appendChild(oDiv);
						*/
						
						//前一点的坐标
						lastX = nowX;
						lastY = nowY;

					}
					//抬起
					this.onmouseup = function(){
						this.onmousemove = null;
						timer = setInterval(function(){
							minusX *= 0.95;
							minusY *= 0.95;
							roY += minusX*0.2; // roY = roY + minusX*0.2;
							roX -= minusY*0.1;
							oWrap.style.transform = 'rotateX('+ roX +'deg) rotateY('+ roY +'deg)';

							if ( Math.abs(minusX)<0.1 && Math.abs( minusY )<0.1 )
							{
								clearInterval( timer );
							}
							console.log( minusX );
						},13);
					}
					return false;
				}
			}

		</script>
	<%-- <c:if test="${pb.list.size()<4&&pb.list.size()>0}">
	<div class="row clearfix">
		<c:forEach items="${pb.list}" var="list">
		<div class="col-md-4 column">
		<span class="label label-default">${list.picturesID}</span><input type="checkbox" name="sel"/><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" />
		</div>
		</c:forEach>
	</div>
	</c:if>
	<c:if test="${pb.list.size()>3&&pb.list.size()<7}">
		<c:forEach items="${list}" var="list" begin="0" end="2">
		<div class="col-md-4 column">
			 <span class="label label-default">${list.picturesID}</span>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" />
			 <input type="checkbox" name="sel"/><br>
		</div>	
			</c:forEach>
			<c:forEach items="${pb.list}" var="list" begin="3" end="${pb.list.size()}">
		<div class="col-md-4 column">
			 <span class="label label-default">${list.picturesID}</span>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" />
		<!-- 	 <input type="checkbox" name="sel"/><br> -->
		</div>	
		</c:forEach>
	</c:if>
	
	<c:if test="${pb.list.size()>6&&pb.list.size()<10}">
	<c:forEach items="${pb.list}" var="list" begin="0" end="2">
	<div class="col-md-4 column">
			 <span class="label label-default">${list.picturesID}</span><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" /><br>
			 <div class="checkbox" name="sel" value="${list.picturesID}" align="right"><ins></ins></div>
	</div>	
			</c:forEach>
		<c:forEach items="${pb.list}" var="list" begin="3" end="5">
		<div class="col-md-4 column">
			<span class="label label-default">${list.picturesID}</span><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" /><br>
			<div class="checkbox" name="sel" value="${list.picturesID}" align="right"><ins></ins></div>
			</div>
		</c:forEach>
		<c:forEach items="${pb.list}" var="list" begin="6" end="${pb.list.size()}">
		<div class="col-md-4 column">
		<span class="label label-default">${list.picturesID}</span><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" /><br>
			<div class="checkbox" name="sel" value="${list.picturesID}" align="right"><ins></ins></div>
		</div>
		</c:forEach>
	</c:if> --%>
	<div class="row clearfix" style="padding-top: 220px">
		<div class="col-md-12 column" align="center">
			<ul class="pagination">
				  <li> <a>共${pb.totalpage}页</a> </li>
  				 <li><a>第${pb.pagecode}页</a> </li>
 				  <li><a href="selpic?type=${type}&pagecode=1">首页</a> </li>
  				<c:if test="${pb.pagecode>1}">
  				 <li><a href="selpic?type=${type}&pagecode=${pb.pagecode-1}">上一页</a> </li>
  				</c:if>
				<c:choose>
  				<c:when test="${pb.totalpage<5}">
  				<c:set var="begin" value="1"></c:set>
  				 <c:set var="end" value="${pb.totalpage}"></c:set>
  				</c:when>
  				<c:otherwise>
  				<c:set var="begin" value="${pb.pagecode-2}"></c:set>
 				 <c:set var="end" value="${pb.pagecode+3}"></c:set>
  				 <c:if test="${begin<1}">
  				 <c:set var="begin" value="1"></c:set>
   				<c:set var="end" value="6"></c:set>
  				 </c:if>
				 <c:if test="${end>pb.totalpage}">
  					 <c:set var="begin" value="${pb.totalpage-4}"></c:set>
  				<c:set var="end" value="${pb.totalpage}"></c:set>
  				 </c:if>
  				</c:otherwise>
				 </c:choose>
  				 <c:forEach var="i" begin="${begin}" end="${end}">
				  <li> <a href="selpic?type=${type}&pagecode=${i}">${i}</a></li>
				  </c:forEach>
					<c:if test="${pb.pagecode<pb.totalpage}">
					<li> <a href="selpic?type=${type}&pagecode=${pb.pagecode+1} ">下一页</a> </li>
					</c:if>
  				<li> <a href="selpic?type=${type}&pagecode=${pb.totalpage}">末页</a> </li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>