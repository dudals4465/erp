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
<link href="/erp/img/favicon.png" rel="icon" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
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
	<div id="paging"></div>
	
	</div>
	</div>
	
	
	<script> 
	//페이지 변경 스크립트
	
	var currPage = 1;
	function pageNumber(j){
		currPage = j;
		$.ajax({
			url:"/erp/rest/admin/companypagenumber",
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
						str += " &nbsp; <a href=javascript:paging("+i+")>["+ i +"]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}
	function paging(num){
		pageNumber(num);
		companylist(num);
	}
	
	function companylist(nowPage){
		$.ajax({
			url:"/erp/rest/admin/companylist",
			dataType:"json",
			data:{nowPage : nowPage, cntPerPage : "10"},
			method:"get",
			success : function(data){
				console.log(data);
				let str = "";
			 	str = "<table>"
				str += "<tr class='infomenu admin' style='heigth:90px; font-size:15px; text-align : center;'><td style='width:250px;'>회사이름</td>";
				str += "<td style='width:250px;'>회사코드</td><td style='width:500px;'>주소</td><td style='width:250px;'>대표자</td>";
				str += "<td style='width:200px;'>업태</td><td style='width:200px;'>분류</td>";
				str += "<td style='width:300px;'>전화번호</td><td style='width:300px;'>사업자번호</td><td style='width:75px;'>수정</td><tr>"
				for(let i = 0 ; i<data.length ; i++){
					str += "<tr class = '' id='"+data[i].c_code+"'>";					
					str += "<td>" + data[i].c_name +"</td>";
					str += "<td>" + data[i].c_code +"</td>";
					str += "<td>" + data[i].c_addr + "</td>";
					str += "<td>" + data[i].c_ceo + "</td>";
					str += "<td>" + data[i].c_kind + "</td>";
					str += "<td>" + data[i].c_kind2 + "</td>";
					str += "<td>" + data[i].c_phonenum + "</td>";
					str += "<td>" + data[i].c_comnum + "</td>";
					str += "<td><button class='infobtn' onclick='deleteCompany(\""+data[i].c_code+"\")'>제거</button><br/>";					
					str += "</tr>"
				}
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}	
		});
	}
	
	companylist(1);
	pageNumber(1);
	
	</script>
	<script>
		function deleteCompany(cCode){
			console.log(cCode);
			alert("회사의 모든 정보가 삭제되었습니다.");
			$.ajax({
				url:"/erp/rest/home/deletecompany",
				data:{cCode:cCode},
				dataType:"json",
				type:"post",
				success:function(result){
					console.log(result)
				},
				error:function(err){
					console.log(err);
				}
			})
		}
		function updateFunction(cCode){
			alert("managermode 연동 시켜야해" + cCode);
		}
	
	</script>
</body>
</html>