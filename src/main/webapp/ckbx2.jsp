<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
<style>
	.img{width:40px;height:40px;cursor:pointer;}
	.weight{font-weight: bold;}
</style>
</head>
<body>
	<form id="myForm" name="myForm" method="post">
		<div class="action  divaction">
			<div class="t">查看报销单</div>
			<div class="pages">
				<!--增加报销单 区域 开始-->
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<caption>基本信息</caption>
					<tbody>
						<tr>
							<td>编&nbsp;&nbsp;号：<span id="bh"></span></td>
							<td>填&nbsp;写&nbsp;人：<span id="tbr"></span></td>
							<td>部&nbsp;&nbsp;门：<span id="bm"></span></td>
							<td>职&nbsp;&nbsp;位：<span id="zw"></span></td>
						</tr>
						<tr>
							<td>总金额：<span id="zje"></span></td>
							<td>填报时间：<span id="tbrq"></span></td>
							<td>状态：<span id="spzt"></span></td>
							<td>待处理人：<span id="dclr"></span></td>
						</tr>
						<tr>
							<td colspan="4"><p>-------------------------------------------------------------------------------</p></td>
						</tr>
					</tbody>
				</table>
				<p>&nbsp;</p>
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<thead>
						<tr>
							<td>项目说明</td>
							<td>项目金额</td>
							<td>票据截图</td>
						</tr>
					</thead>
					<tbody id="ttbo">						
							<!-- <tr>
								<td>
									<span>旅游</span>
								</td>
								<td>
									<span>200.0</span>
								</td>
								<td><img class="img" src="images/66dd8b86cd7743bf805ce9d136d274c0.jpg"></td>
							</tr> -->
					</tbody>
				</table>
				<p>&nbsp;</p>
				<p>-------------------------------------------------------------------------------</p>

				<table style="margin-top: 15px;" width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<thead>
						 <tr>
								<td>
									审查人
								</td>
								<td>
									审查意见
								</td>
								<td>
									审查时间
								</td>
								<td>
									审查结果
								</td>
							</tr>
					</thead>
					<tbody id="tbo2">
						
					</tbody>

				</table>
				<p>&nbsp;</p>

				<p>&nbsp;</p>
				<p>
					<input type="button" value="返回" onclick="window.history.go(-1)"
						class="submit_01">
				</p>
				<!--增加报销单 区域 结束-->
			</div>
		</div>
	</form>
</body>
<script src="js/jquery-1.12.4.js"></script>
<script>
base64Data = new Array();
var bh = <%=request.getParameter("bh")%>;
alert(bh);
$.getJSON("/commodityItem4/b/list4",{bh:bh},function(res){
	if(res.dclr==null){
		res.dclr = "无";
	}
	console.info(res);
	$("#bh").text(res.bh);
	$("#tbr").text(res.tbr);
	$("#bm").text(res.bm);
	$("#zw").text(res.zw);
	$("#zje").text(res.zje);
	$("#tbrq").text(res.tbrq);
	$("#spzt").text(res.sqzt);
	$("#dclr").text(res.dclr);
})
$.getJSON("/commodityItem4/b/list5",{bh:bh},function(res){
	console.info(res);
	$("#ttbo").empty();
	$.each(res,function(i,obj){
		var tr = $("<tr>"+
			"<td>"+obj.desc+"</td>"+
			"<td>"+obj.subTotal+"</td>"+
			"<td><img id='img"+i+"' src='' width='40' height='40'></td>"+
				"</tr>")
				$("#ttbo").append(tr);		
			base64Data[i] = obj.pictrueName;//获得base编码字符串格式
			/* $("#jh"+i).attr("src",base64Data[i]);//显示图片
			console.info("#jh"+i)
			console.info(base64Data[i]) */
			$("#img"+i).attr("src",base64Data[i]);
	})
})
$.getJSON("/commodityItem4/b/list7",{bh:bh},function(res){
	console.info(res);
	$("#tbo2").empty();
	$.each(res,function(i,obj){
		var tr = $(`<tr>
				<td>${"${obj.scr}"}</td>
				<td>${"${obj.scyj}"}</td>
				<td>${"${obj.scsj}"}</td>
				<td>${"${obj.resultName}"}</td>
				</tr>`)	
				$("#tbo2").append(tr);
	})
})
</script>
</html>