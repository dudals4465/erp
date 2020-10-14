<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>부서 직책 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
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
   position: absolute;
   transform:translate(250px, 0);
}

ul {
	list-style: none;
}
#id,td{
	border:1px solid #D9EDF7;
	border-collapse: collapse;
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
		<h1 class="deptregist_color_size">부서 직책 관리</h1>
	</div>
	<div align="right" width="100%">
	<table>
		<tr id="seldplist">
			<td><select id="disdept" name="disdept" onchange="changeDept()" style="padding: 5px 10px;width: 150px;"><option selected="selected"
						 value="">부서 선택</option>
			</select></td>
			<td><select id="disposition" name="disposition" style="padding: 5px 10px;width: 150px;"><option selected="selected"
						 value="">직급 선택</option>
			</select></td>
			<td><button type="button" class="infobtn" onclick="distinct()">검색</button></td>
		</tr>
	</table>
	</div>
	<div id="container" style="overflow:auto; height: 500px;">
	<table id="id" align="center" width="100%" style="text-align: center;">
		<tr class="infomenu">
			<td>부서</td>
			<td>직급</td>
			<td>금액</td>
			<td>수정 금액</td>
			<td colspan="2"></td>
		</tr>
	</table>
	</div>
 </div>
</body>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
<script>
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
	
	//현재 부서와 직급 갯수 대로 반복 출력
	$(function() {
		var dept = ${dept};
		console.log(${dept});
		console.log(dept.length);
		for(var i=0;i<dept.length;i++){
			console.log(dept[i].HDP_num+dept[i].HDP_pay);
			$("#id").append("<tr align='center'><td width='200px'>"+dept[i].HDP_dept+"</td>"
			+"<td width='200px'>"+dept[i].HDP_position+"</td>"
			+"<td id='"+dept[i].HDP_num+"' width='200px'>"+moneyCheck(dept[i].HDP_pay.toString())+"</td>"
			+"<td><input id='modifypay_"+dept[i].HDP_num+"'></td>"
			+"<td><button type='button' class='infobtn' id='"+dept[i].HDP_num+dept[i].HDP_pay+"'  onclick='dify("+dept[i].HDP_num+")'>수정</button></td>"
			+"<td><button type='button' class='infobtn' onclick='erase("+dept[i].HDP_num+")'>삭제</button></td></tr>");
		}
	});

// 	$(function(){
// 		var division = ${dept};
// 		for(var i=0;i<division.length;i++){
// 			var num=division[i].HDP_num;
// 			var p=division[i].HDP_pay;
// 			$("#modifypay_"+division[i].HDP_num).keyup(function(event){
// 			console.log(num+","+p);
// 				if(event.keyCode==13){
// 					$("#"+num+p).click();
// 				}
// 			});
// 		}
// 	});



	//부서 직급 페이지 에서 급여 수정
	function dify(dept) {
		var paymodify = $("#modifypay_"+dept).val();
		console.log("paynum("+dept+")="+paymodify);
		console.log(dept);
		$.ajax({
			url : "modifydeptpay",
			method : "post",
			dataType:"JSON",
			data : {dept : dept, pay : paymodify},
			success : function(data) {
				$("#"+dept).html(data);
				$("#modifypay_"+dept).val('');
			},
			error : function(err) {
				console.log(err);
			}
		});
	}


	//부서 직급 페이지 해당 부서,직급 삭제
	function erase(deptnum) {
		console.log(deptnum);
		$.ajax({
			url : "deptdelete",
			method : "post",
			data : {deptnum : deptnum},
			dataType: 'JSON',
			success : function(data) {
				location.reload();
			},
			error : function(err) {
				alert("해당 부서와 직책을 사용하는 사원이 있습니다. 제거하고 다시 시도해 주세요.");
			}
		});
	}


	//부서 직책 검색전 <select>문 목록
	$(function(){
		var str='';
		var distinctposition=${distinctposition};
		var distinctdept=${distinctdept};
		for(var i=0;i<distinctdept.length;i++){
			$("#disdept").append("<option>"+distinctdept[i].HDP_dept+"</option>");
		}
	});
	function changeDept(){
		var id=$("#disdept");
		console.log(id.val());
		$.ajax({
			url:"deptsearchposition",
			method : "get",
			dataType : "json",
			data : {"dept" : id.val()},
			success : function(data){
				let str = "";
				str += "<select name='dispostion' class='detailInfo' id='disposition'>";
				for(let i = 0 ; i<data.length ; i++){
					str += "<option value='"+data[i].HDP_position+"'>"+data[i].HDP_position+"</option>";
				}
				str += "</select>"
				$("#disposition").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}
	//부서 직책 검색기능
	function distinct(){

		var disdept=$("#disdept").val();
		var disposition=$("#disposition").val();
		console.log(disdept);
		console.log(disposition);
		$.ajax({
			url:'distinct',
			method:'post',
			data:{disdept:disdept,disposition:disposition},
			dataType:'json',
			success:function(data){
				var str='<tr align="center" class="infomenu"><td>부서</td><td>직급</td><td>금액</td><td>수정 금액</td><td colspan="2"></td></tr>';
				for(var i=0;i<data.length;i++){
					str+="<tr align='center'><td width='200px'>"+data[i].HDP_dept+"</td>"
					+"<td width='200px'>"+data[i].HDP_position+"</td>"
					+"<td id='"+data[i].HDP_num+"' width='200px'>"+moneyCheck(data[i].HDP_pay.toString())+"</td>"
					+"<td><input id	='modifypay_"+data[i].HDP_num+"'></td>"
					+"<td><button type='button' class='infobtn' id='"+data[i].HDP_num+data[i].HDP_pay+"' onclick='dify("+data[i].HDP_num+")' class='mopay'>수정</button></td>"
					+"<td><button type='button' class='infobtn' onclick='erase("+data[i].HDP_num+")' class='mopay'>삭제</button></td></tr>";
					console.log(data[i].HDP_num);
				}
				$("#id").html(str);
			},
			error:function(err){
				console.log(err);
			}

		});
	}


</script>
</html>
