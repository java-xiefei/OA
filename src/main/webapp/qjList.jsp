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
</head>
<body>
	<!-- <script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script>
	$(function(){
		 //日期选择控件
	 	$("#startDate").click(function(){
			WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}',isShowClear:true, readOnly:true });
		});
		$("#endDate").click(function(){
			WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\')}',isShowClear:true, readOnly:true });
		});
	});
</script> -->
</head>
<body>
	<div class="action  divaction">
		<div class="t">请假列表</div>
		<div class="pages">
			<div class="forms">
				<form id="leave_searchLeave_action" name="queryForm"
					action="ckqj.html" method="get">
					<label for="time">开始时间</label> <input type="text" name="sTime"
						value="" id="startDate" class="nwinput"> <label
						for="end-time">结束时间</label> <input type="text" name="eTime"
						value="" id="endDate" class="nwinput">
					<!-- readonly="" -->
					<input type="hidden" name="pageNo" value="1"> <input
						type="hidden" name="pageSize" value="5"> <input
						type="button" id="leave_searchLeave_action_0" value="查询"
						class="submit_01">

				</form>
			</div>
			<!--增加报销单 区域 开始-->
			<table id="vmLeave" width="90%" border="0" cellspacing="0"
				cellpadding="0" class="list items">
				<thead>
					<tr class="even">
						<td>编号</td>
						<td>名称</td>
						<td>发起时间</td>
						<td>审批时间</td>
						<td>审批意见</td>
						<td>待处理人</td>
						<td>审批状态</td>
						<td>操作</td>

					</tr>
				</thead>
				<tbody>

					<!-- <tr v-for="(temp,index) in pageinfo.list">
							<td><a href="javascript:void(0)">{{temp.leaveId}}</a></td>
							<td><span>{{temp.employeeName}}</span>请假<span>{{temp.totalCount}}</span>天</td>
							<td>{{temp.createTime}}</td>
							<td>{{temp.checkTime}}</td>
							<td>{{temp.resultName}}</td>
							<td>
								{{temp.nextDealMan}}
							</td>
							<td>
								{{temp.statusName}}
								<input id="checkId" type="hidden" value="temp.checkId" />
							</td>
							<td>
								<a href="qjxq.html">
									<img src="images/search.gif" width="16" height="15">
								</a>
								<template v-if="">
									<a href="qjxq.html">
										<img src="images/sub.gif" width="16" height="15">
									</a>
								</template>
							</td>
						</tr> -->


					<!-- 	 <tr>
						<td><a href="leave_getLeaveById.action?leave.id=143">143</a></td>
						<td>张平请假1.0天</td>
						<td>2013-09-09 15:10</td>
						<td></td>
						<td></td>
						<td></td>
						<td>待审批</td>
						<td><a
							href="claimVoucher_toUpdate.action?claimVoucher.id=133"> <img
								src="images/edit.gif" width="16" height="16">
						</a> <a onclick="delVoucher(133)" href="#"> <img
								src="images/delete.gif" width="16" height="16">
						</a> <a target="rightFrame" href="leaveDetail.jsp"><img
								src="images/search.gif" width="16" height="15"></a> <a
							target="rightFrame" href="leaveCheck.jsp"> <img
								src="images/sub.gif" width="16" height="16"></a></td>
					</tr> -->


				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" align="center">
							<div class="page-bar">
								<a href="javascript:void(0)" onclick="fy(this)" id="sy">首页</a>
								&nbsp;&nbsp; <a href="javascript:void(0)" onclick="fy(this)"
									id="syy">上一页</a> &nbsp;&nbsp; <a href="javascript:void(0)"
									onclick="fy(this)" id="xyy">下一页</a> &nbsp;&nbsp; <a
									href="javascript:void(0)" onclick="fy(this)" id="my">末页</a>
								&nbsp;&nbsp; &nbsp;&nbsp;第 <span id="dqy"></span>页<span
									id="dqy2"></span>/<span id="zys"></span>共<span id="gdsy"></span>页&nbsp;&nbsp;共<span
									id="jl"></span>条记录
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<!--请假 区域 结束-->
		</div>
	</div>
</body>
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript" src="js/jq_ajax_config.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$("#leave_searchLeave_action_0").click(function(){
	var kssj = $("#startDate").val();
	var jssj = $("#endDate").val();
	console.info(kssj);console.info(jssj);
	fyy(1,kssj,jssj);
})

fyy(1,null,null)
function fyy(pageNum,kssj,jssj){
	$.getJSON("/commodityItem4/c/list4",{gh:${emp.employeeId},pageNum:pageNum,kssj:kssj,jssj:jssj},function(data){
		$("#sy").attr("date-c",1); //首页
		$("#syy").attr("date-c",data.prePage); //上一页
		$("#xyy").attr("date-c",data.nextPage); //下一页
		$("#my").attr("date-c",data.lastPage); //末页
		$("#dqy").text(data.pageNum);//当前页
		$("#dqy2").text(data.pageNum);//当前页
		$("#zys").text(data.pages);//总页数
		$("#gdsy").text(data.pages);//总页数
		$("#jl").text(data.total);//总记录数
		var bbh = ${emp.employeeId};
		console.info(data);
		$("tbody").empty();
		if(bbh == "1005"){
			$.each(data.list,function(i,obj){
				if(obj.spTime==null){
					obj.spTime="";
				}
				if(obj.spyj==null){
					obj.spyj="";
				}
				if(obj.dclr==null){
					obj.dclr="无";
				}
				var tr = $(`
						<tr>
						<td><a href="#">${"${obj.bh}"}</a></td>
						<td>${"${obj.qjname}"}请假${"${obj.counts}"}天</td>
						<td>${"${obj.fqTime}"}</td>
						<td>${"${obj.spTime}"}</td>
						<td>${"${obj.spyj}"}</td>
						<td>${"${obj.dclr}"}</td>
						<td>${"${obj.spzt}"}</td>
						<td>
						<a target="rightFrame" href='qjxq.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
						</td>
					</tr>
						`);
				$("tbody").append(tr);	
			})
		}else if(bbh == "1004"){
			$.each(data.list,function(i,obj){
				if(obj.spTime==null){
					obj.spTime="";
				}
				if(obj.spyj==null){
					obj.spyj="";
				}
				if(obj.dclr==null){
					obj.dclr="无";
				}
				if(obj.spyj==""){
					var tr = $(`
							<tr>
							<td><a href="#">${"${obj.bh}"}</a></td>
							<td>${"${obj.qjname}"}请假${"${obj.counts}"}天</td>
							<td>${"${obj.fqTime}"}</td>
							<td>${"${obj.spTime}"}</td>
							<td>${"${obj.spyj}"}</td>
							<td>${"${obj.dclr}"}</td>
							<td>${"${obj.spzt}"}</td>					
							<td>
							<a target="rightFrame" href='qjxq.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
							<a target="rightFrame" href='qjpz.jsp?bh=${"${obj.bh}"}'><img src="images/sub.gif" width="16" height="16"></a>
							</td>					
						</tr>
							`);
					$("tbody").append(tr);	
				}else{
					var tr = $(`
							<tr>
							<td><a href="#">${"${obj.bh}"}</a></td>
							<td>${"${obj.qjname}"}请假${"${obj.counts}"}天</td>
							<td>${"${obj.fqTime}"}</td>
							<td>${"${obj.spTime}"}</td>
							<td>${"${obj.spyj}"}</td>
							<td>${"${obj.dclr}"}</td>
							<td>${"${obj.spzt}"}</td>					
							<td>
							<a target="rightFrame" href='qjxq.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
							</td>					
						</tr>
							`);
					$("tbody").append(tr);	
				}	
			})
			}else if(bbh == "1006"){
				$.each(data.list,function(i,obj){
					if(obj.spTime==null){
						obj.spTime="";
					}
					if(obj.spyj==null){
						obj.spyj="";
					}
					if(obj.dclr==null){
						obj.dclr="无";
					}
					if(obj.spzt!="已存档"&&obj.spyj=="通过"){
						var tr = $(`
								<tr>
								<td><a href="#">${"${obj.bh}"}</a></td>
								<td>${"${obj.qjname}"}请假${"${obj.counts}"}天</td>
								<td>${"${obj.fqTime}"}</td>
								<td>${"${obj.spTime}"}</td>
								<td>${"${obj.spyj}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>${"${obj.spzt}"}</td>					
								<td>
								<a target="rightFrame" href='qjxq.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								<a target="rightFrame" href='qjpz.jsp?bh=${"${obj.bh}"}'><img src="images/sub.gif" width="16" height="16"></a>
								</td>					
							</tr>
								`);
						$("tbody").append(tr);	
					}else{
						var tr = $(`
								<tr>
								<td><a href="#">${"${obj.bh}"}</a></td>
								<td>${"${obj.qjname}"}请假${"${obj.counts}"}天</td>
								<td>${"${obj.fqTime}"}</td>
								<td>${"${obj.spTime}"}</td>
								<td>${"${obj.spyj}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>${"${obj.spzt}"}</td>					
								<td>
								<a target="rightFrame" href='qjxq.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								</td>					
							</tr>
								`);
						$("tbody").append(tr);	
					}	
				})
				}
	})
}
function fy(th){
	var pageNum = $(th).attr("date-c");
	if(pageNum!=0){
		fyy(pageNum);
	}else{
		alert("翻到头了");
	}	
}
</script>
</html>