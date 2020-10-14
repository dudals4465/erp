<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- BOOTSTRAP STYLES-->
<link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
<link href="/erp/img/favicon.png" rel="icon" />
<meta charset="UTF-8">
<title>부서관리</title>
<style>
.checks {
	position: relative;
}

.checks input[type="radio"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.checks input[type="radio"]+label {
	display: inline-block;
	position: relative;
	padding-left: 30px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
}

.checks input[type="radio"]+label:before {
	content: '';
	position: absolute;
	left: 0;
	top: -4px;
	width: 21px;
	height: 21px;
	text-align: center;
	background: #fafafa;
	border: 1px solid #cacece;
	border-radius: 100%;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.05), inset 0px -15px 10px -12px
		rgba(0, 0, 0, 0.05);
}

.checks input[type="radio"]+label:active:before, .checks input[type="radio"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.checks input[type="radio"]:checked+label:before {
	background: #E9ECEE;
	border-color: #adb8c0;
}

.checks input[type="radio"]:checked+label:after {
	content: '';
	position: absolute;
	top: 1px;
	left: 5px;
	width: 13px;
	height: 13px;
	background: #99a1a7;
	border-radius: 100%;
	box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.3);
}

.department-div {
	border: 3px double #e1e1e1;
	border-radius: 8px;
	height: 350px;
	width: 80%;
	margin-left: 100px;
	text-align: center;
}

table {
	margin-top: 100px;
	margin-left: 30px;
	width: 700px;
	border: 3px double #e1e1e1;
	border-collapse: collapse;
	border-radius: 8px;
	text-align: center;
}

th, td {
	border: 3px double #e1e1e1;
	padding: 10px;
	border-radius: 8px;
}

ul {
	list-style: none;
}

#tr {
	background-color: gray;
	border-color: gray;
}

#table {
	margin: 10px 10px 0px 0px; 
	width: 100%;
/* 	width: 800px; */
}

#deleteBt {
	float: right;
}

/* button { */
/* 	margin: 2px 2px 2px 2px; */
/* } */

#au {
	height: 20px;
	width: auto;
	background-color: white;
	color: #3D6B9B;
}
.alert alert-info{
	margin: 20px;
}
#save{
margin-bottom: 10%;
}
</style>
</head>
<body>

	<div id="page-inner">
		<div class="row">
			<div class="col-lg-12">
				<h2>부서관리</h2>
				<div>
				<label id="au"><input type="radio" class="active" id="insert"
				value="option" name="option">부서권한등록</label>
				<label id="au"><input type="radio" class="active" id="delete"
					value="option" name="option">부서권한삭제</label>
				</div>
			</div>
		</div>
		<hr>
<!-- 		<div id="au"> -->
<!-- 				<label id="au"><input type="radio" class="active" id="insert" -->
<!-- 				value="option" name="option">부서권한등록</label> -->
<!-- 		</div> -->
		<div>
			<div id="insertBox">
				<div class="row">
					<div class="col-lg-12" style="padding:15px;">
						<div class="alert alert-info">
							<strong>ERP 부서 등록 페이지입니다.</strong>
							<button class="btn btn-success" id="save">저장</button>
						</div>
					</div>
				</div>
				<div class="row text-center pad-top">
					<form id="departmentinfo">
						<div class="department-div">
							<table style='border-radius: 8px;'>
								<tbody style='border-radius: 8px;'>
									<tr style='border-radius: 8px;'>
										<th colspan='4'><div class='input-group'>
												<span class='input-group-addon'>회사코드</span> <input
													type='text' id="au_comname" name="au_comname"
													class='form-control' value="${cCode}" readonly
													style='width: 120%;'>
											</div></th>
									</tr>
									<tr style='border-radius: 8px;'>
										<th colspan='4'><div class='input-group'>
												<span class='input-group-addon'>&nbsp;부서명&nbsp;&nbsp;</span>
												<input type='text' id="au_name" name="au_name"
													class='form-control' style='width: 120%;'
													oninput="checkau_name()">
											</div> <span id="ncheck" style="text-align: center;"></span></th>
										<th style="border-color: white;">
<!-- 											<button onclick="namecheck()" type="button">중복확인</button> -->
										</th>

									</tr>
									<tr style='border-radius: 8px;'>
										<th colspan='4'><div class='input-group'>
												<span class='input-group-addon'>&nbsp;&nbsp;&nbsp;권한&nbsp;&nbsp;&nbsp;</span>
												<div type='text' class='form-control'
													style='width: 120%; text-align: center;'>
													&nbsp;<label><input type="radio" id="au_authority"
														name="au_authority" value="1">승인</label> &nbsp; <label><input
														type="radio" id="au_authority" name="au_authority"
														value="0">거부</label> &nbsp;
												</div>
											</div></th>
									</tr>
								</tbody>
							</table>
							<div></div>
						</div>
					</form>

				</div>
			</div>
		</div>
		<div>
<!-- 			<div id="au"> -->
<!-- 				<label><input type="radio" class="active" id="delete" -->
<!-- 					value="option" name="option">부서권한삭제</label> -->
<!-- 			</div> -->
			<div id="deleteBox">
				<div class="row">
					<div class="col-lg-12 ">
						<div class="alert alert-info">
							<strong>ERP 부서 권한 삭제 페이지입니다.</strong>
							<button class="btn btn-danger" id="deleteBt">삭제</button>
						</div>
					</div>
				</div>
				<table id="table">
					<tbody>
						<tr id="tr" style="width: auto;">
							<td>check</td>
							<td>부서명</td>
							<td>권한</td>
						</tr>
					</tbody>
					<tbody id="auList"></tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<br>
					<div class="alert alert-danger">
						<strong>문제가 있으신가요?</strong> 오류 및 문제점 문의는 <a target="_blank"
							href="http://localhost/erp/access">여기를 클릭하세요</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#insert").click();
	$("#deleteBox").hide();

	$("#delete").click(function() {
		$("#insertBox").hide();
		$("#deleteBox").show();

	});
	$("#insert").click(function() {
		$("#deleteBox").hide();
		$("#insertBox").show();

	});

	$("#save")
			.click(
					function() {

						var au_name = document.getElementById("au_name").value;
						var au_authority = document.getElementById("au_authority").value;
						var namecheck = document.getElementById("namecheck").value;
						
						if (au_name == '' || au_name == null
								&& au_authority == "" || au_authority == null) {
							alert("모두 입력해주세요.");
						} else if (au_name == '' || au_name == null) {
							alert("부서명을 입력해주세요.");
						} else if (au_authority == "" || au_authority == null) {
							alert("권한을 선택해주세요.");
						} else if (namecheck != 1) {
							alert("부서 이름을 확인해주세요.");

						} else {

							var obj = $("#departmentinfo").serialize();

							$.ajax({
								url : '/erp/rest/managermode/depratmentSave',
								type : 'post',
								data : obj,
								success : function(data) {
									if (data == 1) {
										alert("저장 완료");
										$("#departmentinfo")[0].reset();
										window.location.reload();
									} else {
										alert("저장안됐어");
									}
								},
								error : function(error) {
									console.log(error);
								}

							});

						}

					});

	$("#deleteBt")
			.click(
					function() {
						var check = '';
						$("input[name='checknum']:checked")
								.each(
										function() {
											check = $(this).attr('value');

											$
													.ajax({
														url : '/erp/rest/managermode/depratmentDelete?au_name='
																+ check,
														type : 'post',
														success : function(data) {
															if (data == 1) {
																alert("삭제가 완료되었습니다.");
																window.location
																		.reload();
																console
																		.log(data);
															} else {
																alert("삭제를 실패하였습니다.");
																console
																		.log(data);
															}
														},
														error : function(error) {
															console.log(error);
														}

													});
										});
					});

	$(document)
			.ready(
					function authoritList() {
						$
								.ajax({
									url : "/erp/rest/managermode/authoritList",
									dataType : "json",
									method : "get",
									success : function(data) {
										let str = "";
										for ( let i in data.pList) {
											str += "<table id='table'>"
											str += "<tr>"
											str += "<td><input type='radio' name='checknum' class='check' value='"+data.pList[i].au_name+"'></td>";
											str += "<td>"
													+ data.pList[i].au_name
													+ "</td>";
											str += "<td>"
													+ data.pList[i].au_authority
													+ "</td>";
											str += "</tr>";
										}
										str += "</table>";
										$("#auList").html(str);
									},
									error : function(err) {
										console.log(err);
									}
								});

					});

	function checkau_name() {
		var au_name = $("#au_name").val();
		if (au_name == null || au_name == '') {
			$("#ncheck").html("<font style='color:red;'>부서이름을 입력해 주세요.</font>");
		} else {
			$
					.ajax({
						url : "/erp/rest/managermode/namecheck",
						data : {
							au_name : au_name
						},
						dataType : "text",
						method : "get",
						// 										async : false,
						success : function(data) {
							console.log(data)
							if (data == 1) {
								checkccode = false;
								$("#ncheck")
										.html(
												"<font style='color:red;'>해당 부서가 이미 존재합니다.</font><input type='hidden' id='namecheck' value='0'>");
							} else {
								checkccode = true;
								$("#ncheck").html(
										"<font style='color:green;'>확인되었습니다.</font><input type='hidden' id='namecheck' value='1'>");
							}
						},
						error : function(err) {
							console.log(err);
						}
					});
		}
	}
</script>
</html>