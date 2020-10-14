<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 관리 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
table{
width: 100%;
}
table,tr,th,td{
border: 1px solid;
text-align: center;
}
#infodetail{
width: 1000px;
text-align: center;
border: 3px double #e1e1e1;
border-collapse: collapse;
border-radius: 8px; 
}

</style>
</head>
<body>
	<form action="purchasedetail">
		<div id="infodetail">
			<h2>구매 상세정보</h2>
			<table>
				<tr>
					<th style="background-color: #e1e1e1">구매번호</th>
					<td>${ps.p_documentcode}</td>
					<th style="background-color: #e1e1e1">제품번호</th>
					<td colspan="2">${ps.p_productnum}</td>
					<th style="background-color: #e1e1e1">담당자</th>
					<td colspan="2">${ps.p_writer}</td>
				</tr>
				<tr>
					<th style="background-color: #e1e1e1">거래처</th>
					<td>${ps.p_clcode}</td>
					<th style="background-color: #e1e1e1">구매일</th>
					<td colspan="5">${ps.p_day}</td>
				</tr>
				<tr>
					<th style="background-color: #e1e1e1">상품번호</th>
					<th style="background-color: #e1e1e1">상품코드</th>
					<th style="background-color: #e1e1e1">수량</th>
					<th colspan="2" style="background-color: #e1e1e1">단가</th>
					<th colspan="3" style="background-color: #e1e1e1">합계</th>
				</tr>
				<tbody id="tbody"></tbody>
			</table>
		</div>
	</form>

<script type="text/javascript">
	
	var str='';
		var pList=${pList};
		console.log(pList);
	for(var i in pList){
		str+= "<tr><td>"+pList[i].p_name+"</td>";
		str+="<td>"+pList[i].p_itcode+"</td>";
		str+="<td>"+pList[i].p_amount+"</td>";
		str+="<td colspan='2'>"+pList[i].p_unlit+"</td>";
		str+="<td colspan='3'>"+pList[i].p_budget+"</td></tr>";
	}
	$('#tbody').html(str);

</script>

</body>
</html>