<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			</p>
			<table width="90%" border="0" cellspacing="0" cellpadding="0"
				class="addform-base" style="margin: 20px 0;">
				<thead>

					<tr>
						<td width="15%">审查人</td>
						<td width="40%">审查意见</td>
						<td width="30%">审查时间</td>
						<td width="15%">审查结果</td>
					</tr>

				</thead>
				<tbody id="tbody">
					<tr>
						<td>presidentXi</td>
						<td></td>
						<td>2019-08-13 14:22:54</td>
						<td style="font-weight: bold;">拒绝</td>
					</tr>
				</tbody>
				<!--表单提交行-->
				<tr>
					<td colspan="4" class="submit"><input type="button" value="返回"
						onclick="window.history.go(-1)" class="submit_01"></td>
				</tr>
			</table>
			<!--增加报销单 区域 结束-->
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
$.getJSON("/commodityItem4/c/list7",{bh:bh},function(res){
 console.info(res);
 $("#tbody").empty();
 $.each(res,function(i,obj){
	 console.info(obj.scjg);
    if(obj.scjg=="1"){
    	obj.scjg="通过";
	}else if(obj.scjg=="2"){
    	obj.scjg="拒绝";
	}else if(obj.scjg=="3"){
    	obj.scjg="打回";
	}
	var tr = $(`
		<tr>
			<td>${"${obj.scr}"}</td>
			<td>${"${obj.scyj}"}</td>
			<td>${"${obj.scsj}"}</td>
			<td>${"${obj.scjg}"}</td>
		</tr>
	`);
	 $("#tbody").append(tr);
})
})
</script>
</html>