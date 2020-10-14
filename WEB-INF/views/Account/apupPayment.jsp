<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- BOOTSTRAP STYLES-->
<link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->

<!-- FONTAWESOME STYLES-->
<link href="/erp/assets/css/font-awesome.css" rel="stylesheet">
<!-- CUSTOM STYLES-->
<link href="/erp/assets/css/custom.css" rel="stylesheet">
<!-- GOOGLE FONTS-->
<link href="http://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet" type="text/css">
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="/erp/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="/erp/assets/js/bootstrap.min.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/erp/assets/js/custom.js"></script>

<title>진행중 결재함</title>
<style>

table, tr, td {
	border: 1px solid black;
	text-align: center;
/* 	height: auto; */
}

a{
color:#222222;
font-weight: bold;
}

td {
	padding: 5px;
	font-size: medium; 
/* 	width: 58px; */
	height: 10px;
}

#t{
	width: 1150px;
	height: auto;
	text-align: center;
/* 	margin-left: 80px; */
}

#m {
	background-color: gray;
}

#center {
	text-align: center;
}

/* button{ */
/* padding: 10px; */
/* } */
ul {
   list-style: none;
}
</style>
</head>
<body>
	 <div
         style="width: 1150px; background-color: #3D6B9B; color: white; padding: 1%; font-size: larger; font-weight: bold; text-align: center;">진행중 결재함</div>
	<table id="t" class="table table-hover">
		<tr id="m">
			<td>check</td>
			<td id="ap_docunum">문서번호</td>
			<td id="ap_ccode">회사코드</td>
			<td id="ap_docuname">결재문서이름</td>
			<td id="ap_fromapprover">발신인</td>
			<td id="ap_toapprover ">수신인</td>
			<td id="ap_date">올린시간</td>
			<td id="ap_statu">결재상태</td>
		</tr>
		<tbody id="Info">
		</tbody>
	</table>
	<br>
	<div id="paging" style="text-align: center;"></div>
	<br>
	<div id="center">
		<button id="approval">결재안 상세보기</button>
	</div>
</body>
<script>
	//페이지 변경 스크립트
	var currPage = 1;
	function pageNumber(j) {
		currPage = j;
		$.ajax({
			url : "/erp/rest/Account/documentPagenumber",
			dataType : "json",
			method : "get",
			success : function(page) {
				console.log(page);
				var pagecnt = (page / 10) + 1;
				let str = "";
				for (let i = 1; i < pagecnt; i++) {
					if (i == currPage) {
						str += " &nbsp; [" + i + "] &nbsp; ";
					} else {
						str += " &nbsp; <a href=javascript:paging(" + i + ")>["
								+ i + "]</a> &nbsp; ";
					}
				}
				console.log(str);
				$("#paging").html(str);
			},
			error : function(err) {
				console.log(err);
			}
		});
	}

	function paging(num) {
		pageNumber(num);
		apupPaymentList(num);
	}

	function apupPaymentList(nowPage) {
		$
				.ajax({
					url : "/erp/rest/Account/apupPaymentList",
					dataType : "json",
					data : {
						nowPage : nowPage,
						cntPerPage : "10"
					},
					method : "get",
					success : function(data) {
						let str = "";
						for (let i = 0; i < data.pList.length; i++) {
							str += "<table>"
								str += "<tr>"
								str += "<td><input type='radio' name='checknum' class='check' value='"+data.pList[i].ap_docunum+"'></td>";
								str += "<td>" + data.pList[i].ap_docunum + "</td>";
								str += "<td>" + data.pList[i].ap_ccode + "</td>";
								str += "<td>" + data.pList[i].ap_docuname + "</td>";
								str += "<td>" + data.nList[i].ap_fromname + "</td>";
								str += "<td>" + data.nList[i].ap_toname + "</td>";
								str += "<td>" + data.pList[i].ap_date + "</td>";
								str += "<td>" + '결재중' + "</td>";
								str += "</tr>"
						}
						str += "</table>";
						$("#Info").html(str);
					},
					error : function(err) {
						console.log(err);
					}
				});
	}

	apupPaymentList(1);
	pageNumber(1);

</script>
<script>
$("#approval").click(
		function() {
			var check = '';
			$("input[name='checknum']:checked").each(
		               function() {
		                  check = $(this).attr('value');


		                  if(check.indexOf("AC") != -1){
		                     window.open(
		                        '/erp/rest/Account/apRequest?j_docunum='
		                              + check, 'apRequest',
		                        'width=1500, height=650');
		                  }else if(check.indexOf("AP") != -1){ //영민
		                	  console.log(check);
		                      window.open('/erp/rest/Account/apUpSalesnum?s_num=' + check, 'apUpSalesinfo', 'width=1400, height=400');
		                  }else if(check.indexOf("AS") != -1){ //영민
		                	  console.log(check);
		                      window.open('/erp/rest/Account/asUpSalesnum?s_num=' + check, 'asUpSalesinfo', 'width=1400, height=400');
		                  }else if(check.indexOf("P") != -1){ //예은
		                     window.open(
		                        '/erp/rest/Purchase/pRequest?p_documentcode='+ check, 'pRequest',
		                        'width=1500, height=600');
	                      }else if(check.indexOf("G") != -1){ //수진
	                         window.open(
	                           '/erp/rest/sales/sRequest?bs_docunum='+ check, 'sRequest',
	                           'width=1500, height=600');
		                  }else if(check.indexOf("H") != -1){ //인사
		                	  console.log(check);
		                      window.open('/erp/hr/holidaydetail?docunum=' + check, '휴가상세정보', 'width=750, height=600');
		                  }else{
		                	  window.open(
		                        '/erp/rest/myinfo/mydocument', 'mydocument', 'width=1500, height=600');
		                  }

		               });
		      });
</script>
</html>
