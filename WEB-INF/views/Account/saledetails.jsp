<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래명세서</title>
<link href="/erp/img/favicon.png" rel="icon" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- BOOTSTRAP STYLES-->
    <link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
     <!-- FONTAWESOME STYLES-->
    <link href="/erp/assets/css/font-awesome.css" rel="stylesheet">
        <!-- CUSTOM STYLES-->
    <link href="/erp/assets/css/custom.css" rel="stylesheet">
     <!-- GOOGLE FONTS-->
   <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="/erp/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="/erp/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="/erp/assets/js/custom.js"></script>
<style>
#comInfo{
width:1000px;
}
</style>
</head>
<body>
	<button onclick="window.print()">인쇄</button>
	<table id="comInfo" class="table table-striped table-bordered table-hover" style="text-align: center;">

		<tr>
			<td colspan="6" style="height: 50px;"><h1>거 래 명 세 표</h1></td>
		</tr>
		<tr>
			<td id="date" rowspan="3" style="width: 350px;"></td>
			<td rowspan="5"><br><br><br>공급자</td>
			<td class="colume">등록번호</td>
			<td colspan="3">${mc.c_comnum}</td>
		</tr>
		<tr>
			<td class="colume">상호</td>
			<td>${mc.c_name}</td>
			<td class="colume">성명</td>
			<td>${mc.c_ceo}</td>
		</tr>
		<tr>
			<td class="colume">주소</td>
			<td colspan="3">${mc.c_addr}</td>
		</tr>
		<tr>
			<td rowspan="2" style="width: 350px;"><br>위 날짜로 영수함.</td>
			<td class="colume">업태</td>
			<td>${mc.c_kind}"</td>
			<td class="colume">종목</td>
			<td>${mc.c_kind2}</td>
		</tr>
		<tr>
			<td class="colume">전화번호</td>
			<td colspan="3"></td>
		</tr>
		<!-- </table>
		<table id="comInfo2"> -->
		<tr>
			<td colspan="2">합계금액</td>
			<td colspan="5" id="alltotal"></td>
		</tr>
		<tr>
			<td>품명</td>
			<td>단가(원)</td>
			<td>수량</td>
			<td>공금가액(원)</td>
			<td>세액(원)</td>
			<td>합계(원)</td>
		</tr>
		<tbody id="tbody">
		</tbody>
		<tr>
			<td colspan="2">계</td>
			<td id="cnt"></td>
			<td id="price2"></td>
			<td id="tax"></td>
			<td id="total"></td>
		</tr>
		<tr>
			<td colspan="7"><textarea rows="3" cols="130"></textarea></td>
		</tr>
	</table>

</body>
<script>
	$("#total2").html($("#total").html() + "원");
	var date = new Date();
	date = date.getFullYear() + "년" + (date.getMonth() + 1) + "월"
			+ date.getDate() + "일<br>" + date.getHours() + "시"
			+ date.getMinutes() + "분" + date.getSeconds()+"초";
	$("#date").html("<br>"+date);

	var saleList = ${tList2};
	var cnt = 0;
	var price2 = 0;
	var tax = 0;
	var str = "";
	var total = 0;
	for ( var i in saleList) {
		str += "<tr class='success'><td>" + saleList[i].s_pkind + "</td>";
		str += "<td>" + saleList[i].s_price + "</td>";
		str += "<td>" + saleList[i].s_cnt + "</td>";
		str += "<td>" + saleList[i].s_price2 + "</td>";
		str += "<td>" + saleList[i].s_tax + "</td>";
		str += "<td>" + saleList[i].s_total + "</td></tr>";

		total += Number(saleList[i].s_total);
		cnt += Number(saleList[i].s_cnt);
		price2 += Number(saleList[i].s_price2);
		tax += Number(saleList[i].s_tax);
	}
	$("#tbody").html(str);
	$("#alltotal").html(total + "(원)");
	$("#cnt").html(cnt);
	$("#price2").html(price2);
	$("#tax").html(tax);
	$("#total").html(total);
</script>
</html>