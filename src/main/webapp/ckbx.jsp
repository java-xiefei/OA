<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="js/My97DatePicker/SKIN/WdatePicker.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="action  divaction">
		<div class="t">报销单列表</div>
		<div class="pages">
			<div class="forms">
				<form id="myForm" name="queryForm"
					action="../jboa/page/findList?pageNum=1&pageSize=10" method="get">
					<label>报销单状态</label> <select name="statusId" id="statusId">

						<option value="">全部</option>
						<option value="1">新创建</option>
						<option value="2">待审批</option>
						<option value="3">审批中</option>
						<option value="4">已审批</option>
						<option value="5">已付款</option>
						<option value="6">已打回</option>
						<option value="7">已存档</option>

					</select> <label for="time">开始时间</label> <input type="text" name="sTime"
						value="" id="startDate" class="nwinput"> <label
						for="end-time">结束时间</label> <input type="text" name="eTime"
						value="" id="endDate" class="nwinput">
					<!-- <input
						type="hidden" name="pageNum" value="1"> <input
						type="hidden" name="pageSize" value="2"> -->
					<input type="button" id="claimVoucher_searchClaimVoucher_action_0"
						value="查询" class="submit_01">
				</form>
			</div>
			<!--增加报销单 区域 开始-->
			<form id="claimVoucher_searchClaimVoucher_action"
				name="claimVoucherForm"
				action="jsp/claim/claimVoucher_searchClaimVoucher.action"
				method="post">
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="list items">
					<thead>
						<tr class="even">
							<td>编号</td>
							<td>填报日期</td>
							<td>填报人</td>
							<td>总金额</td>
							<td>状态</td>
							<td>待处理人</td>
							<td width=20%>操作</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="javascript:void(0)">247</a></td>
							<td>2019-08-14 15:34:56</td>
							<td>王健林</td>
							<td>200.0</td>
							<td>待审批</td>
							<td>presidentXi</td>
							<td><a target="rightFrame" href="ckbx2.html"> <img
									src="images/search.gif" title="查看详情" width="16" height="15">
							</a></td>
						</tr>
					</tbody>
					<tfoot>
					<tr>
						<td colspan="7" align="center">
							<div class="page-bar">
								<a href="#" id="sy">首页</a> &nbsp;&nbsp; <a href="#" id="syy">上一页</a> &nbsp;&nbsp;
								<a href="#" id="xyy">下一页</a> &nbsp;&nbsp; <a href="#" id="my">末页</a> &nbsp;&nbsp;
								&nbsp;&nbsp;第 <span id="dqy"></span>页/共<span id="zgy"></span>页&nbsp;&nbsp;共<span id="zgjl"></span>条记录
							</div>
						</td>
					</tr>
					</tfoot>
				</table>
			</form>
			<!--增加报销单 区域 结束-->
		</div>
	</div>
</body>
<script type="text/javascript" src="js/common.js"></script>
<script src="js/jquery-1.12.4.js"></script>
<script>
var zt =$("#statusId").val(); //状态
var rq = $("#startDate").val();//日期
cs(zt,rq,1,5)
var pageInfo;
function cs(zt,rq,pageNum,pageSezi){
	$.getJSON("/commodityItem4/b/list1",{pageNum:pageNum,pageSize:pageSezi,zt:zt,rq:rq},function(res){
		console.info(res);
		pageInfo = res;
		$("#dqy").text(res.pageNum); //当前页
		$("#zgy").text(res.pages); 	//总页数
		$("#zgjl").text(res.total); //总记录数
		$("tbody").empty();
			if(${emp.employeeId}=="1005"){ //代表本人
				$.each(res.list,function(i,obj){
					if(obj.dclr==null){
						obj.dclr = "无";
					}
					if(obj.tbr=="丁磊"&&obj.spzt=="新创建"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href="#" id="tptj" date-c=${"${obj.bh}"}><img src="images/save.gif" title="提交" width="16" height="15"></a>
								<a href="bxxg.jsp?bh=${"${obj.bh}"}" id="tpxg" date-c=${"${obj.bh}"}><img src="images/edit.gif" title="修改" width="16" height="15"></a>
								<a href="#" id="tpsc" date-c=${"${obj.bh}"}><img src="images/delete.gif" title="删除" width="16" height="15"></a>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}' id="ckxq" date-c=${"${obj.bh}"}><img src="images/search.gif" title="查看详情" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}else if(obj.tbr=="丁磊"&&obj.spzt=="已打回"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href="bxxg.jsp?bh=${"${obj.bh}"}" id="tpxg" date-c=${"${obj.bh}"}><img src="images/edit.gif" title="修改" width="16" height="15"></a>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" title="查看详情" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}else if(obj.tbr=="丁磊"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" title="查看详情" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}
				})
			}else if(${emp.employeeId}=="1004"){ //代表雷军
				$.each(res.list,function(i,obj){
					if(obj.dclr==null){
						obj.dclr = "无";
					}
					if(obj.spzt=="待审批"&&obj.dclr=="${emp.employeename}"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								<a href='bxty.jsp?bh=${"${obj.bh}"}'><img src="images/sub.gif" width="16" height="16"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}else if(obj.spzt!="新创建"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}
				})
			}else if(${emp.employeeId}=="1001"){ //代表财务王健林
				$.each(res.list,function(i,obj){
					if(obj.dclr==null){
						obj.dclr = "无";
					}
					if(obj.spzt=="审批中"&&obj.dclr=="${emp.employeename}"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								<a href="bxty.jsp?bh=${"${obj.bh}"}"><img src="images/sub.gif" width="16" height="16"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}else if(obj.spzt!="新创建"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}
				})
			}else if(${emp.employeeId}=="1002"){ //代表出纳王思聪
				$.each(res.list,function(i,obj){
					if(obj.dclr==null){
						obj.dclr = "无";
					}
					if(obj.spzt=="已审批"&&obj.dclr=="${emp.employeename}"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								<a href='bxty.jsp?bh=${"${obj.bh}"}'><img src="images/sub.gif" width="16" height="16"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}else if(obj.spzt!="新创建"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}
				})
			}else if(${emp.employeeId}=="1000"){ //代表总经理谢飞
				$.each(res.list,function(i,obj){
					if(obj.dclr==null){
						obj.dclr = "无";
					}
					if(obj.spzt=="待审批"&&obj.dclr=="${emp.employeename}"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								<a href='bxty.jsp?bh=${"${obj.bh}"}'><img src="images/sub.gif" width="16" height="16"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}else if(obj.spzt!="新创建"){
						var tr = $(`<tr>
								<td>${"${obj.bh}"}</td>
								<td>${"${obj.tbrq}"}</td>
								<td>${"${obj.tbr}"}</td>
								<td>${"${obj.zje}"}</td>
								<td>${"${obj.spzt}"}</td>
								<td>${"${obj.dclr}"}</td>
								<td>
								<a href='ckbx2.jsp?bh=${"${obj.bh}"}'><img src="images/search.gif" width="16" height="15"></a>
								</td>
								</tr>`);
						$("tbody").append(tr);
					}
				})
			}	



				
	})
}
/* 首页 */
$("#sy").click(function(){
	var zt =$("#statusId").val(); //状态
	var rq = $("#startDate").val();//日期
	cs(zt,rq,1,5);
})
/* 上一页 */
$("#syy").click(function(){
	var zt =$("#statusId").val(); //状态
	var rq = $("#startDate").val();//日期
	if(pageInfo.hasPreviousPage){
		cs(zt,rq,pageInfo.prePage,5);
	}else{
		alert("已经是第一页了！");
	}
})
/* 下一页 */
$("#xyy").click(function(){
	var zt =$("#statusId").val(); //状态
	var rq = $("#startDate").val();//日期
	if(pageInfo.hasNextPage){
		cs(zt,rq,pageInfo.nextPage,5);
	}else{
		alert("已经是最后一页了！");
	}
})
/* 末页 */
$("#my").click(function(){
	var zt =$("#statusId").val(); //状态
	var rq = $("#startDate").val();//日期
	cs(zt,rq,pageInfo.lastPage,5);
})

/* 查询按钮 */
$(document).on("click","#claimVoucher_searchClaimVoucher_action_0",function(){
	var zt = $("#statusId").val();  //状态
	var rq = $("#startDate").val(); //日期
	cs(zt,rq,1,5)
})
//提交按钮
$(document).on("click","#tptj",function(){
	var bh = $(this).attr("date-c");
	if(confirm("确定要提交？")){
		$.getJSON("/commodityItem4/b/list2",{bh:bh},function(res){
			if(res.code=="200"){
				alert("提交成功！")
				var zt = $("#statusId").val();  //状态
				var rq = $("#startDate").val(); //日期
				cs(zt,rq,1,5)
			}
		})
	}	
})
//删除按钮
$(document).on("click","#tpsc",function(){
	var bh = $(this).attr("date-c");
	if(confirm("确定删除？")){
		$.getJSON("/commodityItem4/b/list3",{bh:bh},function(res){
			if(res.code=="200"){
				alert("删除成功！")
				var zt = $("#statusId").val();  //状态
				var rq = $("#startDate").val(); //日期
				cs(zt,rq,1,5)
			}
		})
	}	
})
</script>
</html>
