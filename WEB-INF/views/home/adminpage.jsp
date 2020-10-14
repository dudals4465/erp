<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : UpRight
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130526

-->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
		<link href="/erp/img/favicon.png" rel="icon" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="lib/icomoon/icomoon.css" rel="stylesheet" />
  <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1a9e4h5a1u&callback=initMap"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous" />
	<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
	<style>
.button {
	color: #ffffff;
}

#desc {
margin-left: 200px;
	font-size: 20px;
	font-weight: bolder;
}

#description{
	position:relative;
}

td{
	padding-top:6px;
	padding-bottom: 6px;
}
</style>
</head>

<body>
	<div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/adminpage">ERP 등록</a></li>
				<li><a href="/erp/companymanager" accesskey="3" title="">회사 관리</a></li>
				<li><a href="/erp/membermanager" accesskey="4" title="">회원 관리</a></li>
			</ul>
		</div>
	</div>
	<div id="description" class="out" style="height: 700px;">
	<div style='width:100%; height:50px; text-align:center; background-color: #3D6B9B;'><h1 style='color:white'>회사관리</h1></div>
	<div class="center" style="height:500px; width:1000px; text-align:center;">
	
	<div id="container"></div>
	</div>
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"/erp/rest/admin/companytemp",
			dataType:"json",
			method:"get",
			success : function(data){
				console.log(data);
				let str = "";
				if(data.length == 0){
					str += "<img src='https://www.gptour.go.kr/images/common/no-data.png'><br>";
					str += "<font style='color : red;'>현재 등록된 신청이 존재하지 않습니다.</font>"
				}else{
			 		str = "<table>"
					str += "<tr class='infomenu admin'><td style='width:170px;'>회사이름</td>";
					str += "<td style='width:220px;'>회사코드</td><td style='width:450px;'>주소</td><td style='width:150px;'>대표자</td>";
					str += "<td style='width:150px;'>업태</td><td style='width:150px;'>분류</td>";
					str += "<td style='width:220px;'>전화번호</td><td style='width:200px;'>사업자번호</td><td style='width:75px;'>수정</td><tr>"
					for(let i = 0 ; i<data.length ; i++){
					str += "<tr class = '' id='"+data[i].ct_code+"'>";					
						str += "<td>" + data[i].ct_name +"</td>";
						str += "<td>" + data[i].ct_code +"</td>";
						str += "<td>" + data[i].ct_addr + "</td>";
						str += "<td>" + data[i].ct_ceo + "</td>";
						str += "<td>" + data[i].ct_kind + "</td>";
						str += "<td>" + data[i].ct_kind2 + "</td>";
						str += "<td>" + data[i].ct_phonenum + "</td>";
						str += "<td>" + data[i].ct_comnum + "</td>";
						str += "<td><button class='infobtn' onclick='insertCompany(\""+data[i].ct_code+"\")'>등록</button><br/>";					
						str += "<button class='infobtn' onclick='deleteCompany(\""+data[i].ct_code+"\")'>거부</button></td>";	
					}
					str += "</tr>";
				}
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	});

	function insertCompany(ct_code){
		if(confirm("정말 등록 하시겠습니까?")){
			$.ajax({
				url:"/erp/rest/admin/insertcompanytemp",
				method:"post",
				data:{ct_code: ct_code},
				dataType:"json",
				success : function(data){
					if(data==1){
						alert("등록 되었습니다.");			
					}else{
						alert("알수없는 이유로 취소되었습니다.");
					}
					location.reload();
				}, error : function(err){
					alert("알수없는 이유로 취소되었습니다.");
				}
			});
		}else{
			alert("취소되었습니다.");
		}
	}
	function deleteCompany(ct_code){
		if(confirm("정말 거부 하시겠습니까?")){
			$.ajax({
				url:"/erp/rest/admin/deletecompanytemp",
				method:"post",
				data:{ct_code: ct_code},
				dataType:"json",
				success : function(data){
					if(data==1){
						alert("거부 되었습니다.");			
					}else{
						alert("알수없는 이유로 취소되었습니다.");
					}
					location.reload();
				}, error : function(err){
					alert("알수없는 이유로 취소되었습니다.");
				}
			});
		}else{
			alert("취소되었습니다.");
		}
	}
	</script>
</body>
</html>