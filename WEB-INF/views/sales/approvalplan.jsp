<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출하 결재 요청창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
html,body{
text-align: center;
}
#table, tr, th, td{
border: 1px solid silver;
text-align: center;
margin-left: auto;
margin-right: auto;
}
.txt{
width: 200px;
height: 20px;
/* border-style: none; */
border: 1px solid silver;
text-align: center;
}
.select{
width: 150px;
height: 25px;
}   
.draft{
width: 500px; 
height: 20px; 
/* border-style: none; */
border: 1px solid silver; 
text-align: center;"
}
.draft2{
width: 600px; 
text-align: center;
}
.draft3{
width: 230px;
/* border-style: none; */
border: 1px solid silver;
text-align: center;
}
#ect{
resize: none;
}
</style>
</head>
<body>
   <form id="approvalinput">
   <div style="width: auto; background-color: white; padding: 1%;">
      <!-- <input type="button" id="save" value="저장"> -->
      <button type="button" id="approvalLine">결재라인 불러오기</button>
      <input type="button" id="submit" value="제출하기"> 
   </div>
   
   <div style="width: auto; background-color:#3D6B9B; color: white; padding: 1%;">기안문 작성</div>
   <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table id="table">
            <tr>
               <th>일자</th>
               <th><input type="date" name="bs_date" class="draft2" ></th>
            </tr>
            <tr>
               <th>제목</th>
               <th><input type="text" name="bs_docuname" class="draft2"></th>
            </tr>
            <tr>
               <th>결재자</th>
               <th id="line"></th>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                        <table>
                           <tr>
                              <th colspan="6">출하 요청서</th>
                              <th><input type="radio" name="bs_credit" value="외상">&nbsp;외상
                                  <input type="radio" name="bs_credit" value="완납">&nbsp;완납 </th>
                              <th><input type="text" name="bs_docunum" value="${sb.bs_docunum}" placeholder="출하번호" readonly class="txt"></th>
                           </tr>
                           <tr>
<!--                       <th colspan="3">상신자</th>
                              <th colspan="1"><input type="text"> --></th> <!-- name="bs_approver1" --> <!--bo_num-->
                              <th colspan="4">거래처 회사코드</th>
                              <th colspan="4"><input type="text" name="bs_clcode" value="${sb.bs_clcode}" readonly class="txt"></th>
                           </tr>
                           <tr>
                              <th rowspan="15" colspan="2">조회</th>   
                           </tr>
                           <tr>
                              <td>회사코드</td>
                              <td colspan="6"><input type="text" name="bs_ccode" value="${sb.bs_ccode}" readonly class="draft"></td>
                           </tr>
                           <tr>
                              <td>수주번호</td>
                              <td colspan="6"><input type="text" name="bs_bonum" value="${sb.bs_bonum}" readonly class="draft"></td>
                           </tr>
                           <tr>
                              <td>품목코드</td>
                              <td colspan="6"><input type="text" name="bs_itcode" value="${sb.bs_itcode}" readonly class="draft"></td>
                           </tr>
                           <tr>
                              <td>제품명</td>
                              <td colspan="6"><input type="text" name="bs_proname" value="${sb.bs_proname}" readonly class="draft"></td>
                           </tr>
<%--                        <tr>
                              <td>출하의뢰일</td>
                              <td colspan="6"><input type="text" name="bs_date1" value="${sb.bs_date1}" class="draft"></td>
                           </tr>  --%>
                           <tr>
                              <td>예상납기일</td>
                              <td colspan="6"><input type="text" name="bs_basedate" value="${sb.bs_basedate}" readonly class="draft"></td>
                           </tr>
                           <tr>
                              <td>판매단가</td>
                              <td><input type="text" name="bs_unit" value="${sb.bs_unit}" readonly class="draft3" ></td>
                              <td>수량</td>
                              <td><input type="text" name="bs_quantity" value="${sb.bs_quantity}" readonly class="draft3"></td>
                              <td>판매금액</td>
                              <td ><input type="text" name="bs_price" value="${sb.bs_price}" readonly class="draft3"></td>
                           </tr>
                           <tr>
                              <th>기타</th>
                              <th colspan="8"><textarea id="checkect" rows="13" cols="125" name="bs_ect"></textarea></th>
                           </tr>
                        </table>
                     </td>
               </tr>
            </table>
         </div>
   </form>
   
   
   <script>
   $(document).ready(function(){
      $.ajax({
         url:'/erp/rest/sales/getMyInfo',
         type:'get',
         datatype:'json',
         success:function(data){
            console.log(data);
            var str = "";
            for ( var i in data.sList) {
                 str +="<input type='text' name='bs_apcode"+(Number(i)+Number(1))+"' value='"+data.sList[i].hc_hrcode+"' hidden='true' readonly>";
               str +=data.sList[i].hc_position+"/";
               str +="<input style='width:50px;' type='text' name='bs_approver"+(Number(i)+Number(1))+"' value='"+ data.sList[i].m_name+"' readonly>&nbsp;&nbsp;||&nbsp;&nbsp;";
            }
            console.log(str)
            $("#line").html(str);
         
         },
         error:function(error){
            console.log(error);
         }
      });
       
    });
   
   
      $(function() {
         for (i = new Date().getFullYear(); i > 2016; i--) {
            $('#years').append($('<option/>').val(i).html(i));
         }
         for (i = 1; i < 13; i++) {
            $('#months').append($('<option/>').val(i).html(i));
         }
         updateNumberOfDays();
         $('#years, #monts').change(function() {
            updateNumberOfDays();
         });
      });

      function updateNumberOfDays() {
         $('#days').html('');
         month = $('#months').val();
         year = $('#years').val();
         days = daysInMonth(month, year);

         for (i = 1; i < days + 1; i++) {
            $('#days').append($('<option/>').val(i).html(i));
         }
      }
      
      function daysInMonth(month, year) {
         return new Date(year, month, 0).getDate();
      }
      

      
      $("#approvalLine").click(function() {
          window.open('/erp/Account/approvalLine', 'approvalLine', 'width=1400,height=700');
       });
            
      function setChildValue(data) {
          console.log(data);
          if (data.tList1 != "") {
          var str = "";
             for ( var i in data.tList1) {
                  str +="<input type='text' name='bs_apcode"+(Number(i)+Number(2))+"' value='"+data.tList1[i].hc_hrcode+"' hidden='true'>";
                str +=data.tList1[i].hc_position+"/";
                str +="<input style='width:50px;' type='text' name='bs_approver"+(Number(i)+Number(2))+"' value='"+ data.tList1[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
             }
             console.log(str)
             $("#line").append(str);
          };
       };
         
/*          if (data.tList2 != "") {
            for ( var i in data.tList2) {
         var str2 = "";
               str2 +="<input type='text' name='ad_recode"+i+"' value='"+data.tList2[i].m_code+"' hidden='true'>";
               str2 += data.tList2[i].m_grade + "<br>";
               str2 += data.tList2[i].m_name;
            $("#refer"+i).html(str2);
            } */
         /* };  */
      
      //결재 제출하기
      $("#submit").click(function(){
    	    var checkect= document.getElementById("checkect");
 	    	 if(checkect.value=="" || checkect.value==null){
			   alert("기타를 입력해주세요.");
		    }else{

				var obj = $("#approvalinput").serialize();

						$.ajax({
							url : '/erp/rest/sales/approvalinput',
							type : 'post',
							data : obj,
							//dataType: 'json',
							success : function(data) {
								alert("기안문 제출이 완료되었습니다.");
								console.log(data);

								window.close();
							},
							error : function(error) {
								console.log(error);
							}
						});
					}
				});
</script>
</body>
</html>