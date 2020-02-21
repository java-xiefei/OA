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
		<div class="t">收件箱</div>
		<div class="pages">
				<!--增加请假单 区域 开始-->
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<caption>基本内容</caption>
					<tbody>
						
					</tbody>
					<tfoot>
						
					</tfoot>
				</table>
			<button id="syy" style="margin-left: 250px">上一页</button>&nbsp;<span id="numSize"></span>&nbsp;<button id="xyy">下一页</button>
			<br>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script>
var num = 1;
fy(num,5);
function fy(pageNum,pageSize){
	$.getJSON("/commodityItem4/a/list3",{pageNum:pageNum,pageSize:pageSize,bh:${emp.employeeId},zt:0},function(res){
		$("tbody").empty();
		$.each(res.list,function(i,obj){
			var tr = $(`
					<tr>
					<td>${"${obj.scr}"}${"${obj.yj}"}了你的请假申请！</td>
					<td><button class="aaa" date-c="${'${obj.id}'}">已读</button></td>
				</tr>
					`)
				$("tbody").append(tr);	
		})
	})
	$.getJSON("/commodityItem4/a/list4",{pageNum:pageNum,pageSize:pageSize,bh:${emp.employeeId},zt:0},function(res){
		$("tfoot").empty();
		$.each(res.list,function(i,obj){
			var tr = $(`
					<tr>
					<td>${"${obj.scr}"}${"${obj.yj}"}了你的报销申请！</td>
					<td><button class="bbb" date-c="${'${obj.id}'}">已读</button></td>
				</tr>
					`)
				$("tfoot").append(tr);	
		})
	})
	$("#numSize").text(pageNum);
}

$("#syy").click(function(){
	if(num>1){
	 --num;
	}
	fy(num,5)
})
$("#xyy").click(function(){
	++num;
	fy(num,5)
})

$(document).on("click",".aaa",function(res){
	var id = $(this).attr("date-c");
	$.getJSON("/commodityItem4/a/list5",{id:id},function(res){
		if(res.code=="200"){
			fy(num,5);
		}
	})
})
$(document).on("click",".bbb",function(res){
	var id = $(this).attr("date-c");
	$.getJSON("/commodityItem4/a/list6",{id:id},function(res){
		if(res.code=="200"){
			fy(num,5);
		}
	})
})
</script>
</html>