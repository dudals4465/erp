<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 결재안</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
html,body{
text-align: center;
}
#pprogramwrite{
margin-top: 50px;
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
text-align: center;
}
.txt1{
width: 350px;
height: 20px;
text-align: center;
}
.select{
width: 150px;
height: 25px;
}   
.draft{
width: 500px; 
height: 20px; 
text-align: center;"
}
.draft2{
width: 600px; 
text-align: center;
}
.draft3{
width: 230px;
text-align: center;
}
#ect{
resize: none;
}
.aaa{
text-align: center;
}

</style>
</head>
<body>
   <div style="width: auto; background-color: white; padding: 1%;">
      <button type="button" id="approvalLine">결재라인 불러오기</button>
   </div>
   <form id="pa">
   <div style="width: 1150px; background-color: #3D6B9B; color: white; padding: 1%;">기안문 작성</div>
   <div style="width:1175px; height: auto; padding-top: 5px; background-color: #F8F7F7;">
         <table id="table">
            <tr>
               <th>일자</th>
               <th><input type="text" name="p_date" class="draft2" placeholder="자동생성" readonly></tr>
            <tr>
               <th>제목</th>
               <th><input type="text" name="p_title" class="draft2" id="title"></th>
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
                              <th colspan="9">구매 계획서</th>
                              <td><input type="text" name="p_documentcode" class="txt" value="${ps.p_documentcode}" readonly></td>
                           </tr>
                           <tr>
                              <th colspan="5">거래처</th>
                              <th><input type="text" name="p_clcode" class="txt"  value="${ps.p_clcode}" readonly></th>
                              <th>구매일</th>
                              <th><input type="text" name="p_day" class="txt" value="${ps.p_day}" readonly></th>
                              <th>제품일련번호</th>
                              <th><input type="text" name="p_productnum" class="txt" value="${ps.p_productnum}" readonly></th>
                           </tr>
                           <tr>
                              <th colspan="5">품명</th>
                              <th colspan="1">폼목코드</th>
                              <th colspan="1">수량</th>
                              <th colspan="1">단가(원)</th>
                              <th colspan="2">합계(원)</th>
                           </tr>
                           <tbody id=tbody></tbody>
                           <tr>
                              <th>기타</th>
                              <th colspan="9"><textarea rows="10" cols="125" name="p_etc" id="ect"></textarea></th>
                           </tr>
                    </table>
               </td>
            </tr>
         </table>
         <div style="margin-top: 5px;">
         	<input type="button" id="submit" value="결재	"> 
         </div>
      </div>
   </form>
   <script>
   $(document).ready(function(){
	      $.ajax({
	         url:'/erp/rest/Purchase/getMyInfo',
	         type:'get',
	         datatype:'json',
	         success:function(data){
	            console.log(data);
	            var str = "";
	            for ( var i in data.sList) {
	                 str +="<input type='text' name='p_apcode"+(Number(i)+Number(1))+"' value='"+data.sList[i].hc_hrcode+"' hidden='true' readonly>";
	               str +=data.sList[i].hc_position+"/";
	               str +="<input style='width:50px;' type='text' name='p_approver"+(Number(i)+Number(1))+"' value='"+ data.sList[i].m_name+"' readonly>&nbsp;&nbsp;||&nbsp;&nbsp;";
	            }
	            console.log(str)
	            $("#line").html(str);
	         
	         },
	         error:function(error){
	            console.log(error);
	         }
	      });
	       
	    });
   
    	var pList = ${pList};
    	console.log(pList);
   		var str="";
    	for(var i in pList){
			str+="<tr><td colspan='5'><input type='text' class='aaa' name='p_name' value='"+pList[i].p_name+"' readonly></td>";
			str+="<td colspan='1'><input type='text' class='aaa' name='p_itcode' value='"+pList[i].p_itcode+"' readonly></td>";
			str+="<td colspan='1'><input type='text' class='aaa'  name='p_amount' value='"+pList[i].p_amount+"' readonly></td>";
			str+="<td colspan='1'><input type='text' class='aaa' name='p_unlit' value='"+pList[i].p_unlit+"' readonly></td>";
			str+="<td colspan='2'><input type='text' class='txt' name='p_budget' value='"+pList[i].p_budget+"' readonly></td></tr>";
   		};
    	$('#tbody').html(str);
    	
    	$("#approvalLine").click(function() {
    	      window.open('/erp/Account/approvalLine', 'approvalLine', 'width=1400,height=700');
    	   });
    		
    	function setChildValue(data) {
    		console.log(data);
    		if (data.tList1 != "") {
    		var str = "";
    			for ( var i in data.tList1) {
    		        str +="<input type='text' name='p_apcode"+(Number(i)+Number(2))+"' value='"+data.tList1[i].hc_hrcode+"' hidden='true'>";
    				str +=data.tList1[i].hc_position+"/";
    				str +="<input style='width:50px;' type='text' name='p_approver"+(Number(i)+Number(2))+"' value='"+ data.tList1[i].m_name+"'>&nbsp;&nbsp;||&nbsp;&nbsp;";
    			}
    			console.log(str)
    			$("#line").append(str);
    		};
    	};
    	   
      	    $('#submit').click(function(){
      	       var title= document.getElementById("title");
      	    	 if(title.value=="" || title.value==null){
				   alert("제목을 입력해주세요.");
			   }else{
				   var obj = $('#pa').serialize();
	    		   $.ajax({
	    			   url:'/erp/rest/Purchase/purchaseApproval',
	    			   type:'post',
	    			   data: obj,
	    			   success: function(data){
	    				   alert("결재 요청 완료");
	    				   //console.log(data);
	    				   window.close();
	    			   }, 
	    			   error: function(error){
	    				   console.log(error);
	    				   alert("결재 요청이 실패하였습니다.");
	    			   } 
	    		   })
			   }
    	   });    
    	
   </script>
</body>
</html>