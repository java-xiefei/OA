<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="js/My97DatePicker/SKIN/WdatePicker.css" rel="stylesheet"
	type="text/css">

<style type="text/css">
body {
	background: color:#fff;
}
</style>

</head>
<body>

	<div class="action  divaction">
		<div class="t">查看请假</div>
		<div class="pages">
			<form action="" method="post" id="leaveForm">
				<!--增加请假单 区域 开始-->
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<caption>基本信息</caption>
					<tbody>
						<tr>
							<td width="36%">姓名：${emp.employeename }</td>
							<td width="64%">部门：${emp.departmentName }</td>
						</tr>
						<tr>
							<td>开始时间：<input type="date" name="startDate" value=""
								id="startDate" class="nwinput"></td>
							<td>结束时间：<input type="date" name="endDate" value=""
								id="endDate" class="nwinput"></td>
						</tr>
						<tr>
							<td>请假天数： <input type="hidden" name="totalCount" value="1">
								<span id="totalCount">1</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><span
								style="position: relative; top: -30px;">请假事由：</span> <textarea
									id="textarea" name="event" rows="5" cols="45"></textarea></td>

						</tr>

						<!--表单提交行-->
						<tr>
							<td colspan="4" class="submit"><input type="button"
								value="提交" onclick="toSubmit()" class="submit_01"> <input
								type="button" value="返回" onclick="window.history.go(-1)"
								class="submit_01"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script>
	$(function() {
		$("#startDate").change(function() {
			var sDate = $(this).val();
			var eDate = $("#endDate").val();
			sDate = new Date(sDate.replace(/-/g, "/"));
			if (sDate < new Date()) {
				alert("请假日期不正确！");
				$(this).val("");
				return;
			}
			if (eDate != "") {
				eDate = new Date(eDate.replace(/-/g, "/"));
				var days = eDate.getTime() - sDate.getTime();
				var time = parseInt(days / (1000 * 60 * 60 * 24));
				if (time <= 0) {
					alert("请选择正确的日期");
					$(this).val("");
					return false;
				} else {
					$("#totalCount").text(time).val(time);
					$("[name='totalCount']").val(time);
				}
			}
		});
		$("#endDate").change(function() {
			var sDate = $("#startDate").val();
			var eDate = $(this).val();
			if (sDate != "") {
				sDate = new Date(sDate.replace(/-/g, "/"));
				eDate = new Date(eDate.replace(/-/g, "/"));
				var days = eDate.getTime() - sDate.getTime();
				var time = parseInt(days / (1000 * 60 * 60 * 24));
				if (time <= 0) {
					alert("请选择正确的日期");
					$(this).val("");
					return false;
				} else {
					$("#totalCount").text(time);
					$("[name='totalCount']").val(time);
				}
			}
		});
	});

	function toSubmit() {
		var event = $("#textarea").val();//请假事由
		if (event == "") {
			alert("请输入请假事由");
			return;
		}
		var createMan = ${emp.employeeId}; //请假人编号
		var departmentId =${emp.departmentId}; //请假人部门编号
		var date=new Date();
		var createTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();//创建时间
		var startTime = $("[name=startDate]").val(); //请假开始时间
		var endTime = $("[name=endDate]").val(); //请假结束时间
		var nextDealMan = null;//下个处理人
		if("${emp.positionName}"=="普通员工"){
			nextDealMan = "1004";
		}else if("${emp.positionName}"=="部门经理"){
			nextDealMan = "1006";
		}			
		var totalCount = $("#totalCount").text(); //请假天数
		var statusId = 2;
		var leave={};
		console.info(createMan);
		console.info(departmentId);
		console.info(createTime);
		console.info(startTime);
		console.info(endTime);
		console.info(nextDealMan);
		console.info(event);
		console.info(totalCount);
		console.info(statusId);		
		$.getJSON("/commodityItem4/c/list2",{createMan:createMan,departmentId:departmentId,createTime:createTime,
			startTime:startTime,endTime:endTime,nextDealMan:nextDealMan,event:event,totalCount:totalCount,statusId:statusId},function(data){
			if(data.code=="200"){
				alert("请假完成，请耐心等待审核完毕！");
			}else{
				alert("请假出错！");
			}
		})
	}
</script>
</html>