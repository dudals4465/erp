<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>공제사항 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
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
	border-right: 1px solid #E6E6E6;
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
	height: 100%;
	width: 1150px;
	border-bottom: 1px solid black;
   position: absolute;
   transform:translate(250px, 0);
}

ul {
	list-style: none;
}
#deductiontable,td{
	border-collapse: collapse;
}
td{
	border: 1px solid #D9EDF7;
}
</style>
</head>
<body>
	<div id="header">
		<div id="logo">
			<h1>
				<a href="/erp/myInfo/myInfo">N7 ERP SYSTEM</a>
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
					<li><a href='/erp/hr/receiptholiday'>휴가 접수</a></li>
					<li><a href='/erp/hr/attendance'>사원 출결 관리</a></li>
					<li><a href='/erp/hr/employeestatus'>근무 조회</a></li>
					<li><a href='/erp/hr/retiremm'>휴/퇴직 관리</a></li>
					<li><a href='/erp/hr/deptpay'>부서/직책 관리</a></li>
					<li><a href='/erp/hr/deduct'>공제사항 관리</a></li>
					<li><a href='/erp/hr/searchpaymm'>급여 관리</a></li>
		</ul>
	</div>
	<div id="description">
	<div class="first_div_css">
		<h1 class="deptregist_color_size">공제 금액 관리</h1>
	</div>
	<table id="deductiontable" width="100%">
		<tr style="background-color: #F8F7F7; text-align: center;">

		</tr>
	</table>
	</div>
</body>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
<script>
var moneyCheck = function(money){
	var length = money.length; //7
	var div = Math.floor(length/3); //2 
	var mod = length%3; //1
	var num = "";
	num += money.substr(0, mod) + "";
	for(let i = 0 ; i < div ; i++){
		if(mod==0&&i==0){
			num += money.substr((mod+(i*3)), 3);
		}else{
			num += "," + money.substr((mod+(i*3)), 3);
		}
	}
	return num;
}
$("#showMenu1").hover(function() {
	$("#smallMenu1").attr("style", "display:inline-block");
}, function() {
	$("#smallMenu1").attr("style", "display:none");
})
$("#showMenu2").hover(function() {
	$("#smallMenu2").attr("style", "display:inline-block");
}, function() {
	$("#smallMenu2").attr("style", "display:none");
})
$("#showMenu3").hover(function() {
	$("#smallMenu3").attr("style", "display:inline-block");
}, function() {
	$("#smallMenu3").attr("style", "display:none");
})

	$(function(){
		var str='<tr class="infomenu" style="text-align: center;"><td width="150px">공제 명</td><td width="150px">현재 공제금액</td><td width="150px">수정 금액</td><td width="150px"></td></tr>';
		var deduct=${deduct};
		console.log(deduct);
		for(var i=0;i<deduct.length;i++){
			str+="<tr align='center'><td>"+deduct[i].HDD_NAME+"</td>"
				 +"<td id='123"+deduct[i].HDD_NAME+"'>"+moneyCheck(deduct[i].HDD_AMOUNT.toString())+"</td>"
				 +"<td><input type='text' id='deduct_"+deduct[i].HDD_NAME+"'></td>"
				 +"<td><button type='button' onclick='modifydeduction(\""+deduct[i].HDD_NAME+"\")'>수정</button></td></tr>";
		}
		$("#deductiontable").html(str);
	});



	function modifydeduction(deduct){
		console.log($("#123"+deduct));
		var denum = $("#deduct_"+deduct).val();
		console.log(deduct);
		console.log(denum);
		$.ajax({
			url : '/erp/hr/modifydeduction',
			method : 'post',
			data : {deduct : deduct,denum : denum},
			success : function(data) {
				$("#123"+deduct).html(moneyCheck(data.toString()));
				$("#deduct_"+deduct).val('');
				console.log(data);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
</script>
</html>
