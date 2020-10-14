<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>N7 ERP - 품목코드 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
	media="all" />
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
	height: 600px;
	width: 500px;
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
.span{
float: left;
width: 176px;
text-align: center;
}
</style>
</head>
<body>
	<div class="first_div_css" style="width:500px;">
		<h1 class="deptregist_color_size" id="title">품목코드 추가</h1>
	</div>
	<div id="description" align="center">
		<div style="background-color:#F8F7F7;">
		<form id="frm">
		<table style="border: 1px; ">
			<tr>
				<td style="border: 0px;">분류명</td>
				<td style="border: 0px;" id="getCategory"></td>
				<td style="border: 0px;">품목코드</td>
				<td style="border: 0px;"><input id="it_code" name="it_code" type="text"
					maxlength="4" required="required"></td>
			</tr>
			<tr>
				<td style="border: 0px;">상품명</td>
				<td style="border: 0px;"><input id="it_pname" name="it_pname" type="text"
					required="required"></td>
				<td style="border: 0px;">규격명</td>
				<td style="border: 0px;"><input id="it_size" name="it_size" type="text"
					required="required"></td>
			</tr>
			<tr>
				<td style="border: 0px;">단위</td>
				<td style="border: 0px;"><input id="it_unit" name="it_unit" type="text"
					maxlength="6" required="required"></td>
				<td colspan="2" style="border: 0px;" align="right" style="padding-right:10%;"><input type="button"
						id="btn" value="확정"></td> <!--itemcode cofirm btn #btn -->
			</tr>
			</table>
		</form>
		<span id='msg'></span>
		<div class="first_div_css" style="width:500px;"><h3 class="deptregist_color_size" id="title">품목코드 내역</h3></div>
		<input type="button" style="display:none" id="modify" value="수정"><!--itemcode modify btn #modify -->
	<div id="smalldescription">
	</div></div>
			</div>

<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	//품목분류 출력
	itemCode('/erp/stock/getitemcode');
	getCategory();
	$('#btn').click(function(){
		var str = " ";
		var flag = true;
		//''검사
		if($('#it_ccode').val()==''||$('#it_code').val()==''||$('#it_pname').val()==''||$('#it_size').val()==''||$('it_unit').val()==''){
			$('#msg').html('값을 입력해주세요!');
			return;
		}
		//중복 검사
		for(var i = 0 ; i < $('.it_code').length;i++){
			if($('#it_ccode').val()+"-"+$('#it_code').val()==$('.it_code')[i].value){
				$('#msg').html('품목코드는 중복될 수 없습니다. 확인하고 다시 시도 해 주세요!');
				return;
			}else{
				$('#msg').html('');
			}
		}
		var data = $('#frm').serialize();
		console.log(data);
		itemCode('/erp/stock/itemcodeconfirm',data);
		$('input[type="text"]').val("");
		$('input[type="number"]').val("");
		$('select').children()[0].selected = true;
	});

	function  itemCode(url,data) {
		if(url=="/erp/stock/getitemcode"){
			$.ajax({
				url:url,
				data:data,
				type:"get",
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				dataType:"json",
				success:function(result){
					if(result.length!=0){
						$("#modify").attr("style","display:inline-block")
					}
					var msg = '';
					msg+='<div class = "span">품목코드</div><div class = "span">상품명</div><div class = "span">규격명</div><div class = "span">단위</div><br>';
					for(var i = 0 ; i < result.length;i++){
						var frm = document.createElement("form");
						frm.id = 'frm'+(i+1);
						var str = '';
						str += '<input class="it_code"  name="it_code" type="text" value="'
							+ result[i].it_code
							+ '" readonly>'
							+'<input class="it_pname"   name="it_pname" type="text" value="'+result[i].it_pname+'" readonly>'
							+'<input type="button" id="btn'+i+'" onclick="modifyItemCode(\''+(i+1)+'\')" value="확정"/>'
							+'<input class="it_size"  name="it_size" type="text" value="'+result[i].it_size+'" readonly>'
							+'<input class="it_unit" name="it_unit" type="text" value="'+result[i].it_unit+'" readonly>'
							+'<input type="button" id="del'+i+'"onclick="deleteItemCode(\''+(i+1)+'\')" value="삭제"/>';
							console.dir(frm);
							frm.innerHTML = str
							msg+=frm.outerHTML+'<br>';
					}
					$('#smalldescription').html(msg);
				},
				error:function(err){
					console.log(err);
				}
			});
		}else{
		$.ajax({
			url:url,
			data:data,
			type:"post",
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			dataType:"json",
			success:function(result){
				if(result.length!=0){
					$("#modify").attr("style","display:inline-block")
				}
				var msg = '';
				msg+='<div class = "span">품목코드</div><div class = "span">상품명</div><div class = "span">규격명</div><div class = "span">단위</div><br>';
				for(var i = 0 ; i < result.length;i++){
					var frm = document.createElement("form");
					frm.id = 'frm'+(i+1);
					var str = '';
					str += '<input class="it_code"  name="it_code" type="text" value="'
						+ result[i].it_code
						+ '" readonly>'
						+'<input class="it_pname"   name="it_pname" type="text" value="'+result[i].it_pname+'" readonly>'
						+'<input type="button" id="btn'+i+'" onclick="modifyItemCode(\''+(i+1)+'\')" value="확정"/><br>'
						+'<input class="it_size"  name="it_size" type="text" value="'+result[i].it_size+'" readonly>'
						+'<input class="it_unit" name="it_unit" type="text" value="'+result[i].it_unit+'" readonly>'
						+'<input type="button" id="del'+i+'"onclick="deleteItemCode(\''+(i+1)+'\')" value="삭제"/><br><hr size="5" width="100px;	">';
						console.dir(frm);
						frm.innerHTML = str
						msg+=frm.outerHTML+'<br>';
				}
				$('#smalldescription').html(msg);
			},
			error:function(err){
				console.log(err);
			}
		});
		}

	}
	//분류명, 품목번호 출력
	function getCategory(){
		$.ajax({
			url:'/erp/stock/getcategory',
			type:"POST",
			dataType:"json",
			success:function(result){
				var str = '<select name="it_ccode" id="it_ccode"><option></option>'
				for(var i = 0;i<result.length;i++){
					str+="<option value='"+result[i].ct_code+"'>"+result[i].ct_name+"</option>";
				}
				str+="</select>";
				$('#getCategory').html(str);
			},
			error:function(err){

			}
		});
	}
	//품목번호 수정
	function modifyItemCode(i){
		console.log('#frm'+i)
		var data = $('#frm'+i).serialize();
		console.log(data);
		itemCode('/erp/stock/modifyitemcode',data);
	}
	//품목번호 삭제
	function deleteItemCode(i) {
		var data = $('#frm'+i).serialize();
		itemCode('/erp/stock/deleteitemcode',data);
	}
	//readonly 해제
	$('#modify').click(function () {
		$('input[class]').attr("readonly",false);
		$('input[class="it_code"]').attr("readonly",true);
	});

	</script>
</body>
</html>
