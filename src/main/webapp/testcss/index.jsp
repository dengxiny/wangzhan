<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>
<body>
<div class="container">
  <div class="imageBox">
	<div class="thumbBox"></div>
	<div class="spinner" style="display: none">Loading...</div>
  </div>
  <div class="action"> 
	<div class="new-contentarea tc"> 
		<a href="javascript:void(0)" class="upload-img">
			<label for="upload-file">上传图像</label>
	  </a>
	  <input type="file" class="" name="upload-file" id="upload-file" />
	</div>
	<input type="button" id="btnCrop"  class="Btnsty_peyton" value="裁切">
	<input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+"  >
	<input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-" >
  </div>
  <div class="cropped"></div>
</div>
	
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/cropbox.js"></script>
<script type="text/javascript">
$(window).load(function() {
	var options =
	{
		thumbBox: '.thumbBox',
		spinner: '.spinner',
		imgSrc: 'img/avatar.jpg'
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
		$('.cropped').html('');
		$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
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


</body>
</html>