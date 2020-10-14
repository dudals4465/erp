<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>N7 ERP - 분류명 등록</title>
<link href="/erp/img/favicon.png" rel="icon" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css">
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
	width:500px;
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
button{
width: 100px;
height: 30px;
background-color: #FFB2D9;
border:0px;
border-radius: 8px;
font-weight: bolder;
font-size: 14px;
color: white;
}
span{

text-align: center;
color: red;
}
body{
font-size: 20px;
font-weight: bolder;
}
</style>
</head>
<body>
	<div id="description">
	<div class="first_div_css" style="color:white;">분류코드 추가</div>
	<div style="background-color:#F8F7F7;">
		<table style="border: 0px;">
			<tr>
				<td style="border: 0px;">분류명</td>
				<td style="border: 0px;"><input id="ct_name" type="text"
					maxlength="50" required="required"></td>
			</tr>
			<tr>
				<td style="border: 0px;">품목번호</td>
				<td style="border: 0px;"><input id="ct_code" type="text"
					maxlength="1" required="required"></td>
			<tr>
			<tr>
				<td colspan="2" style="border: 0px;"><input type="button"
						id="btn" value="확정"></td>
			</tr>
		</table>
</div>
		<span id='msg'></span><br><br>
		<div class="first_div_css" style="color:white;">분류코드 내역</div>
		<div style="background-color:#F8F7F7;">
		<input type="button"  id="modify" value="수정">
		<table id="tb"></table>
</div>
	</div>

<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	//카테고리 출력	
	category('/erp/stock/getcategory');
	//카테고리 추가	
	$('#btn').click(function() {
							if ($('#ct_name').val() == ''
									|| $('#ct_code').val() == '') {
								$('#msg').html('값을 입력해주세요!');
								return;
							}
							for (var i = 0; i < $(".ct_name").length; i++) {
								if ($('#ct_name').val() == $('.ct_name')[i].childNodes[0].value
										|| $('#ct_code').val() == $('.ct_code')[i].childNodes[0].value) {
									$('#msg')
											.html(
													'분류명과 코드는 중복될 수 없습니다. 확인하고 다시 시도해주시길 바랍니다.');
									return;
								}else{
									$('#msg').html('');
								}
							}
							category('/erp/stock/categoryconfirm', {
								ct_name : $('#ct_name').val(),
								ct_code : $('#ct_code').val()
							});
						})
		function category(url, data) {
			$.ajax({
						url : url,
						data : data,
						dataType : 'json',
						type : 'post',
						success : function(result) {
							console.log(result);
							var str = '<tr><td>분류명</td><td>품목 번호</td></tr>';
							for (var i = 0; i < result.length; i++) {
								str += '<tr><td class="ct_name"><input type="text" value="'
										+ result[i].ct_name
										+ '" readonly></td><td class="ct_code"><input type="text" value="'
										+ result[i].ct_code
										+ '" readonly></td><td><input type="button" id="btn'+i+'" onclick="modifyCategory(\'#btn'+i+'\')" value="확정"></td>'
										+ '<td><input type="button" id="del'+i+'"onclick="deleteCategory(\'#del'+i+'\')" value="삭제"></td>'
										+ '</tr>';
							}
							$('#tb').html(str);
							$('#ct_name').val("");
							$('#ct_code').val("");
						},
						error : function(err) {
							$('#msg')
							.html(
									'분류명 삭제에 실패하였습니다. 현재 분류명을 사용하는 재고가 있습니다.');
						}
					})
		}; 
		//카테고리 수정
		function modifyCategory(id) {
			var ct_name = $(id).parent().siblings('.ct_name').children()[0].value;
			var ct_code =$(id).parent().siblings('.ct_code').children()[0].value;
			if(ct_name==''||ct_code==''){
				$('#msg').html('값을 입력해주세요!');
				return;
			}
			for(var i = 0 ; i < $('.ct_name').length;i++){
				if(id.substr(4, 5)==i){
					continue;
				}
				if(ct_name==$('.ct_name')[i].childNodes[0].value){
					$('#msg')
					.html(
							'분류명은 중복될 수 없습니다. 확인하고 다시 시도해주시길 바랍니다.');
					return;
				}else{
					$('#msg').html("");
				}
			}
			var data = {"ct_name":ct_name,"ct_code":ct_code}
			category('/erp/stock/modifycategory',data);
		}
		$('#modify').click(function () {
			$('.ct_name').children().attr('readonly',false)
		});
		//카테고리 삭제
		function deleteCategory(id) {
			var ct_code =$(id).parent().siblings('.ct_code').children()[0].value;
			var data = {"ct_code":ct_code}
			category('/erp/stock/deletecategory',data);
		}
	</script>
</body>
</html>