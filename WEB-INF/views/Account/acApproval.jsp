<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출/매입결제양식</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
html,body{
text-align: center;
}
table, tr, th, td{
border: 1px solid silver;
text-align: center;
margin-left: auto;
margin-right: auto;
}
.txt{
width: 200px;
height: 20px;
border-style: none;
text-align: center;
}
.select{
width: 150px;
height: 25px;
}   
.draft{
width: 500px; 
height: 20px; 
border-style: none; 
text-align: center;"
}
.draft2{
width: 600px; 
text-align: center;
}
.draft3{
width: 230px;
border-style: none; 
text-align: center;
}
#ect{
resize: none;
}
input{
border: 0px;
text-align: center;
}
</style>
</head>
<body>
   <div style="width: auto; background-color: white; padding: 1%;">
<button type="button" id="approvalLine">결재라인 불러오기</button>
   </div>
   <div style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;">기안문 작성</div>
   <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
   <form id="formdata">
         <table>
         
            <tr>
               <th>일자</th>
               <th><input id="time" type="text" name="rs_date"></th>
            </tr>
            <tr>
               <th>제목</th>
               <th><textarea rows="1" cols="190" name="rs_title" style="text-align:center;"></textarea></th>
            </tr>
            <tr>
               <th>결재자</th>
               <th id="line"></th>
            </tr>
            
            <tr>
               <th>내용</th>
               <td>
                  <div style="border: 1px solid #EAEAEA; background-color: white;">
                     <div>
                        <table>
                        <c:forEach var="approval" items="${sList1}">
                           <tr>
                              <th colspan="10">매출/매입 기안문</th>
                           </tr>
                           <tr>
                           <th>전표번호</th>
                           <th colspan="2"><input type="text" name="rs_num" value="${approval.s_num}"></th>
                              <th>유형</th>
                              <th><input type="text" name="rs_kind" value="${approval.s_kind}"></th>
                              <th colspan="2">거래처</th>
                              <th colspan="3"><input type="text" name="rs_company" value="${approval.s_company}"></th>
                           </tr>
                           <tr>
                           <th>사업자번호</th>
                           <th colspan="2"><input type="text" name="rs_comnum" value="${approval.s_comnum}"></th>
                              <th>매출일자</th>
                              <th><input type="text" name="rs_sdate" value="${approval.s_date}"></th>
                              <th>담당자</th>
                              <th>부서명</th>
                              <th><input type="text" name="rs_dept" value="회계팀"></th>
                              <th>사원코드</th>
                              <th><input type="text" name="rs_employee" value="${approval.s_employee}"></th>
                           </tr>
                           </c:forEach>
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
                        <tr><th colspan="3">총합계(원)</th><th id="total" colspan="7"></th></tr>
                           <tr>
                              <th>기타</th>
                              <th colspan="10"><textarea rows="5" cols="163" name="rs_reason"></textarea></th>
                           </tr>
                        </table>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
   </form>
      </div>
   <button id="commit" type="button">결재상신</button>&nbsp;<button type="reset">취소</button>
</body>
<script>


 $(document).ready(function(){
	 
	
	$.ajax({
		url:'/erp/rest/Account/getMyInfo',
		type:'get',
		datatype:'json',
		success:function(data){
			console.log(data);
			var str = "";
			for ( var i in data.sList) {
		        str +="<input type='text' name='rs_apcode"+i+"' value='"+data.sList[i].hc_hrcode+"' hidden='true'>";
				str +=data.sList[i].hc_position+"/";
				str +="<input style='width:50px;' type='text' name='rs_apname"+i+"' value='"+ data.sList[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
			}
			console.log(str)
			$("#line").html(str);
		
		},
		error:function(error){
			console.log(error);
		}
	});
	 
 });
 

$("#commit").click(function(){
	var data = $("#formdata").serialize();
	$.ajax({
		url:'/erp/Account/approdocument',
		type:'post',
		data: data,
		datatype:'json',
		success:function(data){
			alert("결제요청성공")
			console.log(data);
			window.close();
		},
		error:function(error){
			console.log(error);
		}
	});
	 
});

var saleList = ${sList2};
var total=0;
var str="";
for(var i in saleList){
	str+="<tr><td colspan='2'><input type='text' name='rs_pkind' value="+saleList[i].s_pkind+"></td>";
	str+="<td><input type='text' name='rs_cnt' value="+saleList[i].s_cnt+"></td>";
	str+="<td><input type='text' name='rs_price' value="+saleList[i].s_price+"></td>";
	str+="<td colspan='2'><input type='text' name='rs_price2' value="+saleList[i].s_price2+"></td>";
	str+="<td colspan='2'><input type='text' name='rs_tax' value="+saleList[i].s_tax+"></td>";
	str+="<td><input type='text' name='rs_total' value="+saleList[i].s_total+"></td>";
	str+="<td><input type='text' name='rs_memo' value="+saleList[i].s_memo+"></td></tr>";
	total+=Number(saleList[i].s_total);
}
$("#tbody").html(str);
$("#total").html(total);


var time = new Date();
$("#time").val(time.toLocaleDateString()+time.toLocaleTimeString());

 

	function setChildValue(data) {
		console.log(data);
		if (data.tList1 != "") {
		var str = "";
			for ( var i in data.tList1) {
		        str +="<input type='text' name='rs_apcode"+(Number(i)+Number(1))+"' value='"+data.tList1[i].hc_hrcode+"' hidden='true'>";
				str +=data.tList1[i].hc_position+"/";
				str +="<input style='width:50px;' type='text' name='rs_apname"+(Number(i)+Number(1))+"' value='"+ data.tList1[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
			}
			console.log(str)
			$("#line").append(str);
		};
	};
		/* if (data.tList2 != "") {
			for ( var i in data.tList2) {
		var str2 = "";
				str2 +="<input type='text' name='ad_recode"+i+"' value='"+data.tList2[i].m_code+"' hidden='true'>";
				str2 += data.tList2[i].m_grade + "<br>";
				str2 += data.tList2[i].m_name;
			$("#refer"+i).html(str2);
			}
		}; */
	

	$("#approvalLine").click(function() {

		window.open('/erp/Account/approvalLine', 'approvalLine', 'width=1400,height=700');
	});
	
</script>
</html>