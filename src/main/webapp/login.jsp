<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#kaptchaImage').click(function () { 
            $(this).attr('src', 'kaptcha.jpg?' + Math.floor(Math.random()*100) ); 
        });
    });
    
    </script>
    
  </head>
  
  <body>
  <script type="text/javascript">
    function fun1(){
    var name=$(":input#name").val();
    var password=$(":input#password").val();
  
   $.ajax({
  type: 'POST',
  url: 'yanzheng.do',
  data: {"name":name,"password":password},
  dataType: 'text',
  success: function(data){
  alert('3');
  if(data=="success"){
  alert('1');
  $('#a').after('<span>success</span>');}
  else{
  alert('2');
  $('.button').append('<span>error<span>');}
  },
  error:function(){
  alert('4');
  },
});
    };
 </script>
 <script type="text/javascript">
    function fun2(){
    var name=$(":input#name").val();
    var password=$(":input#password").val();
  
   $.ajax({
  type: 'POST',
  url: 'yanzheng.do',
  data: {"name":name,"password":password},
  dataType: 'json',
  success: function(data1){
  alert(data1.msg);
  var v=data1.data;
  alert(v.username);
  if(data1!="{}"){
  alert('1');
  $('#a').after('<span>success</span>');}
  else{
  alert('2');
  $('.button').append('<span>error<span>');}
  },
  error:function(){
  alert('4');
  },
});
    };
 </script>

 
   <input type="text" name="name" value="" id="name"/><br/>
    <input type="text" name="password" value="" id="password"/><br/>
      <button  onclick="fun2()" id="a">ceshi</button>
    <form action="kaptcha.do" method="post">
       <img src="kaptcha.jpg" id="kaptchaImage"/>
    <input type="text" name="kaptcha" value=""/><br/>
     
    </form>
    <tr>
                <td><h5>城市下拉框</h5></td>
                <td>
                    <select id="top" style="width:130px">
                        <option>请选择省市/其他...</option>
                    </select>
                        <select id="center" style=" width:130px">
                        <option >请选择城市/其他...</option>
                    </select>
                        <select id="button" style=" width:130px">
                        <option>请选择县/区...</option>
                        </select>
                </td>
            </tr>
            <script type="text/javascript">
    $(function() {
        // setCity("top", "0");//页面加载时就现实数据库第一个数据，一定要加上
        setCity("top", "0");
        $("#top").change(function() {
            // 当省级改变的时候，让市级和县级文本清空
            $("#center option").remove();
            $("#button option").remove();
             //获得省级的id
            var pid=$("#top option:selected").attr("id");
             //加载该省级的市级数据
            setCity("center", pid);
        });
        $("#center").change(function() {
             //当市级改变的时候，让县级文本清空
             $("#button option").remove();
            //获取城市的pid
            var pid=$("#center option:selected").attr("id");
            //加载该省市级的县级数据
            setCity("button",pid );
        });
    });
    //selectid:select标签的id，pid数据库省级县级的pid
    function setCity(selectid, pid) {
        $.ajax({
            url : "/select?pid="+pid,
            type : "get",
            cache : false,
            success : function(res) {
                //注意!!!这里必须使用eval(res)函数，否则获取到的json数据无法遍历,无话获取到数据
                var arr = eval(res);
                //遍历返回的json数据加载到select标签;
                $.each(arr, function(key, val) {
                    $("#" + selectid).append(
                            " <option id='" + val.tb_AreaId + "'>"
                                    + val.areaName + "</option>");
                });
            }
        });
    };
</script>
<div><object id="ssss" width="480" height="370" ><param name="allowScriptAccess" value="always" /><embed pluginspage="http://www.macromedia.com/go/getflashplayer" src="http://video.sina.com.cn/share/video/251016461.swf" type="application/x-shockwave-flash" name="ssss" allowFullScreen="true" allowScriptAccess="always" width="480" height="370"></embed></object></div>
<div><object width=200 height=180 classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715" standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject" hspace="5">
<param name="AutoRewind" value=1>
<param name="FileName" value="video/Wildlife.wmv">
<param name="ShowControls" value="1">
<param name="ShowPositionControls" value="0">
<param name="ShowAudioControls" value="1">
<param name="ShowTracker" value="0">
<param name="ShowDisplay" value="0">
<param name="ShowStatusBar" value="0">
<param name="ShowGotoBar" value="0">
<param name="ShowCaptioning" value="0">
<param name="AutoStart" value=1>
<param name="Volume" value="5000">
<param name="AnimationAtStart" value="0">
<param name="TransparentAtStart" value="0">
<param name="AllowChangeDisplaySize" value="0">
<param name="AllowScan" value="0">
<param name="EnableContextMenu" value="0">
<param name="ClickToPlay" value="0">
</object></div>
  </body>
</html>
