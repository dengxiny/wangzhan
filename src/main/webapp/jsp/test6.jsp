<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
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
        .checkbox ins,.radio ins{display: inline-block;*display: inline;*zoom:1; width: 23px; height: 22px; vertical-align: r; 
        background: url(http://www.bootcss.com/p/icheck/skins/square/blue.png) no-repeat; margin-right: 8px; 
        -webkit-transition:all 0.1s linear; -moz-transition:all 0.1s linear; 
        -o-transition:all 0.1s linear; -ms-transition:all 0.1s linear;
         transition:all 0.1s linear;vertical-align: middle;}
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
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top: 48px;">
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
	<br>
	
	<div class="row clearfix">
		<div class="col-md-2 column" align="left">
		<c:forEach items="${list2}" var="list2">
		<a class="pagination" style="width: 20px" shape="rect" href="selpic1?type=${type}&typedetail=${list2}">${list2}</a><br>
		</c:forEach>
		</div>
		<div class="col-md-10 column" align="right" >
		<c:if test="${list.size()<4&&list.size()>0}">
		<div class="row clearfix">
		<c:forEach items="${list}" var="list">
		<div class="col-md-4 column">
		<span class="label label-default">${list.picturesID}</span><input type="checkbox" name="sel"/><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" />
		</div>
		</c:forEach>
		</div>
		</c:if>
		<c:if test="${list.size()>3&&list.size()<7}">
		<c:forEach items="${list}" var="list" begin="0" end="2">
		<div class="col-md-4 column">
			 <span class="label label-default">${list.picturesID}</span>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" />
			 <input type="checkbox" name="sel"/><br>
		</div>	
			</c:forEach>
			<c:forEach items="${list}" var="list" begin="3" end="${list.size()}">
		<div class="col-md-4 column">
			 <span class="label label-default">${list.picturesID}</span>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" />
		<!-- 	 <input type="checkbox" name="sel"/><br> -->
		</div>	
		</c:forEach>
	</c:if>
	
	<c:if test="${list.size()>6&&list.size()<10}">
	<c:forEach items="${list}" var="list" begin="0" end="2">
	<div class="col-md-4 column">
			 <span class="label label-default">${list.picturesID}</span><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" /><br>
			 <div class="checkbox" name="sel" value="${list.picturesID}" align="right"><ins></ins></div>
	</div>	
			</c:forEach>
		<c:forEach items="${list}" var="list" begin="3" end="5">
		<div class="col-md-4 column">
			<span class="label label-default">${list.picturesID}</span><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" /><br>
			<div class="checkbox" name="sel" value="${list.picturesID}" align="right"><ins></ins></div>
			</div>
		</c:forEach>
		<c:forEach items="${list}" var="list" begin="6" end="${list.size()}">
		<div class="col-md-4 column">
		<span class="label label-default">${list.picturesID}</span><br>
			 <img alt="重新加载图片.." style="width: 300px;height: 300px" src="../${list.imagepath}" /><br>
			<div class="checkbox" name="sel" value="${list.picturesID}" align="right"><ins></ins></div>
		</div>
		</c:forEach>
	</c:if>
	<div class="row clearfix">
		<div class="col-md-12 column" align="center">
			<ul class="pagination">
				<li>
					 <a href="#">前一页</a>
				</li>
				<li>
					 <a href="#">1</a>
				</li>
				<li>
					 <a href="#">2</a>
				</li>
				<li>
					 <a href="#">3</a>
				</li>
				<li>
					 <a href="#">4</a>
				</li>
				<li>
					 <a href="#">5</a>
				</li>
				<li>
					 <a href="#">后一页</a>
				</li>
			</ul>
		</div>
		</div>
	</div>
	</div>
</div>
</body>
</html>