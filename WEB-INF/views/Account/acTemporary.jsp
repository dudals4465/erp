<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<style>
a{
color:#222222;
font-weight: bold;
}

table, tr, td {
	border: 1px solid black;
	text-align: center;
}

td {
	padding: 5px;
	font-size: medium;
/* 	width: 58px; */
	height: 10px;
}

#table {
	width: 1150px;
	height: auto;
}

#m {
	background-color: gray;
}

#center{
text-align: center;
}
</style>
</head>
<body>
	 <div
         style="width: 1150px; background-color: #3D6B9B; color: white; padding: 1%; text-align: center; font-size: larger; font-weight: bold;">임시저장 결재함</div>
	<table id="table" class="table table-hover">
		<tr id="m">
			<td>check</td>
			<td>문서번호</td>
			<td>문서제목</td>
			<td>계정과목</td>
			<td>비용구분</td>
			<td>차변금액</td>
			<td>대변금액</td>
			<td>귀속부서</td>
			<td>활동센터</td>
			<td>관계회사</td>
			<td>결재상태</td>
		</tr>
		<tbody id="Info"></tbody>
	</table>
	<br>
	<div id="paging" style="text-align: center;"></div>
	<br>
	<div id="center">
	<button id="approval">결재안 상세보기</button>
	<button id="acDelete2">삭제</button>
	</div>
</body>
<script>
	//페이지 변경 스크립트
	var currPage = 1;
	function pageNumber(j) {
		currPage = j;
		$.ajax({
			url : "/erp/rest/Account/documentPagenumber2",
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
		acTemporaryList(num);
	}

	function acTemporaryList(nowPage) {
		$
				.ajax({
					url : "/erp/rest/Account/acTemporaryList",
					dataType : "json",
					data : {
						nowPage : nowPage,
						cntPerPage : "10"
					},
					method : "get",
					success : function(data) {
						let str = "";
						for (let i = 0; i < data.length; i++) {
							str += "<table>"
							str += "<tr>"
							str += "<td><input type='radio' name='checknum' class='check' value='"+data[i].j_docunum+"'></td>";
							str += "<td>" + data[i].j_docunum + "</td>";
							str += "<td>" + data[i].j_title + "</td>";
							str += "<td>" + data[i].j_account + "</td>";
							str += "<td>" + data[i].j_group + "</td>";
							str += "<td>" + data[i].j_debit + "</td>";
							str += "<td>" + data[i].j_credit + "</td>";
							str += "<td>" + data[i].j_section + "</td>";
							str += "<td>" + data[i].j_centre + "</td>";
							str += "<td>" + data[i].j_company + "</td>";
							str += "<td>" + '임시저장' + "</td>";
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

	acTemporaryList(1);
	pageNumber(1);
</script>
<script>
	$("#approval").click(
			function() {
				var check = '';
				$("input[name='checknum']:checked").each(
						function() {
							check = $(this).attr('value');

							window.open(
									'/erp/rest/Account/acRequest?j_docunum='
											+ check, 'acRequest',
							 'width=1500, height=650');
						});
			});
	
	$("#acDelete2").click(function() {

		var check = '';
		$("input[name='checknum']:checked").each(function() {
			check = $(this).attr('value');

			$.ajax({
				url : '/erp/rest/Account/acDelete?j_docunum=' + check,
				type : 'post',
				success : function(data) {
					if(data == 1){
					alert("결재안 삭제가 완료되었습니다.");
					window.location.reload();
					console.log(data);
					}else{
						alert("결재안 삭제를 실패했습니다.");
// 						window.location.reload();
						console.log(data);
					}
				},
				error : function(error) {
					alert("결재안 삭제를 실패했습니다.")
					console.log(error);
				}
			});
		});

	});
</script>
</html>





