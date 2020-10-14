<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>사원 급여 관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />

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


span {
	text-align: center;
	color: red;
}
#wages,td{
	border-collapse: collapse;
	border:1px solid #D9EDF7;
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
		<h1 class="deptregist_color_size">사원 급여 관리</h1>
	</div>
	<div align="right" >
		<input type="text" id="findcheckpayid" placeholder="아이디 이름 검색" autocomplete="off" style="padding: 5px 5px;font-size: medium;">
		<input type="button" id="checkpayid" onclick="checkpayid()" value="검색" class="infobtn">
	</div>
	<div id="container">
	</div>
	<div id="paging" align="center">
	</div>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	//검색창에 포커스 들어가서 Enter치면 검색 클릭
	$("#findcheckpayid").keyup(function(event){
		if(event.keyCode==13){
			$("#checkpayid").click();
		}
	});

	//사원들 급여 조회
	$(function(){
	/* 	$.ajax({
			url:"/erp/hr/searchwages",
			method:'POST',
			dataType:'JSON',
			success:function(data){
				console.log(data);
				console.log(data[0].HC_ID);
				console.log(data.length);
				var str='';
				var da=data.toString();
				for(var i=0;i<data.length;i++){
					var result=data[i].HDP_PAY-data[i].HDD_AMOUNT;
					str+="<tr id='\""+data[i].HC_ID+"\"'><td>"+data[i].HC_ID+"</td>"
						+"<td>"+data[i].M_NAME+"</td>"
						+"<td>"+data[i].HC_DEPT+"</td>"
						+"<td>"+data[i].HC_POSITION+"</td>"
						+"<td>"+data[i].HDP_PAY+"</td>"
						+"<td>"+data[i].HDD_AMOUNT+"</td>"
						+"<td>"+result+"</td>"
						+"<td><button type='button' onclick='clickwages(\""+data[i].HC_ID+"\")'>입력 수정하기</button></td>"
						+"<td><button type='button' onclick='wages(\""+data[i].HC_ID+"\")'>상세보기</button></tr>";
				}
				$("#wages").append(str);
			},error:function(err){
				console.log(err);
			}
		}); */
		paging(1);
	});

	var currPage = 1;
	function pageNumber(j){
		currPage = j;
		$.ajax({
			url:"/erp/rest/hr/wagespagenumber",
			dataType:"json",
			method:"get",
			success : function(page){
				console.log(page);
				var pagecnt = (page/10) + 1;
				let str = "";
				for(let i = 1 ; i < pagecnt ; i++){
					if(i == currPage){
						str += " &nbsp; ["+ i +"] &nbsp; ";
					}else{
						str += " &nbsp; <a href='javascript:paging("+i+")'>["+ i +"]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}

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
	
	function wagesList(nowPage){
		$.ajax({
			url:"/erp/rest/hr/wageslist",
			dataType:"json",
			data:{nowPage : nowPage, cntPerPage : "10"},
			method:"get",
			success : function(data){
				console.log(data);
				console.log(data[0].HC_ID);
				console.log(data.length);
				var str='';
				var da=data.toString();
				str +='<table id="wages" style="text-align: center; width: 100%;">';
				str += '<tr class="infomenu">';
				str += '<td>아이디</td><td>이름</td><td>부서</td><td>직급</td><td>급여</td><td>기본공제액</td><td>기본수령액</td><td colspan="2"></td></tr>';
				for(var i=0;i<data.length;i++){
					var result=data[i].HDP_PAY-data[i].HDD_AMOUNT;
					str+="<tr id='\""+data[i].HC_ID+"\"'><td>"+data[i].HC_ID+"</td>"
						+"<td>"+data[i].M_NAME+"</td>"
						+"<td>"+data[i].HC_DEPT+"</td>"
						+"<td>"+moneyCheck(data[i].HC_POSITION.toString())+"</td>"
						+"<td>"+moneyCheck(data[i].HDP_PAY.toString())+"</td>"
						+"<td>"+moneyCheck(data[i].HDD_AMOUNT.toString())+"</td>"
						+"<td>"+moneyCheck(result.toString())+"</td>"
						+"<td><button type='button' class='infobtn' onclick='clickwages(\""+data[i].HC_ID+"\")'>입력수정</button></td>"
						+"<td><button type='button' class='infobtn' onclick='wages(\""+data[i].HC_ID+"\")'>상세보기</button></tr>";
				}
				str += '</table>'
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}
	function paging(num){
		pageNumber(num);
		wagesList(num);
	}


	//사원 급여관리 수정 및 입력페이지 이동
	function clickwages(hc){
		$.ajax({
			url:"/erp/hr/paydetai",
			method:"get",
			data:{hc:hc},
			dataType:"html",
			success:function(data){
				location.href="/erp/hr/payinputmodify";
			},
			error:function(err){
				console.log(err);
			}
		});
	}
	//사원 급여 명세서 상세페이지 이동
	function wages(hc){
		$.ajax({
			url:"/erp/hr/paydetai",
			method:"get",
			data:{hc:hc},
			dataType:"html",
			success:function(data){
				location.href="/erp/hr/paydetail";
			},
			error:function(err){
				console.log(err);
			}
		});
	}

	//사원 이름 or 아이디 검색
	function checkpayid(){
		var checkpayid=$("#findcheckpayid").val();
		console.log(checkpayid);
		$.ajax({
			url:"findcheckpayid",
			method:'post',
			data:{checkpayid : checkpayid},
			dataType:"json",
			success:function(data){
				console.log(data);
				$("#wages").html(data);
			},
			error:function(err){
				console.log(err);
			}
		});
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


	</script>
</body>
</html>
