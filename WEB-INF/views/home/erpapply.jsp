<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/erp/img/favicon.png" rel="icon" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css"
	media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
<!-- 	crossorigin="anonymous" /> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
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

#description {
	position: relative;
}

body {
	font-size: medium;
	padding: 5px;
}
</style>
</head>

<body>
	<div id="header" class="container" style="text-align: center;">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 COMPANY</a>
			</h1>
		</div>
		<div id="menu"></div>
	</div>
	<div id="description" class="out" style="height: 700px;">
<!-- 		<div -->
<!-- 			style="width: 100%; background-color: #3D6B9B; color: white; padding: 1%; text-align: center; font-size: larger;">ERP신청</div> -->
				<div
					style='width: 100%; height: 60px; text-align: center; background-color: #3D6B9B;'>
					<h1 style='color: white; line-height: 1.7;'>ERP신청</h1>
	</div>
	<div class="center">
		<div id="container" class='input-group'>
			<form id="form" name="form" action="newerp" method="post" onsubmit="return sum();">
				<table class="table table-condensed">
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>&nbsp;회사명 &nbsp;</span> <input
									type="text" name="c_name" required="required"
									class='form-control' style='width: 140%;' />
							</div></th>
					</tr>
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>회사코드</span> <input type="text"
									name="c_code" required="required" id="cCode"
									class='form-control' style='width: 140%;'
									oninput="dupleCCode()" /> <span id="dupleCCode"></span>
							</div></th>
					</tr>
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>대표자명</span> <input type="text"
									name="c_ceo" required class='form-control' style='width: 140%;' />
							</div></th>
					</tr>
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>전화번호</span> <input type="text"
									name="c_phonenum" required="required" class='form-control'
									style='width: 140%;' />
							</div></th>
					</tr>
					<tr> 
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>&nbsp;&nbsp;&nbsp;&nbsp;업태&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<input type='text' name='c_kind' required="required"
									class='form-control' style='width: 140%;' />
							</div></th>
					</tr>
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>&nbsp;&nbsp;&nbsp;&nbsp;종류&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<input type='text' name='c_kind2' required="required"
									class='form-control' style='width: 140%;' />
							</div></th>
					</tr>
					<!--  <tr>
                        <td>구분</td>
                        <td><input type="radio" name="division" value="법인"> 법인 <input type="radio" name="division"
                                value="개인">개인</td>
                    </tr> -->
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>&nbsp;&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;&nbsp;&nbsp;</span>

								<div class="form-group">
								<div id="callBackDiv">
									<button onclick="goPopup()" type="button">주소검색</button>
									<input type="text" id="roadAddrPart1" name="roadAddrPart1"	class='form-control' style='width: 62%;' /> 
									<input	type="text" name="roadAddrPart2" id="roadAddrPart2"	class='form-control' style='width: 62%;' />
									<input id="addrDetail"type="text" name="addrDetail"class='form-control' style='width: 62%;' /> 
								</div>
								</div>
							</div></th>
					</tr>
					<tr>
						<th colspan='4'><div class='input-group'>
								<span class='input-group-addon'>사업자번호</span> <input type='text'
									name='c_comnum' required="required" class='form-control'
									style='width: 135%;' />
							</div></th>
					</tr>
					<!-- <tr>
                        <td>필요 기능</td>
                        <td><input type="checkbox" name="require"> 인사 관리
                            <input type="checkbox" name="require"> 영업 관리
                            <input type="checkbox" name="require"> 구매 관리
                            <input type="checkbox" name="require"> 자재 관리
                            <input type="checkbox" name="require"> 회계 관리
                        </td>
                    </tr> -->
                    <tr>
					<td><button style="margin-left: 230px;">신청</button></td>
					</tr>
					<input type="hidden" name="c_addr" id="addr"></input>
				</table>
			</form>
		</div>
	</div>
	</div>
	<script>
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		
}
	function goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="jusoPopup";
		
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/erp/home/jusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
		// 				var checkccode;

		// 				$(function() {
		// 					$("#postcodify_search_button").postcodifyPopUp();
		// 				});

		function dupleCCode() {
			var $cCode = $("#cCode").val();

			if ($cCode == "" || $cCode == null) {
				$("#dupleCCode").html(
						"<font style='color:red;'>회사코드를 입력해주세요.</font>");
			} else {

				console.log($cCode);
				$
						.ajax({
							url : "/erp/rest/home/dupleccode",
							data : {
								m_ccode : $cCode
							},
							dataType : "text",
							method : "get",
							async : false,
							success : function(data) {
								console.log(data)
								if (data == 1) {
									checkccode = false;
									$("#dupleCCode")
											.html(
													"<font style='color:red;'>해당 회사코드가 이미 존재합니다.</font>");
								} else {
									checkccode = true;
									$("#dupleCCode")
											.html(
													"<font style='color:green;'>확인</font>");
								}
							},
							error : function(err) {
								console.log(err);
							}
						});
			}
		}


		function sum() {
			if (checkccode) {
				$("#addr").val(
						$('#roadAddrPart1').val() + $('#roadAddrPart2').val()
								+ $('#addrDetail').val());
				console.log($("#addr").val());
				return true;
			} else {
				alert("회사코드 중복을 확인해주세요.");
				return false;
			}
		}
	</script>
</body>
</html>
