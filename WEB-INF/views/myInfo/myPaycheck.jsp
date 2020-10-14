<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>내 급여 명세서 보기</title>
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

#menu2 {
	font-size: medium;
	}

#side_menu {
	height: 100%;
	width: 250px;
	font-size: 20px;
	font-weight: bolder;
	float: left;
	border-right:1px solid #E6E6E6;
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
    position: absolute;
    transform:translate(250px, 0);
}

ul {
	list-style: none;
}
.leftmoney{
	padding-right:20px;
	text-align: right;
}
table,td{
	border-collapse: collapse;
}
body{
	font-weight:bold;
	color:black;
}
#month{
	font-size: 15px;
}
.dat{
	border:2px solid #D9EDF7;
	background-color: #ECEBEA;
}
</style>
</head>
<body onload="build();">
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
			<li><a href="/erp/myInfo/myInfo">내 정보 보기</a></li>
			<div id="myInfoMenu">
			</div>
			<li id="showMenu1">나의 결재함</li>
			<ul id="menu2" style="display: none;">
				<li>내가 올린 결재함</li>
				<ul id="smenu3" style="display: none;">
				<li id="apupPayment">진행중</li>
				<li id="apupBackpayment">반려</li>
				<li id="apupFinalpayment">결재완료</li>
				</ul>
				<li id="apdownPayment">내가 받은 결재함</li>
				<li id="acTemporary">임시저장 결재함</li>
			</ul>
		</ul>
	</div>
	<div id="description">
		<div class="first_div_css">
			<h1 class="deptregist_color_size">내 급여 명세서 보기</h1>
		</div>
	<table style="border: 2px solid #D9EDF7; width: 1150px; height: 100px; text-align: center;background-color: #F8F7F7;">
		<tr>
			<td class="dat">사원코드  </td>
			<td>${paycheck.hc_hrcode}</td>
			<td class="dat">이름  </td>
			<td width="265px">${paycheck.m_name}</td>
			<td class="dat">입사일  </td>
			<td>${paycheck.hc_joindate}</td>
		</tr>
		<tr>
			<td class="dat">부서  </td>
			<td>${paycheck.hc_dept}</td>
			<td class="dat">직급  </td>
			<td>${paycheck.hc_position}</td>
			<td class="dat">급여일</td>
			<td><input type="month" id="month" name="month"></td>
		</tr>
	</table>
	<div id="paycheckpage" align="center">

	</div>
	</div>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
	<script>
	$("#showMenu1").hover(function() {
		$("#menu2").attr("style", "display:inline-block");
	});
	
	$("#menu2").hover(function() {
		$("#smenu3").attr("style", "display:inline-block");
	});

	$("#apupFinalpayment").click(function() {
		$.ajax({
			url : '/erp/Account/apupFinalpayment',
			type : 'get',
			success : function(data) {
				$("#description").html(data);
			},
			error : function() {
			}
		});

	});
	
	$("#apupBackpayment").click(function() {
		$.ajax({
			url : '/erp/Account/apupBackpayment',
			type : 'get',
			success : function(data) {
				$("#description").html(data);
			},
			error : function() {
			}
		});

	});
	
	$("#apupPayment").click(function() {
		$.ajax({
			url : '/erp/Account/apupPayment',
			type : 'get',
			success : function(data) {
				$("#description").html(data);
			},
			error : function() {
			}
		});

	});

	$("#apdownPayment").click(function() {
		$.ajax({
			url : '/erp/Account/apdownPayment',
			type : 'get',
			success : function(data) {
				$("#description").html(data);
			},
			error : function() {
			}
		});

	});

	$("#acTemporary").click(function() {
		$.ajax({
			url:'/erp/Account/acTemporary',
			success:function(data) {
				console.log(data);
				$("#description").html(data);
			},
			error : function(err) {
				console.log(err);
			}
		});

	});
	
		$("#month").change(function(){
			var month=$("#month").val();
			console.log(month);

			$.ajax({
				url:"/erp/myinfo/paycheckselect",
				method:'POST',
				data:{month : month},
				dataType:'JSON',
				success:function(data){
					if(data!="1"){
					console.log(data);
					var provide=(Number(data.HDP_PAY)+Number(data.HP_INCEN)).toString();
					var ince=(Number(data.HP_INSURANCE)+Number(data.HP_TAX)).toString();
					var str='';
						str+="<table style='border:2px solid #D9EDF7;width:1150px;height:300px; text-align: center;background-color: #F8F7F7;'><tr>"
							+"<td class='dat'>지급내역</td>"
							+"<td class='dat'>지급액</td>"
							+"<td class='dat'>공제내역</td>"
							+"<td class='dat'>공제액</td></tr>"
							+"<tr><td class='dat'>기본급</td>"
							+"<td class='leftmoney'>"+moneyCheck(data.HDP_PAY)+"</td>"
							+"<td class='dat'>보험</td>"
							+"<td class='leftmoney'>"+moneyCheck(data.HP_INSURANCE)+"</td></tr>"
							+"<tr><td class='dat'>인센티브</td>"
							+"<td class='leftmoney'>"+moneyCheck(data.HP_INCEN)+"</td>"
							+"<td class='dat'>소득세</td>"
							+"<td class='leftmoney'>"+moneyCheck(data.HP_TAX)+"</td></tr>"
							+"<tr><td class='dat'>월차수당</td>"
							+"<td class='leftmoney'>"+moneyCheck(data.HP_MONTHLYBONUS)+"</td>"
							+"<td class='dat'>공제액계</td>"
							+"<td class='leftmoney'>"+moneyCheck(ince)+"</td></tr>"
							+"<tr><td class='dat'>급여 계</td>"
							+"<td class='leftmoney'>"+moneyCheck(provide)+"</td>"
							+"<td class='dat'>실지급액</td>"
							+"<td class='leftmoney'>"+moneyCheck(data.HP_REALMONEY)+"</td></tr>"
							$("#paycheckpage").html(str);
							
					}else if(data=="1"){
						$("#paycheckpage").html("<img src='http://mjscholarship.com/k1/board/images/no_article.gif' width='500px' height='350px'>");
					}
				},
				errorr:function(err){
					console.log(err);
					alert('이 달에 받은 급여가 없네요');
				}
			});
		});
		
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
			console.log(num);
			return num;
		}
	</script>
</body>
</html>
