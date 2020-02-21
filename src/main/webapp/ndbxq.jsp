<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div class="action  divaction">
		<div class="t">年度统计详情</div>
		<div class="pages">
			<form id="compYearStatistics_getDetailExcel_action" name="queryForm"
				action="../jboa/statistics/yearExcel" method="get">
				<label for="time">年份:</label> 2018 <input type="hidden"
					name="currYear" value="2018"
					id="compYearStatistics_getDetailExcel_action_currYear"> <input
					type="submit" id="compYearStatistics_getDetailExcel_action_0"
					value="导出报表" class="submit_01">

			</form>






			<table width="90%" border="0" cellspacing="0" cellpadding="0"
				class="list items">
				<thead>


					<tr class="even">
						<td>部门编号</td>
						<td>部门</td>
						<td>报销总额</td>
						<td>年份</td>
					</tr>

				</thead>
				<tbody>




					<tr>
						<td>0</td>
						<td>总经理</td>
						<td>￥140000.0</td>
						<td>2018年</td>
					</tr>





					<tr>
						<td>1</td>
						<td>财务部</td>
						<td>￥4980.0</td>
						<td>2018年</td>
					</tr>





					<tr>
						<td>2</td>
						<td>人事部</td>
						<td>￥224.0</td>
						<td>2018年</td>
					</tr>





					<tr>
						<td>3</td>
						<td>研发部</td>
						<td>￥297243.0</td>
						<td>2018年</td>
					</tr>





					<tr>
						<td>4</td>
						<td>测试部</td>
						<td>￥60436.0</td>
						<td>2018年</td>
					</tr>



					<tr>
						<td></td>
						<td bgcolor="yellow">总计</td>
						<td bgcolor="yellow">￥502883.0</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>


				</tbody>
			</table>
		</div>
		<!-- <span style="display: none;"><iframe id="downloadIframe" src=""
				style="width: 0px; height: 0px;"></iframe></span>
		增加报销单 区域 结束 -->
	</div>
	<div id="echartsDom"
		style='width: 702px; heigth: 400px; background: #fff; clear: both; padding-top: 20px; padding-left: 40px;'>

	</div>
	<div style="width: 542px; background: #fff; padding-left: 200px;">
		<input type="button" class="submit_01" value="查看柱状图"
			onclick="initEcharts('bar')" /> <input type="button"
			class="submit_01" value="查看饼图" onclick="initEcharts('pie')" /> <input
			type="button" class="submit_01" value="查看曲线图"
			onclick="initEcharts('line')" />
	</div>

</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="UTF-8"></script>
<script type="text/javascript">
	$(function(){
		initEcharts('pie');
	});
	
	function initEcharts(type){
		var data = [{"money":140000.0,"name":"presidentXi"},{"money":4980.0,"name":"王健林"},{"money":224.0,"name":"任正非"},{"money":297243.0,"name":"鲁昌盛"},{"money":60436.0,"name":"袁愈辉"}];
		var xAxis = new Array();
		var legend = new Array(); 
		for(var i=0;i<data.length;i++){
			xAxis[i] = data[i].name;
			legend[i] = data[i].money;
		}
		var year = 2018;
		var departmentName = '总经理';
		var option = null;
		if(type=='bar'){
			option = {
			    title: {
			    	text: year+'年'+departmentName+'月度报销统计图'
			    },
			    tooltip: {},
			    legend: {
			        data:['报销金额']
			    },
			    xAxis: {
			        data: xAxis
			    },
			    yAxis: {},
			    series: [{
			        name: '报销金额',
			        type: 'bar',
			        barWidth : 30,
			        data: legend
			    }]
			};
		}else if(type=="pie"){
			option = {
			    title: {
			    	text: year+'年'+departmentName+'月度报销统计图'
			    },
			    tooltip: {},
			    series: [{
			        name: '报销金额',
			        type: 'pie',
			        radius:'60%',
			        label : {
			        	normal : {
			        		formatter: '{b}: ({d}%)',
			        		textStyle : {
				        		fontWeight : 'normal',
				        		fontSize : 15
			        		}
			        	}
			        }
			    }],
			    dataset:{
			    	source:data
			    }
			};
		}else{
			option = {
			    title: {
			    	text: year+'年'+departmentName+'月度报销统计图'
			    },
			    tooltip: {},
			    legend: {
			        data:['报销金额']
			    },
			    xAxis: {
			        data: xAxis
			    },
			    yAxis: {},
			    series: [{
			        name: '报销金额',
			        type: 'line',
			        barWidth : 30,
			        data: legend
			    }]
			};
		}
		var dom = document.getElementById('echartsDom');
		$("#echartsDom").height('400px');
		var myChart = echarts.init(dom);
		if (myChart != null && myChart != "" && myChart != undefined) {//关键
	        myChart.dispose();
	    }
		var myChart = echarts.init(dom);
		myChart.setOption(option);
	}
</script>
</html>