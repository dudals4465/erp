<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 휴가 상세 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
html, body {
   text-align: center;
}

#table, tr, th, td {
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
   border-style: none;
   text-align: center;
   font-size: medium;
   font-weight: bold;
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
      <h1 style="width: auto; background-color: #3D6B9B; color: white; padding: 1%;font-size: large;font-weight: bold;">휴가신청안</h1>
      <div style="height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table id="table" style="border-collapse: collapse;">
            <tr>
               <th>제목</th>
               <th colspan="4">${apholi.hap_docuname }
               </th>
            </tr>
            <tr>
               <th>--</th>
         		<th>신청인</th>
         		<th>${fromapprover}</th>
        		 <th>결재자</th>
         		<th>${toapprover}</th>
            </tr>
            <tr>
               <th>내용</th>
               <td colspan="4">
                  <div style="border: 1px solid #EAEAEA; background-color: white;">
                     <div>
                        <table style="border-collapse: collapse;">
                           <tr>
                              <th colspan="2">문서번호</th>
                              <th colspan="6"><input type="text" name="p_documentcode"
                                 class="draft" value="${apholi.hap_docuname }" readonly>

                           </tr>
                           <tr>
                           	  <th colspan="2">결재상태</th>
							  <th >신청일</th>
							  <th colspan="2">휴가시작일</th>
							  <th colspan="2">휴가종료일</th>
                           </tr>
                           	  <th colspan="2">${apholi.hap_status }</th>
							  <th >${apholi.hap_applydate }</th>
							  <th colspan="2">${apholi.hap_startday }</th>
							  <th colspan="2">${apholi.hap_endday }</th>
							<tr>
								<th colspan="7">사유</th>
							</tr><tr>
								<th colspan="8" style="height: 200px;">${apholi.hap_reason }</th>
							</tr>
                        </table>
                     </div>
                  </div>
               </td>
            </tr>
         </table>

   <c:if test="${apholi.hap_toapprover==hrCode}">
      <c:if test="${apholi.hap_status eq 1}">
         <input type='hidden' value='${apholi.hap_docunum}' name='docunum' id="docunum">
         <button id="ok" value="">승인</button> &nbsp;
         <button id='no'>거부</button>
      </c:if>
   </c:if>
       </div>

   <script>
   	var term = "";

      $(document).ready(function(){
 		 var startDay = new Date("${apholi.hap_startday}");
 		 var endDay = new Date("${apholi.hap_endday}");
 		 term = endDay - startDay;
 		 term = (term/86400000)+1;
      });

      $("button").click(function(){
         console.log(this.id);
         if(confirm("정말 확인하시겠습니까?")){
            regist(this.id);
         }else{
            alert("취소되었습니다.");
         }
      });

      function regist(yesno){
         $.ajax({
            url:"/erp/rest/hr/holidaystatus",
            dataType:"text",
            data:{yesno : yesno, docunum : $("#docunum").val(), term : term, hrcode : "${apholi.hap_fromapprover}"},
            method:"post",
            success : function(data){
               window.open("about:blank", "_self").close();
            }, error : function(err){
            	alert("알수없는 이유로 취소되었습니다.");
               console.log(err);
            }
         });
      }


   </script>
</body>
</html>
