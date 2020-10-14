<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영업결재 받는거 상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
html, body {
   text-align: center;
}

table, tr, th, td {
   border: 1px solid silver;
   text-align: center;
   margin-left: auto;
   margin-right: auto;
   width: auto;
   height: auto;
}

.txt {
   width: 200px;
   height: 20px;
   border-style: none;
   text-align: center;
}

.select {
   width: 150px;
   height: 25px;
}

.draft {
   width: 500px;
   height: 20px;
   border-style: none;
   text-align: center;
   "
}

.draft2 {
   width: 600px;
   text-align: center;
}

.draft3 {
   width: 230px;
   border-style: none;
   text-align: center;
}

#ect {
   height: 300px;
   width: 950px;
}
</style>
</head>
<body>
   <form id="for">
     <br>
     <br>
      <div style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;">기안문 상세보기</div>
      <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table>
            <tr>
               <th>제목</th>
               <th><input type="hidden" name="bs_docuname" value="${app.bs_docuname}">${app.bs_docuname}</th>
            </tr>
            <tr>
               <th>결재자</th>
               <th id="line">
                  <input type="hidden" value="${app.bs_apcode1}" name="code"> //<!-- code -->
                  <input type="hidden" value="${app.bs_apcode2}" name="code"> <!-- code -->
                  <input type="hidden" value="${app.bs_apcode3}" name="code"> <!-- code -->
               </th>

            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <div style="border: 1px solid #EAEAEA; background-color: white;"><div>
                        <table>
                           <tr>
                              <th colspan="2">출하번호</th>
                              <th colspan="2"><input id="num" type="text" name="bs_docunum" class="txt" value="${app.bs_docunum}" readonly></th>
                              <th colspan="2">거래처 회사코드</th>
                              <th colspan="2"><input type="text" name="bs_clcode" class="txt" value="${app.bs_clcode}" readonly>
<%--                          <input type="hidden" name="j_grade" class="draft3" value="${ac.j_grade}" readonly></th>
                              <td>결재상태</td> --%>

                           </tr>
                           <tr>
                            <th colspan="2">회사코드</th>
                              <th colspan="2"><input type="text" name="bs_ccode" class="txt" value="${app.bs_ccode}" readonly>
                              <%-- <input type="hidden" name="j_ccode" class="txt" value="${ac.j_ccode}" readonly></th> --%>
                              <th colspan="2">품목코드</th>
                              <th colspan="2"><input type="text" name="bs_itcode" class="txt" value="${app.bs_itcode}" readonly></th>
                           </tr>
                           <tr>
                              <th colspan="2">제품명</th>
                              <td colspan="2"><input type="text" name="bs_proname" class="draft3" value="${app.bs_proname}" readonly></td>
                              <th colspan="2">예상납기일</th>
                              <td colspan="2"><input type="text" name="bs_basedate" class="draft3" value="${app.bs_basedate}" readonly></td>

                           </tr>
                          <tr>
                              <th colspan="2">판매단가</th>
                              <td colspan="5"><input type="text" name="bs_unit" class="draft" value="${app.bs_unit}" readonly></td>
                           </tr>
                           <tr>
                              <th colspan="2">수량</th>
                              <td colspan="5"><input type="text" name="bs_quantity" class="draft" value="${app.bs_quantity}" readonly></td>
                           </tr>

                           <tr>
                              <th>판매금액</th>
                              <td colspan="7"><input type="text" name="bs_price" class="draft" value="${app.bs_price}" readonly></td>
                           </tr>
                            <tr>
                              <th>반려사유</th>
                              <th colspan="8"><input id="ect" type="text" name="bs_ect" value="${app.bs_ect}"></th>
                           </tr>
                        </table>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
      </form>
         <br>
         <button type="button" id="submit">제출하기</button>
         <button type="button" id="arbitrarily">전결하기</button>
         <button type="button" id="turnback">반려하기</button>

</body>
<script>

	$(document).ready(function() {
						var arr = new Array();
						var cnt = $("input[name='code']").length;

						$("input[name='code']").each(function() {
							arr.push($(this).attr('value'));
						});

						$.ajax({
									url : '/erp/rest/sales/getApprinfo',
									type : 'post',
									traditional : true,
									data : 'ARR=' + arr + '&CNT=' + cnt,
									success : function(data) {
										console.log(data);
										var str = "";
										for ( var i in data.sList) {
											str += "<input type='text' name='bs_apcode"+i+"' value='"+data.sList[i].hc_hrcode+"' hidden='true' readonly>";
											str += data.sList[i].hc_position
													+ "/";
											str += "<input style='width:50px;' type='text' name='bs_approver"+i+"' value='"+ data.sList[i].m_name+"' readonly>&nbsp;&nbsp;||&nbsp;&nbsp;";
										}
										console.log(str)
										$("#line").html(str);

									},
									error : function(error) {
										console.log(error);
									}
								});
					});
	$('#turnback').click(function(){
		var ect = $("#ect").val();
		var num= $("#num").val();

		$.ajax({
			url:'/erp/rest/home/turnback',
			type:'post',
			data:{num:num,ect:ect},
			success:function(data){
				console.log(data);
				if(data==1){
					alert("반려완료");
					window.close();
				}else{
					alert("반려실패");
				}

			},
			error:function(error){
				console.log(error);

			}
		});
	});
	
	$("#submit").click(function(){
		var num= $("#num").val();
		$.ajax({
			url:'/erp/rest/home/approvalagree',
			type:'post',
			data:{num:num},
			datatype:'json',
			success:function(data){
				console.log(data);
				if(data==1){
					alert("결재완료");
					window.close();
				}else{
					alert("결재실패");
				}
			},
			error:function(error){
			}
		});
		
	});
	
	$("#arbitrarily").click(function(){
		var num= $("#num").val();
		$.ajax({
			url:'/erp/rest/home/arbitrarily',
			type:'post',
			data:{num:num},
			datatype:'json',
			success:function(data){
				console.log(data);
				if(data==1){
					alert("전결완료");
					window.close();
				}else{
					alert("전결실패");
				}
			},
			error:function(error){
			}
		});
		
	});

/* 	$('#submit').click(function(){


		$.ajax({
			url:'/erp/rest/sales/submit',
			type:'post',
			data:{num:num},
			success:function(data){
				console.log(data);
			},
			error:function(error){
				console.log(error);

			}
		});
	}); */
	
</script>
</html>
