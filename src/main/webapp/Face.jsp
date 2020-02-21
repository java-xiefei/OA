<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="/commodityItem4/js/jquery-2.1.1.js"></script>
<body>
	<!-- <p align="center">
		<button id="open">开启摄像头</button>
		<button id="close">关闭摄像头</button>
		<button id="CatchCode">拍照</button>
	</p> -->
	<div align="center" style="float: left;">
		<video id="video" width="800px" height="800px" autoplay></video>
		<canvas hidden="hidden" id="canvas" width="626" height="800"></canvas>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
var video;//视频流对象
var context;//绘制对象
var canvas;//画布对象

open();
setTimeout(() => {
	context.drawImage(video, 0, 0, 330, 250);
		CatchCode();			
	}, 5000);

//将当前图像传输到后台
function CatchCode() {
	var userNumber = $("[name=employeeId]").val();
	var userPwd = $("[name=password]").val();
	//获取图像
	var img = getBase64();
	//Ajax将Base64字符串传输到后台处理
	$.ajax({
		type : "POST",
		url : "/commodityItem4/c/list",
		data : {img : img,employeeid:userNumber,password:userPwd},
		dataType : "JSON",
		success : function(data) {
			console.log(data)
			//返回的结果
			//取出对比结果的返回分数，如果分数90以上就判断识别成功了
			if(data.code=="200") {
				//关闭摄像头
				video.srcObject.getTracks()[0].stop();				
				//提醒用户识别成功
				alert(data.msg);
				//验证成功跳转页面
				location.href="/commodityItem4/zy.jsp";
	  		}else if(data.code=="300"){
	  			alert(data.msg);	  			
	  			/* closeWindowDialog(); */
		  	}else if(data.code=="400"){
		  		alert(data.msg);
		  		setTimeout(() => {
		  			context.drawImage(video, 0, 0, 330, 250);
		  				CatchCode();			
		  		}, 1000);
			}
		},
		Error:function(e){
			alert(e)
			setTimeout(() => {
			context.drawImage(video, 0, 0, 330, 250);
				CatchCode();			
			}, 5000);
			/* ig=setInterval(() => {
	  			context.drawImage(video, 0, 0, 330, 250);
	  			CatchCode();			
	  		}, 1000); */
		}
		
	});

};
//开启摄像头
function open() {
	//获取摄像头对象
	canvas = document.getElementById("canvas");
	context = canvas.getContext("2d");
	//获取视频流
	video = document.getElementById("video");
	var videoObj = {
		"video" : true
	}, errBack = function(error) {
		console.log("Video capture error: ", error.code);
	};
	context.drawImage(video, 0, 0, 330, 250);
	//初始化摄像头参数
	if (navigator.getUserMedia || navigator.webkitGetUserMedia
			|| navigator.mozGetUserMedia) {
		navigator.getUserMedia = navigator.getUserMedia
				|| navigator.webkitGetUserMedia
				|| navigator.mozGetUserMedia;
		navigator.getUserMedia(videoObj, function(stream) {
			video.srcObject = stream;
			video.play();
		}, errBack);
	}
	
}
//将摄像头拍取的图片转换为Base64格式字符串
function getBase64() {
	//获取当前图像并转换为Base64的字符串
	var imgSrc = canvas.toDataURL("image/png");
	//截取字符串
	return imgSrc.substring(22);
};

</script>
</html>