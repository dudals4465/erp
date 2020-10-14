<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>N7 ERP - 품목별 자재현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link href="/erp/img/favicon.png" rel="icon" />
<style>
#header {
	width: 100%;
	height: 200px;
}

#side_menu {
	height: 100%;
	width: 250px;
	font-size: 20px;
	font-weight: bolder;
	float: left;
}

#side_menu #menuList {
	list-style: none;
	margin-top: 150px;
}

#side_menu #menuList li {
	margin: 20px;
}

a {
	text-decoration: none;
}

#description {
	float: left;
    height:100%;
	width:1150px;
    position: absolute;
    transform:translate(300px, 0);
}

ul {
	list-style: none;
}

td, th, table {
	border: 1px solid white;
}

td, th {
	width: 100px;
	height: 30px;
}

tr {
	text-align: center;
}

button {
	width: 100px;
	height: 30px;
	background-color: #FFB2D9;
	border: 0px;
	border-radius: 8px;
	font-weight: bolder;
	font-size: 14px;
	color: white;
}

span {
	text-align: center;
	color: red;
}

input[type='text'], input[type='number'] {
	width: 70px;
}
#description *{
font-size: 20px;
font-weight: bolder;
}
input[type="button"]{
font-size: 20px;
font-weight: bolder;
}
body{
position: relative;
}
td{
width: 300px;
}
select{
width: 200px;
height: 50px;
}
option{
width: 200px;
height: 50px;
}
</style>
</head>
<body>
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<ul id="mainmenu"></ul>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
		</div>
	</div>
	<div id="side_menu">
		<ul id="menuList">
		</ul>
	</div>
<center>
	<div id="description">
	<div id="getCt_code">
	</div>
		<div id="getItemCodeFromItemCcode">
		</div>
		<div id="contain">
		</div>
	</div>
	</center>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	stockSideMenu();
	$.ajax({
		url:"/erp/stock/getcategory",
		type:"post",
		dataType:"json",
		success:function(result){
			if (result==null) {
				$('#description').html(' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 자재현황</div><div style="background-color:#F8F7F7;"><table><tr><td>거래내역이 없습니다.</td></tr></table></div>')
				return;
			}
			if(result.length==0){
				$('#description').html(' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 자재현황</div><div style="background-color:#F8F7F7;"><table><tr><td>거래내역이 없습니다.</td></tr></table></div>')
				return;
			}
			console.log(result)
			var str='<div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 자재 현황</div><div style="background-color:#F8F7F7;"><table><tr><td>분류 : </td><td><select id="selectit_ccode" onchange="getItemCodeFromItemCCode()"><option></option>';
			for(var i = 0;i<result.length;i++){
				str+='<option data-value="'+result[i].ct_code+'">'+result[i].ct_name+'</option>'
			}str+='</select></td></tr></table></div>'
			$('#getCt_code').html(str);
			
		},
		error:function(err){
			console.log(err)
		}
		
	});
	function getItemCodeFromItemCCode() {
		for(var i = 0;i<$('#selectit_ccode').children().length;i++){
			if($('#selectit_ccode').children()[i].selected ==true){
				$.ajax({
					url:"/erp/stock/getitemcode",
					data:{it_ccode:$('#selectit_ccode').children()[i].dataset.value},
					type:"get",
					dataType:"json",
					success:function(result){
					console.log(result);
					var str="<div style='background-color:#F8F7F7;'><table><tr><td>품목 : </td><td><select id='selectit_code' onchange='JsonParseObject({it_code:\"\"})'><option></option>";
					for(var i = 0;i<result.length;i++){
						str+='<option data-value="'+result[i].it_code+'">'+result[i].it_pname+":"+result[i].it_size+"("+result[i].it_unit+")"+'</option>'
					}str+='</select></td></tr></table></div>'
					$('#getItemCodeFromItemCcode').html(str);
					},
					error:function(err){
					console.log(err)		
					}
				});
			}
		}
	}
	
	function JsonParseObject(it_code) {
		
			for(var i = 0;i<$('#selectit_code').children().length;i++){
				if($('#selectit_code').children()[i].selected==true){
					it_code.it_code = $('#selectit_code').children()[i].dataset.value;
					getByItemStockList(it_code);
				}
			}
	}
	function getByItemStockList(it_code) {
		$.ajax({
			url:"/erp/stock/getbyitemstocklist",
			type:"post",
			data:it_code,
			dataType:"json",
			success:function(result){
				console.log(result)
				if(result==null){
					$("#contain").html("거래 현황이 없습니다.");
					return;
				}
				var str = '<div style="background-color:#F8F7F7;"><table><tr><td>품목코드</td><td>현재고</td></tr>';
				str+='<tr><td>'+result.ie_itcode+'</td><td>'+result.ie_qty+'</td></tr></table></div>'
				$('#contain').html(str)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	</script>
</body>
</html>