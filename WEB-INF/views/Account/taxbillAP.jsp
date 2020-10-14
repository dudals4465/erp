<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>매입 세금계산서</title>
<link href="/erp/img/favicon.png" rel="icon" />
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
#main{
text-align: center;
}
#my{
float: left;
color:red;
text-align: center;
valign:middle;

}
#cl{
float: left;
/* margin-left: 7%; */
color:blue;
text-align: center;
valign:middle;
}
#kind{
text-align: center;
}

</style>
</head>
<body>
		 
	<div id="main">
		<c:forEach var="taxbill" items="${tList1}">
	<div><h1>매입세금계산서</h1><span>전표번호(${taxbill.s_num})
					아래 금액을 (영수<input type="radio" name="stat">
					청구<input type="radio" name="stat">) 함</span></div>
		</c:forEach>
		<div id="my">
		<table class="table table-striped table-bordered table-hover" style="width:620px; height:250px; text-align: center;">
		<tr>
					<th rowspan="3"><br><br><br><br>공<br>급<br>자</th>
					<th style="width:70px;"><br>사업자<br>번호</th>
					<td><br>${ac.cl_comnum}</td>
					<th style="width:70px;"><br>상호<br>(법인명)</th>
					<td><br>${ac.cl_name}</td>
					</tr>
					<tr>
					<th><br>성명<br>(대표자)</th>
					<td><br>${ac.cl_ceo}</td>
						<th><br>사업장<br>주소</th>
					<td><br>${ac.cl_addr}</td>
						</tr>
						<tr>
						<th><br>업태</th>
					<td><br>${ac.cl_kind}</td>
					<th><br>종목</th>
					<td><br>${ac.cl_kind2}</td>
					</tr>
		</table>
		</div>
		<div id="cl">
		<table class="table table-striped table-bordered table-hover" style="width:620px;height:250px; text-align: center;">
		<tr>
					<th rowspan="3"><br><br><br>공<br>급<br>받<br>는<br>자</th>
					<th><br>사업자번호</th>
					<td><br>${mc.c_comnum}</td>
					<th><br>상호(법인명)</th>
					<td><br>${mc.c_name}</td>
					</tr>
					<tr>
					<th><br>성명(대표자)</th>
					<td><br>${mc.c_ceo}</td>
						<th><br>사업장주소</th>
					<td><br>${mc.c_addr}</td>
						</tr>
						<tr>
						<th><br>업태</th>
					<td><br>${mc.c_kind}</td>
					<th><br>종목</th>
					<td><br>${mc.c_kind2}</td>
					</tr>
		</table>
		</div>
		<div>
		<table id="kind" class="table table-striped table-bordered table-hover" style="width:1240px; text-align: center;">
		<tr>
					<th>품목</th>
					<th>수량</th>
					<th>단가</th>
					<th>공급가액</th>
					<th>세액</th>
					<th>합계</th>					
					<th>비고</th>
				</tr>
				<tbody id="tbody">
				
				</tbody>
				<tr>
					<th>작성날자</th>
					<th>공급가액</th>
					<th>부가세액</th>
					<th colspan="4">비고</th>
				</tr>
				<tr class="info">
					<td id="date"></td>
					<td id="allprice"></td>
					<td id="alltax"></td>
					<td colspan="4"><textarea rows="2" cols="70"></textarea></td>
				</tr>
					<tr align="center">
					<th align="center" colspan="3">합계금액</th>
					<th>현금</th>
					<th>수표</th>
					<th>어음</th>
					<th>외상미수금</th>
				</tr>
				<tr class="warning">
					<td colspan="3" id="alltotal"></td>
					<td><input type="radio" name="kind"></td>
					<td><input type="radio" name="kind"></td>
					<td><input type="radio" name="kind"></td>
					<td><input type="text"></td>
				</tr>
		</table>
		</div>
		</div>
	<a href="#" onclick="window.print()"><button>인쇄</button></a>
		 
	
	<%-- 	<div id="main">
			<table>
				<tr>
					<th colspan="10" id="title">세금계산서(보관용)</th>
					</tr>
					<c:forEach var="taxbill" items="${tList1}">
				<tr>		
					<th colspan="10">전표번호<input type="text" value=" ${taxbill.s_num}"readonly>
					아래 금액을 (영수<input type="radio" name="stat">
					청구<input type="radio" name="stat">) 함</th>
				</tr>
					</c:forEach>
				<tr>
					<th rowspan="4">공급자</th>
					<th>사업자번호</th>
					<td colspan="3"><input type="text" value="${ac.cl_comnum}"
						readonly></td>
					<th rowspan="4">공급받는자</th>
					<th>사업자번호</th>
					<td colspan="3"><input type="text" value="${mc.c_comnum}"
						readonly></td>
				</tr>
				<tr>
					<th>상호(법인명)</th>
					<td><input type="text" value="${ac.cl_name}" readonly></td>
					<th>성명(대표자)</th>
					<td><input type="text" value="${ac.cl_ceo}" readonly></td>
					<th>상호(법인명)</th>
					<td><input type="text" value="${mc.c_name}" readonly></td>
					<th>성명(대표자)</th>
					<td><input type="text" value="${mc.c_ceo}" readonly></td>
				</tr>
				<tr>
					<th>사업장주소</th>
					<td colspan="3"><input type="text" value="${ac.cl_addr}"
						readonly></td>
					<th>사업장주소</th>
					<td colspan="3"><input type="text" value="${mc.c_addr}"
						readonly></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><input type="text" value="${ac.cl_kind}" readonly></td>
					<th>종목</th>
					<td><input type="text" value="${ac.cl_kind2}" readonly></td>
					<th>업태</th>
					<td><input type="text" value="${mc.c_kind}" readonly></td>
					<th>종목</th>
					<td><input type="text" value="${mc.c_kind2}" readonly></td>
				</tr>
				<tr>
					<th colspan="2" >작성날자</th>
					<th colspan="2">공급가액</th>
					<th colspan="3">부가세액</th>
					<th colspan="3">비고</th>
				</tr>
				<tr>
					<td colspan="2" id="date"></td>
					<td colspan="2" id="allprice"></td>
					<td colspan="3" id="alltax"></td>
					<td colspan="3"><input type="text" value=""></td>
				</tr>
				<tr>
					<th colspan='2'>품목</th>
					<th>수량</th>
					<th>단가</th>
					<th colspan="2">공급가액</th>
					<th colspan='2'>세액</th>
					<th>합계</th>
					<th>비고</th>
				</tr>
				<tbody id="tbody">
				
				</tbody>
				<tr>
					<th colspan="2">합계금액</th>
					<th colspan="2">현금</th>
					<th colspan="2">수표</th>
					<th colspan="2">어음</th>
					<th colspan="2">외상미수금</th>
				</tr>
				<tr>
					<td colspan="2" id="alltotal"></td>
					<td colspan="2"><input type="radio" name="kind"></td>
					<td colspan="2"><input type="radio" name="kind"></td>
					<td colspan="2"><input type="radio" name="kind"></td>
					<td colspan="2"><input type="text"></td>
				</tr>
			</table>
		</div>
	
	<a href="#" onclick="window.print()"><button>인쇄</button></a> --%>
</body>
<script>
var saleList = ${tList2};
console.log(saleList);
var str="";
var price2=0;
var tax=0;
var total=0;
for(var i in saleList){
	str+="<tr class='success'><td>"+saleList[i].s_pkind+"</td>";
	str+="<td>"+saleList[i].s_cnt+"</td>";
	str+="<td>"+saleList[i].s_price+"</td>";
	str+="<td>"+saleList[i].s_price2+"</td>";
	str+="<td>"+saleList[i].s_tax+"</td>";
	str+="<td>"+saleList[i].s_total+"</td>";
	str+="<td>"+saleList[i].s_memo+"</td></tr>";
	price2+=Number(saleList[i].s_price2);
	tax+=Number(saleList[i].s_tax);
	total+=Number(saleList[i].s_total);
}
$("#tbody").html(str);
var date = new Date();
date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()+"<br>"+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
console.log(price2);
console.log(tax);
$("#date").html(date);
$("#allprice").html(price2+"(원)");
$("#alltax").html(tax+"(원)");
$("#alltotal").html(total+"(원)");
</script>
</html>