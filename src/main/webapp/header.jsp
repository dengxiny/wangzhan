<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="css/css_common.css"/>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/Html5.js"></script>
<script type="text/javascript" src="js/Move.js"></script>
<script type="text/javascript" src="js/common.js"></script>


</head>


<!--二维码滚动效果-->
<div id="erCode">
	<div class="erCodeBg"></div>
    <div class="erCodeBox">
    	<p class="fl"><img src="images/qrcode.png"><br/>手机APP</p>
    </div>
    <p class="closeCode"></p>
</div>
<div class="erCodeSmall" id="erCodeSmall"></div>
<div id="wechatCode">
    <div class="erCodeBg"></div>
    <div class="erCodeBox">
        <p class="fl"><img src="images/coad_09.png"><br/>管理员微信</p>
    </div>
    <p class="closeCode"></p>
</div>
<div class="wechatCodeSmall" id="wechatCodeSmall"></div>
<p id="qqOnline">&nbsp;</p>
<a id="qqHref" href="onlinekefu1.do" target="_blank" style="display:none;">qq</a>