<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="action  divaction">
		<div class="t">查看请假</div>
		<div class="pages">
			<!--增加报销单 区域 开始-->
			<table width="90%" border="0" cellspacing="0" cellpadding="0"
				class="addform-base">
				<caption>基本信息</caption>
				<tbody>
					<tr>
						<td width="36%">姓名：<span id="span1"></span></td>
						<td width="64%">部门：<span id="span2"></span></td>
					</tr>
					<tr>
						<td>开始时间：<span id="span3"></span></td>
						<td>结束时间：<span id="span4"></span></td>
					</tr>
					<tr>
						<td>请假天数：<span id="span5"></span></td>
						<td>请假事由：<span id="span6"></span></td>
					</tr>
					<tr>
						<td>审批状态：<span id="span7"></span></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<p>
				-------------------------------------------------------------------------------
			</p><br><br>
			<p>审批意见：</p><br>
			<textarea rows="5" cols="60" id="yj">
			
			</textarea><br><br>
			<c:if test='${emp.employeename eq "雷军"}'>
			<input type="button" id="tongguo" value="审批通过" class="submit_01">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="jujue" value="审批拒绝" class="submit_01"><br><br>
			</c:if>
			<c:if test='${emp.employeename eq "王岐山"}'>
			<input type="button" id="cdaong" value="存档" class="submit_01"><br><br>
			</c:if>
			<input type="button" value="返回"
						onclick="window.history.go(-1)" class="submit_01"><br><br>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
var bh = <%=request.getParameter("bh")%>;
alert(bh);
$.getJSON("/commodityItem4/c/list5",{bh:bh},function(res){
	console.info(res);
	$("#span1").text(res.qjname);
	$("#span2").text(res.departmentName);
	$("#span3").text(res.kssj);
	$("#span4").text(res.jssj);
	$("#span5").text(res.counts);
	$("#span6").text(res.event);
	$("#span7").text(res.spzt);
})

$("#tongguo").click(function(){
	var yj = $.trim($("#yj").val()); //意见
	var date=new Date();
	var rq = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
	$.getJSON("/commodityItem4/c/list6",{bh:bh,yj:yj,rq:rq},function(res){
		console.info(res)
		if(res.code == "200"){
			alert("已通过!");
		}
	})
})
$("#jujue").click(function(){
	var yj = $.trim($("#yj").val()); //意见
	var date=new Date();
	var rq = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
	$.getJSON("/commodityItem4/c/list8",{bh:bh,yj:yj,rq:rq},function(res){
		console.info(res)
		if(res.code == "200"){
			alert("已拒绝!");
		}
	})
})
$("#cdaong").click(function(){
	var yj = $.trim($("#yj").val()); //意见
	var date=new Date();
	var rq = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
	$.getJSON("/commodityItem4/c/list9",{bh:bh,yj:yj,rq:rq},function(res){
		console.info(res)
		if(res.code == "200"){
			alert("已存档!");
		}
	})
})
</script>
</html>