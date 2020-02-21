<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<body>
	<div class="action  divaction">
		<div class="t">月度统计列表</div>
		<div class="pages">
			<form id="claimVoucherStatistics_getDeptStatisticsByMonth_action"
				name="queryForm"
				action="../jboa/statistics/monthList?pageNum=1&pageSize=10"
				method="get">
				<label for="time">年份</label> <select name="year"
					id="claimVoucherStatistics_getDeptStatisticsByMonth_action_year">
					<option value="0">无</option>




					<option value="2013">2013年</option>






					<option value="2014">2014年</option>






					<option value="2015">2015年</option>






					<option value="2016">2016年</option>






					<option value="2017">2017年</option>






					<option value="2018">2018年</option>



				</select> <label for="time">开始月份</label> <select name="startMonth"
					id="claimVoucherStatistics_getDeptStatisticsByMonth_action_startMonth">
					<option value="0">无</option>




					<option value="1">1月份</option>






					<option value="2">2月份</option>






					<option value="3">3月份</option>






					<option value="4">4月份</option>






					<option value="5">5月份</option>






					<option value="6">6月份</option>






					<option value="7">7月份</option>






					<option value="8">8月份</option>






					<option value="9">9月份</option>






					<option value="10">10月份</option>






					<option value="11">11月份</option>






					<option value="12">12月份</option>



				</select> <label for="end-time">结束月份</label> <select name="endMonth"
					id="claimVoucherStatistics_getDeptStatisticsByMonth_action_endMonth">
					<option value="0">无</option>




					<option value="1">1月份</option>






					<option value="2">2月份</option>






					<option value="3">3月份</option>






					<option value="4">4月份</option>






					<option value="5">5月份</option>






					<option value="6">6月份</option>






					<option value="7">7月份</option>






					<option value="8">8月份</option>






					<option value="9">9月份</option>






					<option value="10">10月份</option>






					<option value="11">11月份</option>






					<option value="12">12月份</option>



				</select>
				<!-- <input type="hidden" name="year" value="2013"/> -->
				<input type="submit"
					id="claimVoucherStatistics_getDeptStatisticsByMonth_action_0"
					value="查询" class="submit_01">
			</form>
			<table width="90%" border="0" cellspacing="0" cellpadding="0"
				class="list items">
				<thead>
					<tr class="even">
						<td>编号</td>
						<td>总计</td>
						<td>年份</td>
						<td>月份</td>

						<td>操作</td>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>1</td>
						<td>￥7552.0</td>
						<td>2019年</td>
						<td>1月</td>

						<td><a target="rightFrame" href="ydbxq.html"> <img
								src="images/search.gif" width="16" height="15">
						</a></td>
					</tr>

					<tr>
						<td>2</td>
						<td>￥96987.0</td>
						<td>2018年</td>
						<td>5月</td>

						<td><a target="rightFrame"
							href="/jboa/statistics/monthDetails?departmentId=3&month=5">
								<img src="images/search.gif" width="16" height="15">
						</a></td>
					</tr>

					<tr>
						<td>3</td>
						<td>￥183441.0</td>
						<td>2018年</td>
						<td>6月</td>

						<td><a target="rightFrame"
							href="/jboa/statistics/monthDetails?departmentId=3&month=6">
								<img src="images/search.gif" width="16" height="15">
						</a></td>
					</tr>

					<tr>
						<td>4</td>
						<td>￥6333.0</td>
						<td>2019年</td>
						<td>8月</td>

						<td><a target="rightFrame"
							href="/jboa/statistics/monthDetails?departmentId=3&month=8">
								<img src="images/search.gif" width="16" height="15">
						</a></td>
					</tr>

					<tr>
						<td>5</td>
						<td>￥217231.0</td>
						<td>2018年</td>
						<td>11月</td>

						<td><a target="rightFrame"
							href="/jboa/statistics/monthDetails?departmentId=3&month=11">
								<img src="images/search.gif" width="16" height="15">
						</a></td>
					</tr>

					<tr>
						<td>6</td>
						<td>￥9224.0</td>
						<td>2018年</td>
						<td>12月</td>

						<td><a target="rightFrame"
							href="/jboa/statistics/monthDetails?departmentId=3&month=12">
								<img src="images/search.gif" width="16" height="15">
						</a></td>
					</tr>

				</tbody>
				<tr>
					<td colspan="7" align="center">
						<div class="page-bar">

							<a
								href="/jboa/statistics/monthList?year=&startMonth=&endMonth=&pageNum=1&pageSize=10">首页</a>
							&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <a
								href="/jboa/statistics/monthList?year=&startMonth=&endMonth=&pageNum=1&pageSize=10">末页</a>


							&nbsp;&nbsp; &nbsp;&nbsp;第 1页/共1页&nbsp;&nbsp;共6条记录

						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/common.js">
</script>

</head>
</html>
