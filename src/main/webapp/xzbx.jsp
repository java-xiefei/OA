<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
.img {
	cursor: pointer;
	width: 40px;
	height: 40px;
}
</style>
</head>
<body>
	<div class="action  divaction">
		<div class="t">报销单更新</div>
		<div class="pages">
			<form id="claimVoucher_updateClaimVoucher_action" name="claimForm"
				enctype="multipart/form-data" action="../jboa/page/addReim"
				method="post">
				<input type="hidden" name="statusId" value="1" id="status">
				<input type="hidden" id="rowNumber" name="rowNumber" value="0">
				<input type="hidden" id="claimId" name="claimVoucher.id" value="133">
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<caption>基本信息</caption>
					<tbody>
						<tr>
							<td>编&nbsp;&nbsp;号：${emp.employeeId }</td>
							<td>填&nbsp;写&nbsp;人：${emp.employeename }</td>
							<td>部&nbsp;&nbsp;门：${emp.departmentName }</td>
							<td>职&nbsp;&nbsp;位：${emp.positionName }</td>
						</tr>
						<tr>
							<td>总金额： <input type="text" name="totalCount" value="0"
								readonly="readonly" id="totalAccount"></td>
							<!-- <td>填报时间：2013-09-13 15:21:52</td>
							<td>状态：新创建</td>
							<td>待处理人：张平</td>-->
						</tr>
						<tr>
							<td colspan="4"><p>-------------------------------------------------------------------------------</p></td>
						</tr>
					</tbody>
				</table>
				<table id="myTable" width="90%" border="0" cellspacing="0"
					cellpadding="0" class="addform-base">
					<thead>
						<tr>
							<td width="30%">项目说明</td>
							<td width="30%">项目金额</td>
							<td width="30%">凭据截图</td>
							<td width="10%">操作</td>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<table id="detailTable" width="90%" border="0" cellspacing="0"
					cellpadding="0" class="addform-base">
					<tbody>
						<tr>
							<td width="30%"><input type="text" id="item"></td>
							<td width="30%"><input type="text"
								name="claimVoucherDetail.account" id="account"></td>
							<td width="30%"><input type="file" name="imgFile" id="desc1">
							</td>
							<td width="10%"><img src="images/add.gif" width="16"
								height="16" id="AddRow"></td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>*事由：</td>
							<td colspan="3"><textarea name="event" cols="66" rows="5"
									id="event"></textarea></td>
						</tr>
						<tr align="center" colspan="4">
							<td>&nbsp;</td>
							<td><input type="button" id="bc" name="bc" value="保存"
								class="submit_01"> <input type="button" id="tj"
								name="tj" value="提交" class="submit_01"> <input
								type="button" value="返回" onclick="window.history.go(-1)"
								class="submit_01"></td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>
	</div>
	<%-- console.info("${emp}");
$(function(){
	base64Data = new Array();
	function ffun(){		
		//选择预览图片
			var fr = new FileReader();//读取文件
			var file = this.files[0];//选择第一个文件
			var _temp = file.name.match(/\.jpg|\.png|\.gif|\.bmp/i);
			if (!_temp) {
				this.value = "";
				alert("目前只支持jpg,png,bmp,gif格式图片文件");
				return false;
			} else if (file.size > (1024 * 1024)) {
				this.value = "";
				alert("目前只支持小于1M大小图片文件");
				return false;
			}
			fr.readAsDataURL(file);//读取文件
			//操作文件事件
			fr.onload = function() {
				base64Data[0] = this.result;//获得base编码字符串格式
				$(".imga1").attr("src", base64Data[0]);//显示图片
			};
	}
	$(document).on("click","#AddRow",function(){
		var a = $("#item").val();	//项目说明
		var b = $("#account").val();	//项目金额
		var c = $("");//凭据截图
		var tr=$(`
				<tr>
				<td width="30%">${"${a}"}</td>
				<td width="30%">${"${b}"}</td>
				<td width="30%"><img class="imga1" src="" width="16"
					height="16"></td>
				<td width="30%"><img src="images/delete.gif" width="16"
					height="16"></td>
			</tr>
				`);
		$(this).parents("tr").before(tr);
		ffun();
	})
}) --%>

</body>

<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
//data:base64数据       name:文件名(feng.jpg)
var imgObj = {
	"data" : "",
	"name" : ""
};//图片对象

var i=parseInt(1);  
var rowNumber=parseInt(1);  
var totalAccount = 0;


var bb={};
var aa=[];
var cc=[];
$(function(){	
	
	/* 保存 */
	$("#bc").click(function(){
/* 
   $('#detailTable tr').each(function(i){     // 遍历 tr
       $(this).children('td').each(function(j){  // 遍历 tr 的各个 td
         alert("第"+(i+1)+"行，第"+(j+1)+"个td的值："+$(this).text()+"。");
      });
   }); */
		//报销主表
		var total_count = $("#totalAccount").val();//报销总金额
		if(total_count>=5000){
			bb["next_deal_man"]= 1000;//下个处理人
		}else{
			bb["next_deal_man"]= 1004;//下个处理人
		}
		
		bb["create_man"]=${emp.employeeId }; //报销人
		var date=new Date();
		var createTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
		bb["create_time"]=createTime; //创建时间
		bb["department_id"]=3;//部门编号
		bb["event"]= $("#event").val(); //报销事由
		bb["total_count"]=total_count; //总金额
		bb["status_id"]= 1; //状态	
		//报销详表
		if(c>0){
			bb["baoxiao"]=cc;
		}else{
			bb["baoxiao"]=aa;
		}
		console.info(aa); 
		 console.info(bb); 
		 console.info(cc); 
		 $.ajax("/commodityItem4/b/list", {
				type : "post",//非常重要
				dataType : "json",
				contentType : "application/json",//非常重要
				data : JSON.stringify(bb),//非常重要
				success : function(data) {
					if (data.code == 200) {
						alert("保存成功");
						cc = [];
						bb = {};
						aa = [];
						c = 0;
					} else {
						alert("保存失败");
						cc = [];
						bb = {};
						aa = [];
						c = 0;
					}
				}
			}) 
		})
		
	/* 提交 */
	$("#tj").click(function(){
		var total_count = $("#totalAccount").val();//报销总金额
		if(total_count>=5000){
			bb["next_deal_man"]= 1000;//下个处理人
		}else{
			bb["next_deal_man"]= 1004;//下个处理人
		}
		
		bb["create_man"]=${emp.employeeId }; //报销人
		var date=new Date();
		var createTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
		bb["create_time"]=createTime; //创建时间
		bb["department_id"]=3;//部门编号
		bb["event"]= $("#event").val(); //报销事由
		bb["total_count"]=total_count; //总金额
		bb["status_id"]= 2; //状态	
		//报销详表
		//报销详表
		if(c>0){
			bb["baoxiao"]=cc;
		}else{
			bb["baoxiao"]=aa;
		}
		console.info(bb); 
		  $.ajax("/commodityItem4/b/list", {
				type : "post",//非常重要
				dataType : "json",
				contentType : "application/json",//非常重要
				data : JSON.stringify(bb),//非常重要
				success : function(data) {
					if (data.code == 200) {
						alert("提交成功");
						cc = [];
						bb = {};
						aa = [];
						c = 0;
					} else {
						alert("提交失败");
						cc = [];
						bb = {};
						aa = [];
						c = 0;
					}
				}
			}) 
	})
	$("#AddRow").click(function(){
		var tr=$("#myTable tr").eq(0).clone();
		++i;
		var j=i-1;		
		var item = $("#item").val();
		var account = $("#account").val();
		var desc = $("#desc").val();
		var desc1 = $("#desc1").val();
		var file = $("#desc"+j)[0].files[0];
		
		if(!file){
			alert("请选择文件");
			i--;
			return;
		}
		if(item == ""){
			alert("请输入项目说明");
			i--;
			return false;
		}
		if(account == ""){
			alert("请输入项目金额");
			i--;
			return false;
		}else{
			if(isNaN(account)){
				alert("请输入正确的数字");
				i--;
				return false;
			}else{
				if(account<=0){
					alert("请输入正确的数字");
					i--;
					return false;
				}
			}
		}
		
		totalAccount=parseFloat(totalAccount)+parseFloat(account);
		
		tr.find("td").get(0).innerHTML="<input  id=item"+j+" name='shixiang' type=hidden value="+item+" />"+item;
		tr.find("td").get(1).innerHTML="<input  id=account"+j+" name='subTotal' type=hidden value="+account+" />"+account;
		tr.find("td").get(2).innerHTML="<img class='img' id=img"+j+" src=''>";		
		tr.find("td").get(3).innerHTML="<img src=images/delete.gif width=16 height=16 id=DelRow"+j+" onclick=delRow("+j+",this) />";
		//图片操作
		var fr = new FileReader();
		var fileEle = "<input type='file' name='imgFile' id='desc"+(j+1)+"'>";
		
		$("#desc"+j).after(fileEle);
		fr.readAsDataURL(file);//读取文件
		//操作文件事件
		fr.onload = function() {
			var base64Data = this.result;//获得base编码字符串格式
			imgObj.name = file.name;//设置文件名
			imgObj.data = base64Data.substring(base64Data
					.indexOf(';base64,') + 8);//设置base64数据字符串
			$("#img"+j).attr("src", base64Data);//显示图片
			var name={"subTotal":account,"desc":item,"pictrue_name":base64Data,"pictrue_path":null};
			aa.push(name);
		};
		tr.show();
		tr.appendTo("#myTable");
		//传递一共添加多少问题 
		$("#account").attr("value","");
		$("#item").attr("value","");
		$("#desc"+j).hide()
		$("#totalAccount").attr("value",totalAccount);
		$("#item").val("");	//清空
		$("#account").val("");//清空

	});	
	
});
var c = 0;
function delRow(id,obj){	
	c++;
	var account = $("#account"+id).val();
	$(obj).parent().parent().remove();
	$("#desc"+id).remove();
	totalAccount=parseFloat(totalAccount)-parseFloat(account);
	$("#totalAccount").attr("value",totalAccount);

	var td = $(obj).parents("tr").children(':first').text();
	
	aa.forEach((value,index,array)=>{

		if(value.desc == td){

		 // array.splice(value,1)

		  delete array[index]        //方法二
		}  })  
	aa.forEach((value,index,array)=>{

		if(value.name != td){

		cc.push(value);

		}  })
}


function submitClaimVoucher(action){
	var shixiang = $("[name='shixiang']");
	if(shixiang.length == 0){
		alert("请输入至少一条明细");
		return false;
	}
	var event = $("#event").val();
	if(event == ""){
		alert("请输入报销事由");
		return false;
	}
	
		
		if (action == '保存'){
			document.claimForm.status.value = 1;
		}else{
			document.claimForm.status.value = 2;
		}
		document.claimForm.submit();
   		
 }

//图片检查
$("[name='imgFile']").on("change", function(e) {
	var file = this.files[0];
	var _temp = file.name.match(/\.jpg|\.png|\.gif|\.bmp/i);
	if (!_temp) {
		this.value = "";
		alert("目前只支持jpg,png,bmp,gif格式图片文件");
		return false;
	} else if (file.size > (1024 * 1024)) {
		this.value = "";
		alert("目前只支持小于1M大小图片文件");
		return false;
	}
});
</script>
</html>