<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고상세정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
</head>
<style>
#comInfo {
	text-align: center;
}
#main2{
padding-left: 25%;
}
#testTable{
padding-left: 7%;
}
</style>
<body>
<form id="saleInfo">
		<div id="comInfo"
			style="height: 80px; padding-top: 15px; background-color: #F8F7F7;">
			<table id="main2">
				<thead>
					<tr>
						<td>전표번호</td>
						<td><input class="data" type="text" value="자동생성" readonly /></td>
						<td>종류</td>
						<td><select class="data" name="s_num">
								<option value="">--</option>
								<option value="AS">매출</option>
								<option value="AP">매입</option>
						</select></td>
						<td>유형</td>
						<td><select class="data" name="s_kind">
								<option value="과세">과세</option>
								<option value="비과세">비과세</option>
						</select></td>
					</tr>
					<tr>
						<td>거래처명</td>
						<td><input id="company" class="data" type="text" name="s_company" readonly/></td>
						<td>사업자코드</td>
						<td><input id="code" class="data" type="text" name="s_clcode" readonly/></td>
						<td>입력자</td>
						<td><input class="data" type="text" name="s_employee" value="${hrCode}" readonly/></td>
						<td></td>
					</tr>
				</thead>
			</table>
		</div>
		

		<div id="ListTable" style="background-color: #ECEBEA; overflow: auto;" >
			<table id="testTable"
				summary="Code page support in different versions of MS Windows."
				border="1">
				<thead>
					<tr>
						<td>체크</td>
						<td>품목</td>
						<td>수량</td>
						<td>단가(원)</td>
						<td>공급가액(원)</td>
						<td>부가세액(원)</td>
						<td>합계(원)</td>
						<td>적요</td>
					</tr>
				</thead>
				<tbody id="tBody">
					<tr>
						<td><input type="checkbox" class="check"></td>
						<td><input class="data" type="text" name="s_pkind" /></td>
						<td><input id="cnt" class="data" type="text" name="s_cnt" /></td>
						<td><input id="price" class="data" type="text" name="s_price" /></td>
						<td><input id="price2" class="data" type="text"
							name="s_price2" /></td>
						<td><input id="tax" class="data" type="text" name="s_tax" /></td>
						<td><input id="total" class="data" type="text" name="s_total" /></td>
						<td><input class="data" name="s_memo" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
 		<button id="insert" type="button" onclick="saleInsertInfo()" style="margin-left: 45%">등록</button>
</body>
<script>
var sList = ${sList};
console.log(sList);

  $("#company").val(sList[0].cl_name);
  $("#code").val(sList[0].ie_clcode);
  
  $("#testTable").html("");
	var str='';
		str += "<thead><tr><td>출하번호</td><td>품목</td><td>수량</td><td>단가(원)</td><td>공급가액(원)</td><td>부가세액(원)</td><td>합계(원)</td><td>적요</td></tr></thead>";
	for(var i in sList){
	var price=0;
	var qty=0;
	price= Number(sList[i].ie_price);
	qty = Math.abs(Number(sList[i].ie_qty));
	var price2= (price/qty);
	var tax = (price2*qty)/10;
	var total = Number(sList[i].ie_price)+tax;
	console.log(price2);
	console.log(price);
	console.log(qty);
		str += "<tbody id='tBody'><tr><td><input type='text' class='check' name='ie_seqnum' value="+sList[i].ie_seqnum+" readonly></td>";
		str += "<td><input class='data' type='text' name='s_pkind' value="+sList[i].it_pname+" readonly></td>";
		str += "<td><input class='data type='text' name='s_cnt' value="+sList[i].ie_qty+" readonly></td>";
		str += "<td><input class='data type='text' name='s_price' value="+price2+" readonly></td>";
		str += "<td><input class='data type='text' name='s_price2' value="+(price2*qty)+" readonly></td>";
		str += "<td><input class='data type='text' name='s_tax' value="+tax+" readonly></td>";
		str += "<td><input class='data type='text' name='s_total' value="+total+" readonly></td>";
		str += "<td><input class='data' type='text' name='s_memo'></td></tr></tbody>";
	$("#testTable").html(str);
	};
	
	
	function saleInsertInfo(){
	       var obj = $("#saleInfo").serialize();
	       $.ajax({
	    	  url:'/erp/rest/Account/saleinsert',
	    	  type:'post',
	    	  data:obj,
	    	  success:function(data){
	    		  console.log(data);
	    		  alert("데이터입력성공");
	    		window.close();
	    	  },
	    	  error:function(error){
	    		  console.log(error);
	    		  alert("데이터 입력실패");
	    	  }

	       });

	};
</script>
</html>