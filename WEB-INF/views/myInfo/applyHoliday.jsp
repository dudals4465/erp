<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>휴가 신청</title>
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
.attendance{
	border: 1px solid black;
}
#menu2 {
	font-size: medium;
	}
	
	
.center{
	margin-left: 10%;
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
	<div id="description" class="out">
	
		<div class="first_div_css">
			<h1 class="deptregist_color_size">휴가 신청</h1>
		</div>
		
	<div class="center">
	<button id="approval" class="goodbtn" type="button">결재자등록</button>
	<form action="/erp/hr/applyholiday" method="post" onsubmit="return checkHoliday();">
	<table style='text-align: center;width: 900px;'>
	<tr><td class='infomenu'>결재자</td><td style="border: 2px solid blue;font-size: 20px;"><div id='line'><input id="aprover" style="border: 0px;"></div></td></tr>
	<tr class='infomenu'>
		<td>문서제목</td><td>휴가종류</td>
	</tr><tr>
		<td><input type="text" name="hap_docuname" placeholder="문서 제목을 입력해주세요 글자제한 20자" required="required" style="width:450px;font-size: 20px;"></td>
		<td>
			<select style="width:450px;font-size: 20px;" name="hap_type" id="type">
				<option value="year">연차</option>
				<option value="period">생리</option>
				<option value="pregnancy">임신/육아</option>
				<option value="etc">기타</option>
			</select>
		</td>
	</tr><tr class='infomenu'>
		<td>휴가시작일</td><td>휴가종료일</td>
	</tr><tr>
		<td><input type="date" name="hap_startday" required="required" id="start" style="width:450px;font-size: 20px;"></td>
		<td><input type="date" name="hap_endday" required="required" onchange='checkDateValue(start, end);' id="end" style="width:450px;font-size: 20px;"></td>
	</tr><tr>
		<td colspan='2' class='infomenu'>사유</td>
	</tr><tr>
		<td colspan='2'><textarea rows="10" cols="10" name="hap_reason" style="width:910px; resize:none;"></textarea></td>
	</tr>
	</table>
		<input type="submit" class='infobtn' value="제출" style="margin-left: 450px;">
	</form>
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
	
	function setChildValue(data) {
		console.log(data);
		if (data.tList1 != "") {
		var str = "";
			for ( var i in data.tList1) {
		        str +="<input type='text' id='aprover' name='hap_toapprover' value='"+data.tList1[i].hc_hrcode+"' hidden='true'>";
				str +=data.tList1[i].hc_position+"/" + data.tList1[i].m_name;
			}
			console.log(str)
			$("#line").html(str);
		};
	};
	var holidaycnt = "";
	$(document).ready(function(){
		$.ajax({
			url:"/erp/rest/hr/hrcardinfo",
			dataType:"json",
			type:"get",
			async:false,
			success : function(data){
				console.log(data);
				holidaycnt = data;
			}, error : function(err){
				console.log(err);
			}
		});
	});
	function checkHoliday(){
		var startDay = new Date($("#start").val());
		var endDay = new Date($("#end").val());
		var term = endDay - startDay;
		term = (term/86400000)+1;
		if($("#type").val()=="year"){
			if(holidaycnt.hc_holynum>=term){
				return true;
			}else{
				alert("남은휴가보다 더 많은 일수를 신청하셨습니다.");
				return false;
			}
		}
		if($("#aprover").val()==""){
			alert("결재자가 없습니다 결재자를 등록해주세요.");
			return false;
		}
		return true;
	}

	$("#approval").click(function() {
		console.log("123");
		window.open('/erp/hr/approvalLine', 'approvalLine', 'width=1400,height=700');
	});


	function replaceAll(str, searchStr, replaceStr) {
	    return str.split(searchStr).join(replaceStr);
	 }


	function checkDateValue(val1, val2){
		let date1 = Number(replaceAll(val1.value, "-", ""));
		let date2 = Number(replaceAll(val2.value, "-", ""));
		if(date1>date2){
			alert("종료일은 시작일보다 이전일 수 없습니다.");
			val2.value = "";
		}
	}

	</script>
</body>
</html>
