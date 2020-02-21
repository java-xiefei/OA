<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
							<td>总金额：<input type="text" id="zje"></td>
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
					<tbody id="ttbo">						
							
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
				<table style="margin-top: 15px;" width="90%" border="0" cellspacing="0" cellpadding="0"
					class="addform-base">
					<tbody>
						<tr>
							<td>*事由：</td>
							<td colspan="3"><textarea name="event" cols="66" rows="5"
									id="event"></textarea></td>
						</tr>
					</tbody>

				</table>
				<p>&nbsp;</p>

				<p>&nbsp;</p>
				<p>
				<input type="button" value="提交" id="tj"
						class="submit_01">
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
	console.info(res);
	$("#bh").text(res.bh);
	$("#tbr").text(res.tbr);
	$("#bm").text(res.bm);
	$("#zw").text(res.zw);
	$("#zje").val(res.zje);
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
			"<td><img src=images/delete.gif width=16 height=16 onclick=delRow("+i+",this)></td>"+
				"</tr>")
				$("#ttbo").append(tr);		
			base64Data[i] = obj.pictrueName;//获得base编码字符串格式
			/* $("#jh"+i).attr("src",base64Data[i]);//显示图片
			console.info("#jh"+i)
			console.info(base64Data[i]) */
			$("#img"+i).attr("src",base64Data[i]);
	})
})

//data:base64数据       name:文件名(feng.jpg)
var imgObj = {
	"data" : "",
	"name" : ""
};//图片对象

var aa = [];
var i=parseInt(1);  
var rowNumber=parseInt(1);  
var totalAccount = 0;
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
		tr.find("td").get(2).innerHTML="<img class='img' id=imgs"+j+" src=''>";		
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
			$("#imgs"+j).attr("src", base64Data);//显示图片
			var name={"main_id":bh,"subTotal":account,"desc":item,"pictrue_name":base64Data,"pictrue_path":null};
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
		var zje = 0;;
		$("#ttbo tr").each(function(){
			var je = $(this).children("td:eq(1)").text();
			zje = zje + parseInt(je)
		})
		console.info(zje)
		$("#zje").val(zje);
	});	

function delRow(id,obj){	
	var account = $("#account"+id).val();
	$(obj).parent().parent().remove();
	$("#desc"+id).remove();
	totalAccount=parseFloat(totalAccount)-parseFloat(account);
	$("#totalAccount").attr("value",totalAccount);
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
$("#tj").click(function(){
	var bb = {};
	bb["zje"] = $("#zje").val(); //总金额
	bb["sy"] = $("#event").val(); //事由
	bb["zt"] = 2; //状态
	bb["bh"] = bh; //编号
	bb["baoxiao"] = aa;
	console.info(bb);
	 $.ajax("/commodityItem4/b/list6", {
			type : "post",//非常重要
			dataType : "json",
			contentType : "application/json",//非常重要
			data : JSON.stringify(bb),//非常重要
			success : function(data) {
				if (data.code == 200) {
					alert("提交成功");
				} else {
					alert("提交失败");
				}
			}
		}) 
})
</script>
</html>