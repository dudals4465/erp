<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>사원 휴 -퇴직 관리</title>
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
	border-right: 1px solid #E6E6E6;
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
body{
	font-size:medium;
	color:black;
	font-weight: bold;
}
input,select{
	font-size: medium;
}
</style>
</head>
<body>
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
		<h1 class="deptregist_color_size">사원 휴 - 퇴직 관리</h1>
	</div>
	<div style="float: right;">
		<input type="text" id="nameSearch" placeholder="이름으로 입력" style="padding: 5px 10px;"> <button onclick="searchFromName()" class="infobtn" id="nameSearching">검색</button>
	</div>
	<div>
		<a href="javascript:CheckRetired(0)"><button class='infobtn'>재직중</button></a>
		<a href="javascript:CheckRetired(1)"><button class='infobtn'>휴직중</button></a>
		<a href="javascript:CheckRetired(2)"><button class='infobtn'>퇴사</button></a> <br>
		<div>
			<table style="width: 100%;border-collapse: collapse;text-align: center;border: #D9EDF7"border="1">
				<tr class="infomenu">
					<td width="150px">이름</td>
					<td width="300px">부서</td>
					<td width="300px">직책</td>
					<td width="250px" colspan="2"></td>
				</tr>
			</table>
		</div>
		<div id="container" style="overflow:auto; width:1150px; height:600px;" align="center">
			<input type="hidden" value="" id="status">
		</div>
	</div>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
	//검색 조건들 생성



	//검색 조건 끝
	CheckRetired(0);


	function CheckRetired(status){
		$.ajax({
			url:"/erp/rest/hr/checkretired",
			dataType:"json",
			method:"get",
			data : {status : status},
			success : function(data){
				let str = "";
				str += "<table style='border:1px solid #D9EDF7; width:1150px;text-align:center;'>";
				console.log(data);
				for(let i = 0 ; i<data.length ; i++){
					str += "<tr>"
					str += "<td width='150px'><input type='hidden' name='hc_hrcode' value= '"+data[i].hc_hrcode+"'>"+data[i].m_name +"</td>";
					str += "<td width='300px'><input type='text' class='border_delete_btn' name ='hc_dept' value = '" + data[i].hc_dept + "' readonly></td>";
					str += "<td width-'300px'><input type='text' class='border_delete_btn' name='hc_position' value = '" + data[i].hc_position + "' readonly></td>";
					str+="<td><select name='hc_work'>";
					if(status == 1){
						str+="<option value = '1' selected = 'selected'> 휴직 </option>";
						str+="<option value = '2'> 퇴사 </option>";
						str+="<option value = '0'> 재직 </option>";
					}else if(status == 2){
						str+="<option value = '1'> 휴직 </option>";
						str+="<option value = '2' selected = 'selected'> 퇴사 </option>";
						str+="<option value = '0'> 재직 </option>";
					}else if(status == 0){
						str+="<option value = '1'> 휴직 </option>";
						str+="<option value = '2'> 퇴사 </option>";
						str+="<option value = '0' selected = 'selected'> 재직 </option>";
					}
					str += "</select></td><td><input type='button' class='infobtn' value='등록' onclick='javascript:thisRowDel(this);'></td></tr>";
				}
				str+="</table>"
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
		$("#status").val(status);
	}


		function thisRowDel(row){
			if(confirm("정말 하시겠습니까?") == true){
			console.log(row);
			let tr = row.parentNode.parentNode;
			console.log(tr.firstChild.firstChild.value);
			console.log(tr.lastChild.previousSibling.firstChild.value);
			$.ajax({
				url:"/erp/rest/hr/updateretired",
				data : {hrCode : tr.firstChild.firstChild.value, work : tr.lastChild.previousSibling.firstChild.value},
				dataType:"json",
				method:"post",
				success : function(data){
					console.log(data);
				},error : function(err){
					console.log(err)
				}
			});
			tr.parentNode.removeChild(tr);
			}else{
				alert("취소되었습니다.");
			}
		}
	//업데이트시




	function searchFromName(){
		$name = $("#nameSearch").val();
		console.log($name);
		$.ajax({
			url:"/erp/rest/hr/searchingretirename",
			data:{name:$name},
			dataType:"json",
			method:"post",
			success : function(data){
				let str = "";
				if(data.length!=0){
					str += "<table style='border:1px solid #D9EDF7; width:1150px;text-align:center;'>";
					console.log(data);
					for(let i = 0 ; i<data.length ; i++){
						str += "<tr>"
						str += "<td width='150px'><input type='hidden' name='hc_hrcode' value= '"+data[i].hc_hrcode+"'>"+data[i].m_name +"</td>";
						str += "<td width='300px'><input type='text' class='border_delete_btn' name ='hc_dept' value = '" + data[i].hc_dept + "' readonly></td>";
						str += "<td width='400px'><input type='text' class='border_delete_btn' name='hc_position' value = '" + data[i].hc_position + "' readonly></td>";
						str+="<td><select name='hc_work'>";
						if(data[i].hc_work == 1){
							str+="<option value = '1' selected = 'selected'> 휴직 </option>";
							str+="<option value = '2'> 퇴사 </option>";
							str+="<option value = '0'> 재직 </option>";
						}else if(data[i].hc_work == 2){
							str+="<option value = '1'> 휴직 </option>";
							str+="<option value = '2' selected = 'selected'> 퇴사 </option>";
							str+="<option value = '0'> 재직 </option>";
						}else if(data[i].hc_work == 0){
							str+="<option value = '1'> 휴직 </option>";
							str+="<option value = '2'> 퇴사 </option>";
							str+="<option value = '0' selected = 'selected'> 재직 </option>";
						}
						str += "</select></td><td><input type='button' class='infobtn' value='등록' onclick='javascript:thisRowDel(this);'></td></tr>";
					}
					str+="</table>";
				}else if(data.length==0){
					str+="<img src='https://postfiles.pstatic.net/MjAyMDEwMTJfMjkw/MDAxNjAyNDg1OTMzODY1.7I5zBpuZTfh2cjDATZnjMy7ChY48rrU-xZDZQWOI138g.TjoCiAFSee21PBIhZ8Hc9jb-9ee7GkqFMWirGsa_6S0g.GIF.tkdgus5512/fr.gif?type=w773'>";
				}
				$("#container").html(str);
			}, error : function(err){
				console.log(err);
			}
		});
	}


	// 09-24 change    append   id=nameSearching
	$("#nameSearch").keyup(function(event){
		if(event.keyCode==13){
			$("#nameSearching").click();
		}
	});



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
