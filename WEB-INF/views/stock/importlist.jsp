<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>N7 ERP - 입/출고 현항</title>
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
	width: 200px;
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

.span {
	float: left;
	width: 176px;
	text-align: center;
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
	<div id='description'>
	<div style="width:auto; background-color:#3D6B9B; color:white; padding:1%;">입/출고 내역</div>
		<div style="background-color:#F8F7F7;">
		입고 내역<input class='checkNum' type="radio" name='ie_status' value="1">출고
		내역<input class="checkNum" type="radio" name="ie_status" value="2"><br>
		시작일 : <input class='checkDate' id='date0' type="date" name='ie_date'><br>
		종료일 : <input class='checkDate' id='date1' type="date" name='ie_date2'
			readonly><br>
		<br>
		<center>
			<div id="contain"></div>
		</center>
			</div>
	</div>
	</center>
	<script src=/erp/js/menu.js></script>
	<!-- 메뉴Ajax로 출력 -->
	<script>
		stockSideMenu();
		getIeportList();
		function getIeportList(value, date1, date2) {
			$
					.ajax({
						url : "/erp/stock/getimportlist",
						type : "post",
						data : {
							ie_status : value,
							date1 : date1,
							date2 : date2
						},
						dataType : "json",
						success : function(result) {
							console.log(result);
							if (result == null) {
								$('#contain').html('입/출고 내역이 없습니다.')
								return;
							}
							if (result.length == 0) {
								$('#contain').html('입/출고 내역이 없습니다.')
								return;
							}
							var str = '  <table><tr><td>제품 코드</td><td>거래처</td><td>거래 일시</td><td>거래 분류</td><td>단가</td><td>수량</td><td>거래 사원</td><td>총액</td></tr>';
							for (var i = 0; i < result.length; i++) {
								str += '<tr><td>' + result[i].ie_itcode
										+ '</td>';
										if(result[i].ie_clcode!=undefined){
								str += '<td>' + result[i].ie_clcode + '</td>';
										}else{
											str += '<td></td>';
										}
								str += '<td>' + result[i].ie_date.substr(0, 10)
										+ '</td>';
								if (result[i].ie_status == 1) {
									str += '<td>입고</td>'
								} else if (result[i].ie_status == 2) {
									str += '<td>출고</td>'
								} else {
									str += '<td>반품</td>'
								}
								str += '<td>'
										+ Math.floor(Math.abs(result[i].ie_price/result[i].ie_qty)) + '</td>'
								str += '<td>' + Math.abs(result[i].ie_qty)
										+ '</td>'
								str += '<td>' + result[i].ie_hrcode + '</td>'
								str += '<td>' + Math.abs(result[i].ie_price)
										+ '</td></tr>'
							}
							str += '</table>';
							$('#contain').html(str);
						},
						error : function(err) {
							console.log(err);
						}
					});
		}
		$('.checkDate').change(function() {
			console.dir($('.checkDate')[1])
			$('.checkDate')[1].readOnly = false;
			var str1 = Number(replaceAll($('.checkDate')[0].value, "-", ""));
			var str2;
			if ($('.checkDate')[1].value != '') {
				str2 = Number(replaceAll($('.checkDate')[1].value, "-", ""));
				console.log(str1);
				if (str1 > str2) {
					alert("종료일은 시작일보다 이전일 수 없습니다.");
					return;
				}
			}
			var test = '';
			console.log($('.checkDate').length)
			for (var i = 0; i < $('.checkDate').length; i++) {
				if ($('.checkDate')[i].value == '') {
					return;
				}
			}
			for (var i = 0; i < $('.checkNum').length; i++) {
				if ($('.checkNum')[i].checked == true) {
					test = $('.checkNum')[i].value;
				}
			}
			if (test != '') {
				getIeportList(test, $('#date0').val(), $('#date1').val())
				return;
			}
			getIeportList(null, $('#date0').val(), $('#date1').val())
		})
		$('.checkNum').click(
				function() {
					if ($(this)[0].checked == true) {
						if ($('#date1').val() != '') {
							getIeportList($(this).val(), $('#date0').val(), $(
									'#date1').val())
						} else {
							getIeportList($(this).val())
						}
					}
				})
		function replaceAll(str, searchStr, replaceStr) {
			return str.split(searchStr).join(replaceStr);
		}
	</script>
</body>
</html>