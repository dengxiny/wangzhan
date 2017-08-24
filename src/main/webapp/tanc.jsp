<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tanc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<script type="text/javascript"> 
function bd(){ 
var baidu = document.getElementById("i"); 
baidu.src = "http://www.baidu.com"; 
} 
function xl(){ 
var sina = document.getElementById("i"); 
sina.src = "http://www.sina.com.cn"; 
} 
</script> 
<style type="text/css"> 
.divcss5{position:relative;} 
.divcss5-1,.divcss5-2,.divcss5-3 
{width:100px;height:50px;position:absolute;} 
.divcss5-1{z-index:30;background:#000;left:10px;top:10px} 
.divcss5-2{z-index:20;background:#F00;left:20px;top:20px} 
.divcss5-3{z-index:15;background:#00F;left:30px;top:30px} 
</style> 
</head> 

<body> 
<div class="divcss5-1"></div> 
<div class="divcss5-2"></div> 
<div class="divcss5-3"></div>
<img  src="file:///C:/Users/Administrator/Desktop/32.gif">
</body> 
</html>
