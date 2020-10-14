<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<!-- <link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
		<link href="img/favicon.png" rel="icon" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="lib/icomoon/icomoon.css" rel="stylesheet" />
  <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1a9e4h5a1u&callback=initMap"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous" />
	[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif] -->
	<style>

.carousel-caption{
font-size: 30px;
}
</style>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/erp/">N7 COMPANY</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      
      <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="/erp/">Home</a></li>
        <li class="homepageAdmin"></li>
        <li class="dropdown">
          <a href="/erp/introducecompany" class="dropdown-toggle">회사소개</a>
 
        </li>
            <li><a href="/erp/home/erpboard">상담게시판</a></li>
        <li><a href="/erp/erpapply">ERP신청</a></li>
        <li class="erpManager"></li>

          <c:choose>
				<c:when test="${id==null}">
				<li><a href="/erp/login">LOGIN</a></li>
			<!-- 	<li><a href="/erp/join" accesskey="6" title="">JOIN</a></li> -->
				</c:when>
				<c:when test="${id!=null and id eq 'manager'}">
				<li class="current_page_item">
				<!-- <a href="#" onClick='window.open("/erp/managermode/managermode", "ERP START", "width=1200, height=900, toolbar=no, menubar=no, resizable=yes"); return false;'>ERP관리하기</a></li> -->
				<li><form action="logout" method="post"><button>LOGOUT</button></li>
				</c:when>
				<c:when test="${id!=null and id ne 'manager'}">
				<li class="current_page_item"><a href="#" onClick='window.open("/erp/main", "ERP START", "width=1700, height=955, status=no, toolbar=no, menubar=no, scrollbar = no, resizable=no"); return false;'>ERP시작</a></li>
				<li><a href="/erp/logout">LOGOUT</a></li>
				</c:when>
				</c:choose> 
         </ul>
    </div><!-- /.navbar-collapse -->
      </div><!-- /.container-collapse -->
  </nav>
  
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">

        <div class="item active">
          <img src="img/mainerp5.jpg" alt="Chania" width="100%" height="50%" style="margin-left: 0%"></img>
          <!-- <div class="carousel-caption">
            <h2>기술</h2>
            <p>혁신적인 기술로 시장을 선도하는 기업</p>
          </div> -->
        </div>

        <div class="item">
          <img src="img/mainerp6.jpg" alt="Chania" width="100%" height="50%" style="margin-left: 0%"></img>
          <!-- <div class="carousel-caption">
            <h2>가동성</h2>
            <p>ERP로 최고의 효율 창조하는 기업</p>
          </div> -->
        </div>
        <div class="item">
          <img src="img/mainerp7.jpg" alt="Chania" width="100%" height="50%" style="margin-left: 0%"></img>
         <!--  <div class="carousel-caption">
            <h2>커뮤니티</h2>
            <p>항상 고객을 최우선으로 생각하는 기업</p>
          </div> -->
        </div>
        <div class="item">
          <img src="img/mainerp8.jpg" alt="Chania" width="100%" height="50%" style="margin-left: 0%"></img>
          <!-- <div class="carousel-caption">
            <h2>플랫폼</h2>
            <p>개인기업부터 대기업까지 사용할 수있는 맞춤형 ERP </p>
          </div> -->
        </div>

      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
	<%-- <div id="header" class="container">
		<div id="logo">
			<h1>
				<a href="/erp/">N7 ERP SYSTEM</a>
			</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="/erp/adminpage"  title="">ADMIN관리</a></li>
				<li><a href="/erp/introducecompany" accesskey="2" title="">회사
						소개</a></li>
				<li><a href="/erp/erpboard" accesskey="3" title="">신청 게시판</a></li>
				<li><a href="/erp/erpapply" accesskey="4" title="">ERP 신청</a></li>
				<c:choose>
				<c:when test="${id==null}">
				<li><a href="/erp/login" accesskey="5" title="">LOGIN</a></li>
				<li><a href="/erp/join" accesskey="6" title="">JOIN</a></li>
				</c:when>
				<c:when test="${id!=null and id eq 'manager'}">
				<li><form action="logout" method="post"><button>LOGOUT</button></form></li>
				<li class="current_page_item"><a href="#" onClick='window.open("/erp/managermode/managermode", "ERP START", "width=1200, height=900, toolbar=no, menubar=no, resizable=yes"); return false;'>ERP관리하기</a></li>
				</c:when>
				<c:when test="${id!=null and id ne 'manager'}">
				<li><form action="logout" method="post"><button>LOGOUT</button></form></li>
				<li class="current_page_item"><a href="#" onClick='window.open("/erp/main", "ERP START", "width=1200, height=900, toolbar=no, menubar=no, resizable=yes"); return false;'>ERP시작</a></li>
				</c:when>
				</c:choose>
				
			</ul>
		</div>
	</div>
	<div id="description">
		<center>
		<div class="icons" id="personManagement">
			<i class='fas fa-id-card' style='font-size: 36px; color: white;'></i>
		</div>
		<div class="icons" id="salesManagement">
			<i class='far fa-handshake' style='font-size: 36px; color: white;'></i>
		</div>
		<div class="icons" id="purchaseManagement">
			<i class='fas fa-shopping-cart'
				style='font-size: 36px; color: white;'></i>
		</div>
		<div class="icons" id="stockManagement">
			<i class='fas fa-archive' style='font-size: 36px; color: white;'></i>
		</div>
		<div class="icons" id="accountingManagement">
			<i class='fas fa-dollar-sign' style='font-size: 36px; color: white;'></i>
		</div>
		</center>
	</div>
	<div id="desc"></div> --%>
	<script>

	  $(function(){
		  console.log("${msg}");
	      var responseMessage = "<c:out value="${msg}" />";
	      if (responseMessage != ""){
         	 alert("퇴사 상태의 계정은 이용하실 수 없습니다.");
 	     }
	  });
	  
	$(document).ready(function(){
		if('${id}'!=""){
			$.ajax({
				url:"/erp/rest/home/checkgrade",
				dataType:"json",
				method:"post",
				success : function(grade){
					if(grade==2){
						$(".homepageAdmin").html('<a href="/erp/adminpage">admin관리</a>');
					}else if(grade==1){
						$(".erpManager").html('<a href="#" onClick=\'window.open("/erp/managermode/managermode", "ERP START", "width=1200, height=900, toolbar=no, menubar=no, resizable=yes"); return false;\'>ERP관리하기</a></li>');
					}
				}, error : function(err){
					console.log(err);
				}
			});
		}
	});
		$(".icons")
				.hover(
						function() {
							var template = $(this).attr("id");
							$(this).siblings().attr("style", "display:none");
							$(this).children().attr("style",
									"color:black;font-size:36px;");
							if (template == "personManagement") {
								$("#desc")
										.html(
												'<h1>인사 관리</h1><br><br>다양한 인사정보의 효율적 검색 기능 제공<br>다양한 급여처리 방식으로 고객사에 최적화된 급여처리 방법 제공<br>입사 후 인적 정보의 효율적 관리<br>다양한 보직변경 항목 제공<br>자유로운 급여기준 설정을 통해 급여처리의 편리성 추구<br>사원/조직별 정보를 그래프 형식으로 병렬 제공하여 다양한 현황 분석 용이')
							} else if (template == "salesManagement") {
								$("#desc")
										.html(
												'<h1>영업 관리</h1><br><br>영업 실적 관리의 편안함과 정확성<br>미수금 잔액을 한 눈에 파악<br>웹 기반 시스템의 편리성<br>각 영업 사원에게 고유 ID 제공하여 권한 제어')
							} else if (template == "purchaseManagement") {
								$("#desc")
										.html(
												'<h1>구매 관리</h1><br><br>구매 내역 자동 재고 반영<br>실시간 재고 확인<br>발주 수량 자동 계산하여 적정재고량 유지에 도움<br>실제 재고와 장부상 재고 비교하여 정확도 UP')
							} else if (template == "stockManagement") {
								$("#desc")
										.html(
												'<h1>재고 관리</h1><br><br>다양한 보고서 제공<br>재고 장부 자동화<br>재고 수량 관리의 정확성<br>월수불실적 제공을 통한 편리함<br>적정 수량 유지를 통한 안정성<br>')
							} else if (template == "accountingManagement") {
								$("#desc")
										.html(
												'<h1>회계 관리</h1><br><br>경영자를 위한 보고서 제공<br>실시간 보고서 확인 가능(인터넷 연결 필수)<br>경영자 보고서 자동화를 통한 편안함<br>영업, 구매 내역을 그대로 처리하여 정확도 UP<br>예산 관리의 편안함')
							}

						},
						function() {
							$("#desc").html('');
							$(this).siblings().attr("style",
									"display:inline-block");
							$(this).children().attr("style",
									"color:white;font-size:36px;");

						});
	</script>
</body>

</html>
