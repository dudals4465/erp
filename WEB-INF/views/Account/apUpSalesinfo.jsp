<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가올린 매입결제상세정보</title>
<link href="/erp/img/favicon.png" rel="icon" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
      <div
         style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;">매입전표 
         상세보기</div>
      <div
         style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table>
            
            <tr>
               <th>결재자</th>
               <th id="line">
               <input type="hidden" value="${ad.rs_apcode0}" id="" name="code"> 
               <input type="hidden" value="${ad.rs_apcode1}" id="" name="code"> 
               <input type="hidden" value="${ad.rs_apcode2}" id="" name="code">
               </th>
            </tr>
            <tr>
               <th>내용</th>
               <td>
                  <div style="border: 1px solid #EAEAEA; background-color: white;">
                     <div>
                        <table>
                           <tr>
                              <th colspan="2">담당자</th>
                              <th colspan="2"><input type="text" name="s_employee"
                                 class="txt" value="${ad.rs_apname0}" readonly></th>
                              <th colspan="2">문서번호</th>
                              <th colspan="2"><input type="text" name="s_num"
                                 class="txt" value="${ad.rs_num}" readonly></th>

                           </tr>
                           <tr>
                              <th colspan="2">사업자번호</th>
                              <th colspan="2"><input type="text" name="s_comnum"
                                 class="txt" value="${ad.rs_comnum}" readonly></th>
                              <th colspan="2">거래처코드</th>
                              <th colspan="2"><input type="text" name="s_clcode"
                                 class="txt" value="${ad.rs_clcode}" readonly></th>
                           </tr>
                           <tr>
                              <th colspan="2">종류</th>
                              <td colspan="2"><input type="text" name="j_group"
                                 class="draft3" value="${ad.rs_kind}" readonly></td>
                              <th colspan="2">거래처명</th>
                              <td colspan="2"><input type="text" name="s_company"
                                 class="draft3" value="${ad.rs_company}" readonly></td>

                           </tr>
                           <tbody id="tbody">
                           </tbody>
                           <tr>
                           <th>기타</th><td colspan="6">${ad.rs_reason}</td>
                           </tr>
                        </table>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
      </div>
       
   </form>
   <script>
      //레디 펑션 줘서 결재자 info 불러오기
      $(document).ready(
                  function() {
                     arr = new Array();
                     var cnt = $("input[name='code']").length;

                     $("input[name='code']").each(function() {
                        arr.push($(this).attr('value'));
                     });

                     $.ajax({
                              url : '/erp/rest/Account/getApprinfo',
                              type : 'post',
                              traditional : true,
                              data : 'ARR=' + arr + '&CNT=' + cnt,
                              success : function(data) {
                                 console.log(data);
                                 var str = "";
                                 for ( var i in data.aList) {
                                    str += "<input type='text' name='rs_apcode"+i+"' value='"+data.aList[i].hc_hrcode+"' hidden='true'>";
                                    str += data.aList[i].hc_position
                                          + "/";
                                    str += "<input style='width:50px;' type='text' readonly name='rs_apname"+i+"' value='"+ data.aList[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
                                 }
                                 console.log(str)
                                 $("#line").html(str);

                              },
                              error : function(error) {
                                 console.log(error);
                              }
                           });
                  });
      var aList = ${aList}
      console.log(aList);
      
      str="";
      str+="<tr><th>품목</th><th>수량</th><th>단가</th><th>공급가액</th><th>부가새액</th><th>총합계</th><th>메모</th></tr>";
      for(var i in aList){
    	 str+="<tr><td>"+aList[i].rs_pkind+"</td>"; 
    	 str+="<td>"+aList[i].rs_cnt+"</td>"; 
    	 str+="<td>"+aList[i].rs_price+"</td>"; 
    	 str+="<td>"+aList[i].rs_price2+"</td>"; 
    	 str+="<td>"+aList[i].rs_tax+"</td>"; 
    	 str+="<td>"+aList[i].rs_total+"</td>"; 
    	 str+="<td>"+aList[i].rs_memo+"</td></tr>"; 
      }
      $("#tbody").html(str);
      

</script> 
</body>
</html>