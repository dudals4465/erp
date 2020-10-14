<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>N7 ERP - 품목별 거래현황</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
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
				<ul id="mainmenu"></ul></ul>
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
				$('#description').html(' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 거래현황</div><div style="background-color:#F8F7F7;"><table><tr><td>거래내역이 없습니다.</td></tr></table></div>')
				return;
			}
			if(result.length==0){
				$('#description').html(' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 거래현황</div><div style="background-color:#F8F7F7;"><table><tr><td>거래내역이 없습니다.</td></tr></table></div>')
				return;
			}
			console.log(result)
			var str=' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 거래현황</div><div style="background-color:#F8F7F7;"><table><tr><td>분류 : </td><td><select id="selectit_ccode" onchange="getItemCodeFromItemCCode()"><option></option>';
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
					if (result==null) {
						$('#description').html(' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 거래현황</div><div style="background-color:#F8F7F7;"><table><tr><td>거래내역이 없습니다.</td></tr></table></div>')
						return;
					}
					if(result.length==0){
						$('#description').html(' <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">품목별 거래현황</div><div style="background-color:#F8F7F7;"><table><tr><td>거래내역이 없습니다.</td></tr></table></div>')
						return;
					}
					var str="<div style='background-color:#F8F7F7;'><table><tr><td>품목 : </td><td><select id='selectit_code' onchange='JsonParseObject({it_code:\"\"})'><option></option>";
					for(var i = 0;i<result.length;i++){
						str+='<option data-value="'+result[i].it_code+'">'+result[i].it_pname+":"+result[i].it_size+"("+result[i].it_unit+")"+'</option>'
					}str+='</select></td></tr></table></div>'
					$('#getItemCodeFromItemCcode').html(str);
					JsonParseObject({it_ccode:""})
					},
					error:function(err){
					console.log(err)		
					}
				});
			}
		}
	}
	function getByItemDealList(it_code) {
		$.ajax({
			url:"/erp/stock/getbyitemdeallist",
			data:it_code,
			dataType:"json",
			type:"post",
			success:function(result){
				console.log(result)
				if(result.length==0){
					$('#contain').html('거래 내역이 없습니다.');
					$('#selectit_code').attr('readonly',true);
					return;
				}else{
					$('#selectit_code').attr('readonly',false);
				}
				var str = '<div style="background-color:#F8F7F7;"><table><tr><td>제품 코드</td><td>거래처</td><td>거래 일시</td><td>거래 분류</td><td>단가</td><td>수량</td><td>거래 사원</td><td>총액</td></tr>';
				for (var i = 0; i < result.length; i++) {
					var to = result[i].ie_date;
					str += '<tr><td>' + result[i].ie_itcode + '</td>';
					if(result[i].ie_clcode !=undefined){
						
					str += '<td>' + result[i].ie_clcode + '</td>';
					}else{
						str += '<td></td>';
					}
					str += '<td>' + to.substring(0,10)+ '</td>';
					if (result[i].ie_status == 1) {
						str += '<td>입고</td>'
					} else if(result[i].ie_status==2){
						str += '<td>출고</td>'
					}else{
						str += '<td>반품</td>'
					}
					str += '<td>' +Math.floor(Math.abs(result[i].ie_price/result[i].ie_qty)) + '</td>'
					str += '<td>' + Math.abs(result[i].ie_qty) + '</td>'
					str += '<td>' + result[i].ie_hrcode + '</td>'
					str += '<td>'+ Math.abs(result[i].ie_price)+ '</td></tr>'
				}
				str+='</table></div>'
				$('#contain').html(str)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	function JsonParseObject(it_code) {
		if(it_code.it_code==undefined){
			for(var i = 0;i<$('#selectit_ccode').children().length;i++){
				if($('#selectit_ccode').children()[i].selected==true){
					it_code.it_ccode = $('#selectit_ccode').children()[i].dataset.value;
					getByItemDealList(it_code);
				}
			}
		}else{
			for(var i = 0;i<$('#selectit_code').children().length;i++){
				if($('#selectit_code').children()[i].selected==true){
					it_code.it_code = $('#selectit_code').children()[i].dataset.value;
					getByItemDealList(it_code);
				}
			}
		}
	}
	</script>
</body>
</html>