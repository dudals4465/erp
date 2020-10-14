<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>사원 급여 상세 보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="/erp/img/favicon.png" rel="icon" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css"
	media="all" />
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
	border-right:1px solid #E6E6E6;
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
#payinputmodify{
	border: 1px solid black;
	border-collapse: collapse;
}
table{
	border-collapse: collapse;
}
.dat{
	border:2px solid #D9EDF7;
	background-color: #ECEBEA;
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
		<h1 class="deptregist_color_size">사원 급여 상세정보</h1>
	</div>
	<form action="searchpaymm" method="post" name="payroll">
	<input type="hidden" value="${card.hc_ccode}" name="HP_CCODE">
	<table id="payinputmodify" style="text-align: center; width: 1150px;height: 100px;border: 2px solid #D9EDF7;background-color: #F8F7F7;" >
		<tr>
			<td class="dat" width="150px">사원코드  </td>
			<td><input id="hrcode" name="hrcode" style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_hrcode}"></td>
			<td class="dat" width="150px">이름  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${name}"></td>
			<td class="dat" width="150px">입사일  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_joindate}"></td>
		</tr>
		<tr>
			<td class="dat">부서  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_dept}"></td>
			<td class="dat">직급  </td>
			<td><input style="border: none;background-color: #F8F7F7;" type="text" readonly="readonly" value="${card.hc_position}"></td>
			<td class="dat">급여일  </td>
			<td><input type="month" id="month" name="month"></td>
		</tr>
	</table>
	</form>
	<div id="detailpage" align="center">
	</div>
	<div align="center" style="margin-top: 20px;">
		<input type="button" class="infobtn" onclick="moving()" value="확인">
	</div>
	</div>
<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
	<script>
		function moving(){
			location.href="/erp/hr/searchpaymm";
		}

		var moneyCheck = function(money){
			var length = money.length; //7
			var div = Math.floor(length/3); //2 
			var mod = length%3; //1
			var num = "";
			num += money.substr(0, mod) + "";
			for(let i = 0 ; i < div ; i++){
				if(mod==0&&i==0){
					num += money.substr((mod+(i*3)), 3);
				}else{
					num += "," + money.substr((mod+(i*3)), 3);
				}
			}
			return num;
		}
		//달력이 변경되면 정보 출력
		$("#month").change(function(){
			var month=$(this).val();
			var hrcode=$("#hrcode").val();
			$.ajax({
				url:"/erp/hr/findmonth",
				method:'POST',
				data:{month : month ,hrcode : hrcode},
				dataType:"json",
				success:function(data){
					var provide=Number(data.HDP_PAY)+Number(data.HP_INCEN);
					var ince=Number(data.HP_INSURANCE)+Number(data.HP_TAX);
					var str='';
					console.log(data);
					if(data!="1"){
						str+="<table style='width:1150px; height:300px;text-align:center;border:2px solid #D9EDF7;background-color: #F8F7F7;'><tr>"
							+"<td  class='dat'>지급내역</td>"
							+"<td  class='dat'>지급액</td>"
							+"<td  class='dat'>공제내역</td>"
							+"<td  class='dat'>공제액</td></tr>"
							+"<tr><td  class='dat'>기본급</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HDP_PAY.toString())+"</td>"
							+"<td  class='dat'>보험</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_INSURANCE.toString())+"</td></tr>"
							+"<tr><td  class='dat'>인센티브</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_INCEN.toString())+"</td>"
							+"<td  class='dat'>소득세</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_TAX.toString())+"</td></tr>"
							+"<tr><td  class='dat'>월차수당</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_MONTHLYBONUS.toString())+"</td>"
							+"<td  class='dat'>공제액계</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(ince.toString())+"</td></tr>"
							+"<td  class='dat'>급여 계</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(provide.toString())+"</td>"
							+"<td  class='dat'>실지급액</td>"
							+"<td style='background-color:F8F7F7;'>"+moneyCheck(data.HP_REALMONEY.toString())+"</td></tr></table>"
					}else if(data=="1"){
						str+="<img src='http://mjscholarship.com/k1/board/images/no_article.gif' width='500px' height='350px'>";
					}
					$("#detailpage").html(str);
				},
				error:function(err){
					console.log(err);
				}
			});
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
