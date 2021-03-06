<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>N7 ERP - 기초재고 등록</title>
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
select{
width: 200px;
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
	width: 200px;
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
				<li><a href="/erp/myInfo/myInfo"
					accesskey="4" title="">내 정보</a></li>
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
	<form id="form" action="/erp/stock/confirmbasicstock" method="post"> 
		<input type="button" onclick="window.open('/erp/stock/setcategory','PopupWin','width=550,height=600')" value="분류코드 추가" >
		<input type="button" onclick="window.open('/erp/stock/setitemcode','PopupWin','width=565,height=600')" value="품목코드 추가" >
		<input type="button" onclick="window.open('/erp/stock/searchitemcode','PopupWin','width=1550,height=400')" value="품목코드 검색" >
		<div id="contain">
			<div class='div'>
			  <div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">기초재고 등록</div>
			<div style="background-color:#F8F7F7;">
			<input type="button" onclick="addRow(this)" value="행 추가">
				<table>
					<tr>
						<td>제품 코드</td>
						<td>수량</td>
						<td>단가</td>
						<td>총액</td>
						<td>삭제</td>
					</tr>
					<tr>
						<td class="itemcode" id='itemcode'></td>
						<td class='ie_qty'><input min="0" onkeyup="multiPrice(this)" onchange='multiPrice(this)' type='number' name='ie_qty' required="required"></td>
						<td class="ie_unit"><input type="number" min="0" onkeyup="multiplePrice(this)" onchange='multiplePrice(this)' required="required"></td>
						<td class='ie_price'><input min="0" type='number' name='ie_price' required="required"></td>
						<td><input class='deleteBox' type="checkbox"></td>
					</tr>
				</table>
				</div>
			</div>
		</div>
		<input type="button" id="deleteBtn" value="삭제">
		<input type="button" onclick="addClcode()" value="등록">
		</form>
	</div>
	</center>
	<script src=/erp/js/menu.js></script>
	<!-- 메뉴Ajax로 출력 -->
	<script>
		stockSideMenu();
		var itArr;
		var a = 1;
		getItemCode();
		function getItemCode() {
			$.ajax({
				url : "/erp/stock/getitemcode",
				type : "get",
				dataType : "json",
				success : function(result) {
					itArr = makeItSelect(result);
					console.log(result)
					$('#itemcode').html(itArr);
				},
				error : function(err) {
					console.log(err)
				}

			});
		}
		$('#account').click(
				function() {
					window.open('/erp/Account/comPany', 'comlist',
							'width=1350,height=500')
				})
		
		
		
		function makeItSelect(data) {
			var str = '<select  name = "ie_itcode"><option></option>';
			for (var i = 0; i < data.length; i++) {
				str += '<option value="'+data[i].it_code+'">' + data[i].it_code
						+ '</option>';
			}
			str += '</select>';
			return str;
		};
		function multiplePrice(id) {
			var ie_price = id.value;
			var ie_qty = $(id).parent().siblings('.ie_qty').children().val();
			$(id).parent().siblings('.ie_price').children().val(Number(ie_price)*Number(ie_qty));
			
		}
		function multiPrice(id) {
			var ie_qty = id.value;
			var ie_price = $(id).parent().siblings('.ie_unit ').children().val();
			$(id).parent().siblings('.ie_price').children().val(Number(ie_price)*Number(ie_qty));
			
		}
		$('#deleteBtn').click(function(){
			console.log($('.deleteBox')[0].checked)
			for(var i = 0 ; i < $('.deleteBox').length;i++){
				if($('.deleteBox')[i].checked==true){
					var child = $('.deleteBox')[i].parentNode.parentNode;
					child.parentNode.removeChild(child);
					i--;
				}
			}
		});
		function deleteTable(id) {
			$(id).parent().parent().remove();
		}
		function addRow(id) {
			var str = '<tr><td class="itemcode">'+itArr+'</td><td class="ie_qty"><input onkeyup="multiPrice(this)" min="0" onchange="multiPrice(this)" type="number" name="ie_qty" required="required"></td>'
				+'<td class="ie_unit"><input type="number" onkeyup="multiplePrice(this)" min="0" onchange="multiplePrice(this)" required="required"></td>'
				+'<td class="ie_price"><input type="number" min="0" name="ie_price" required="required"></td>'
				+'<td><input class="deleteBox" type="checkbox"></td></tr>';
				$(id).siblings("table").append(str);
		}
		
		function addClcode(){
			for(var i = 0; i < $('.itemcode').length;i++){
				if( $($('.itemcode')[i]).children("select").val()==''){
					alert("품목코드를 선택해주세요");
					return;
				}
			}
			document.getElementById("form").submit();
		}
		
	</script>
</body>
</html>