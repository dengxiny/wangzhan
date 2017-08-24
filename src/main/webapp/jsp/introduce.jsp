<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
 <link rel="stylesheet" href="../testcss/css/style.css" type="text/css" /> 
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<!-- <script type="text/javascript" src="../js/npm.js"></script> -->
<style type="text/css">
/*  #cs_box {
    width: 120px;
    height: 220px;
    color: #FFF;
    background: #54a7ff;
    position: fixed;
    right: 10px;
    top: 100px;
    border-radius: 10px;
    z-index: 1000;
} */
.container {
 /* /*    width: 400px;
    margin: 40px auto 0 auto;
    position: relative; */ */
    font-family: 微软雅黑;
    font-size: 15px;
}
</style>
<title>Insert title here</title>
</head>
<body background="blue" style="margin-top: 48px;">
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<p></p>
				<form class="form-horizontal" action="updateintroduce" method="post"
					align="center" class="form-horizontal" role="form">
					<div class="form-group has-success" >
						<label class="col-sm-2 control-label" for="inputSuccess">
							ID </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputSuccess"
								name="ID" value="${user1.ID}" style="width: 40px" disabled>
						</div>
					</div>
					<div class="form-group has-warning" >
						<label class="col-sm-2 control-label" for="inputWarning">
							邮箱 </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputWarning"
								name="username" value="${user1.username}" style="width: 200px" disabled>
						</div>
					</div>
					<div class="form-group has-error" >
						<label class="col-sm-2 control-label" for="inputError"> 密码
						</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputError"
								name="password" value="${user1.password}" style="width: 300px" disabled>
						</div>
					</div>
				
					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10" align="left">
					<c:if test="${user1Detail.sex=='不知道'}">
							<input id="" name="sex" type="radio" value="男" style="width: 40px"/> 男 
							<input id="" name="sex" type="radio" value="女" style="width: 40px"/> 女 
							<input id="" name="sex"type="radio" value="不知道" checked style="width: 40px"/> 不知道
					</c:if>
					<c:if test="${user1Detail.sex=='男'}">
							<input id="" name="sex" type="radio" value="男" checked style="width: 40px"/> 男 
							<input id="" name="sex" type="radio" value="女" style="width: 40px"/> 女 
							<input id="" name="sex"type="radio" value="不知道" style="width: 40px"/> 不知道
					</c:if>
					<c:if test="${user1Detail.sex=='女'}">
							<input id="" name="sex" type="radio" value="男" style="width: 40px"/> 男 
							<input id="" name="sex" type="radio" value="女" checked style="width: 40px"/> 女 
							<input id="" name="sex"type="radio" value="不知道"  style="width: 40px"/> 不知道
					</c:if>
						</div>
					</div>
					<div class="form-group" style="padding-left: 200px">
						<div class="imageBox">
							<div class="thumbBox"></div>
							<div class="spinner" style="display: none">Loading...</div>
 						 </div>
 					<div class="action"> 
						<div class="new-contentarea tc"> 
						<a href="javascript:void(0)" class="upload-img"><label for="upload-file">上传图像</label> </a>
	 					 <input type="file" class="" name="upload-file" id="upload-file" />
						</div>
	<input type="button" id="btnCrop"  class="Btnsty_peyton" value="裁切">
	<input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+"  >
	<input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-" >
  </div>
  <div class="cropped">
  <img src="${user1Detail.touxiang}" align="absmiddle" style="width:64px;margin-top:13px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" id="image" >
  </div>
  <div class="touxiang"><lable>个人头像</lable></div>
</div>
	
<script src="../testcss/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../testcss/js/cropbox.js"></script>
<script type="text/javascript">
$(window).load(function() {
		var imgsrc=$("#image")[0].src;
		//alert(imgsrc);
	var options =
	{
		thumbBox: '.thumbBox',
		spinner: '.spinner',
		imgSrc: imgsrc
	}
	var cropper = $('.imageBox').cropbox(options);
	$('#upload-file').on('change', function(){
		var reader = new FileReader();
		reader.onload = function(e) {
			options.imgSrc = e.target.result;
			cropper = $('.imageBox').cropbox(options);
		}
		reader.readAsDataURL(this.files[0]);
		this.files = [];
	})
	$('#btnCrop').on('click', function(){
		var img = cropper.getDataURL();
		var id=$("#inputSuccess").val();
		$("#image").attr('src',img);
		$.ajax({ 
    	
    	  url: 'stouxiang',
  		  type: 'POST',
  		  data: {"img":img,"ID":id},
  		  dataType: 'text',
  		  success: function(data){
  		  window.location.href="introduce";
  			 },
  		  error:function(){
  		  },
  		});
		/* $('.cropped').html('');
		$('.cropped').append(''); */
	//	$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
	//	$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
	})
	$('#btnZoomIn').on('click', function(){
		cropper.zoomIn();
	})
	$('#btnZoomOut').on('click', function(){
		cropper.zoomOut();
	})
});
</script>
						<!-- <div class="form-group " >
						<label class="col-sm-2 control-label" >头像 </label>
						<div class="col-sm-4" align="left">
							<input type="file" class="form-control" name="file" style="width: 200px">
						</div> 
					</div>
					</div>-->
					<div  style="position:absolute;right:30%;top: 20% ; " >
						<label  >个性签名 </label>
						<!-- <div style="position:absolute;right:20%;top: 40%;" >
							<textarea rows="" cols="" style="position:absolute;right:20%;top: 40%;"></textarea>
						</div> -->
					</div>
					<div style="position:absolute;left:75%;top: 40%;">
							<textarea style="position:absolute;right:20%;top: 40%;resize: none;width: 200px;height: 100px;max-width: 200px;
max-height: 100px;" maxlength="100" name="introduce">${user1Detail.introduce}</textarea>
					</div>
					<div class="form-group">
						<div class="col-sm-10" align="center">
							<input type="submit" value="提交">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>