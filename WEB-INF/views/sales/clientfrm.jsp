<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처등록</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/jquery.serializeObject.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style>
<style>body, td, th, select, textarea {
   /* font-family: Nanum Gothic, Gulim, Arial, ms sans serif; */
   font-size: 11px;
   color: #000;
}

.main {
   width: 50%;
   height: 50%;
   display: inline;
   float: left;
   overflow: auto;
}

#search {
   width: 50px;
}

#Info {
   text-align: center;
}
#mainhead{
   margin-top:40px;

}
#maincontents{
   background-color:#F8F7F7;
}
</style>
</head>
<body>
   <div id="mainhead" class="main">
      <br>
      <form id="code">
               <input type="text" name="cl_code">
               <button type="button" id="codesearch">코드검색</button>
      </form>
      <br>
           <button type="button" id="Alllist">전체리스트</button>
           <button type="button" id="delete">삭제</button>
      
         <table id="Info">
            <tbody id="Tbody"> 
            
            </tbody>
         </table>
   </div>
   <div style="width:auto; background-color:#FFB2D9;  color:white; padding:1%;">거래처 등록양식</div>
   <div id="maincontents" class="main">
      <form id="comInfo" style="margin-left:20px;">
         <br>
         <table width="580px">
            <tbody>
               <tr>
                  <th class="th1">거래처코드</th>
                  <th class="th2"><input type="text" name="cl_code" class="noline00"></th>
                     <!-- style="width: 45px; background: #FFFFFF;" -->
                  <th class="th3">회사코드</th>
                  <th class="th4"><input type="text" name="cl_ccode" class="noline00"></th>
                     <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;" -->
               </tr>
               <tr>
                  <th class="th3">거래처명</th>
                  <th class="th4"><input type="text" name="cl_name" class="noline00"></th>
                     <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;" -->
                  <th class="th1">사업자번호</th>
                  <th class="th2"><input type="text" autocomplete="off" name="cl_comnum" class="nolineEx"></td>
               </tr>
               <tr>
                  <th class="th3">종사장번호</th>
                  <th class="th4"><input type="text" name="cl_comnum2" class="noline00"></th>
                  <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;" -->
                    <th class="th3">대표자명</th>
                  <th class="th4"><input type="text" name="cl_ceo" class="noline00"></th>
                  <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;" -->
               </tr>
               <tr>
                  <th class="th1">담당자명</th>
                  <th class="th2"><input type="text" name="cl_employee" class="noline00"></th>
                     <!--style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;"-->
                  <th class="th3">회사 전화번호</th>
                  <th class="th4"><input type="text" name="cl_phone" class="noline00"></th>
                     <!-- style="width: 145px; background: #FFFFFF;"-->
               </tr>
               <tr>
                  <th class="th1">휴대번호</th>
                  <th class="th2"><input type="text" name="cl_phone2" class="noline00"></th>
                     <!--style="width: 145px; background: #FFFFFF;" -->
                  <th class="th3">팩스번호</th>
                  <th class="th4"><input type="text" name="cl_fax" class="noline00"></th>
                     <!--style="width: 145px; background: #FFFFFF;" value=""-->
               </tr>
               <tr>
                  <th class="th3">email</th>
                  <th class="th4"><input type="text" autocomplete="off" name="cl_email" class="noline00"></th>
                     <!-- style="ime-mode: inactive; width: 145px; background: #FFFFFF;" value="" -->
               </tr>
               <tr>
                  <th class="th1">주소</th>
                  <th colspan="3"><input type="text" name="cl_addr" class="noline00" style="width: 450px;><br>
                     <!--style="width: 380px; background: #FFFFFF; -ms-ime-mode: active;" -->
                  </th>
               </tr>
               <tr>
                  <th class="th1">업태</th>
                  <th class="th2"><input type="text" name="cl_kind" class="noline00"></th>
                     <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;" -->
                  <th class="th3">종목</th>
                  <th class="th4"><input type="text" name="cl_kind2" class="noline00"></th>
                     <!--style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;"  -->
               </tr>
               <tr>
                  <th class="th1">거래은행</th>
                  <th class="th2"><input type="text" name="cl_bank" class="noline00"></th>
                     <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;"  -->
                  <th class="th3">예금주</th>
                  <th class="th4"><input type="text" name="cl_bankholder" class="noline00"></th>
                     <!-- style="width: 145px; background: #FFFFFF; -ms-ime-mode: active;" -->
               </tr>
               <tr>
                  <th class="th1">계좌번호</th>
                  <th><input type="text" name="cl_banknum" class="noline00"></th> <!--style="width: 145px; background: #FFFFFF;" -->
                  <th class="th1" >유형</th>
                  <th class="th2" style="padding-left: 10px;">
                    <select name="cl_kind3" class="select1"> <!-- style="width: 60px;"-->
                        <option value="">--</option>
                        <option value="매출">매출</option>
                        <option value="매입">매입</option>
                    </select>                 
                  </th>
               </tr>
               <tr>
                  <th class="th1">메모</th>
                  <th colspan="3"><textarea name="cl_memo" style="width: 450px; height: 75px; background: #FFFFFF; 
                  -ms-ime-mode: active;"></textarea></th>
               </tr>
            </tbody>
         </table>
         <button type="button" id="insertcomlist">저장</button>
      </form>
   </div>

</body>
<script type="text/javascript">
   
    $("#Alllist").click(function(){
      $.ajax({
         url : 'rest/serchcomlist',
         type : 'get',
         contentType : 'application/json; charset=UTF-8',
         dataType : 'json',
         success : function(data) {
            console.log(data);
            var List="";
            List+="<tr><th><input name='Allcheck' type='checkbox'></th><th>코드&nbsp;&nbsp;</th><th>거래처명&nbsp;&nbsp;</th><th>사업자(주민)번호&nbsp;&nbsp;</th><th>대표자명&nbsp;&nbsp;</th><th>업태&nbsp;&nbsp;</th><th>유형&nbsp;&nbsp;</th></tr>";
            for ( var i in data.aList) {
               List+="<tr>";
               List+="<td><input type='checkbox' name='reportChkBxRow' value="+data.aList[i].cl_code+"></td>";
               List+="<td>" + data.aList[i].cl_code + "</td>";
               List+="<td>" + data.aList[i].cl_name + "</td>";
               List+="<td>" + data.aList[i].cl_comnum + "</td>";
               List+="<td>" + data.aList[i].cl_ceo + "</td>";
               List+="<td>" + data.aList[i].cl_kind + "</td>";
               List+="<td>" + data.aList[i].cl_kind3 + "</td>";
               List+="</tr>";
            }
                 $("#Tbody").html(List);
                 $("input").html("");
         },
         error : function(error) {
            console.log(error);
         }
      });

   });

   $("#codesearch").click(function() {
      var obj = $("#code").serializeObject();
      var json = JSON.stringify(obj);
      console.log(json);
                  $.ajax({
                           url : 'rest/searchcode',
                           type : 'post',
                           contentType : 'application/json; charset=UTF-8',
                           data : json,
                           dataType : 'json',
                           success : function(data) {
                           
                              console.log(data);
                              var List="";
                              List+="<tr><th><input type='checkbox'></th><th>코드&nbsp;&nbsp;</th><th>거래처명&nbsp;&nbsp;</th><th>사업자(주민)번호&nbsp;&nbsp;</th><th>대표자명&nbsp;&nbsp;</th><th>업태&nbsp;&nbsp;</th><th>유형&nbsp;&nbsp;</th></tr>";
                              for ( var i in data.aList) {
                                 List+="<tr>";
                                 List+="<td><input type='checkbox' name='reportChkBxRow' value="+data.aList[i].cl_code+"></td>";
                                 List+="<td>" + data.aList[i].cl_code + "</td>";
                                 List+="<td>" + data.aList[i].cl_name + "</td>";
                                 List+="<td>" + data.aList[i].cl_comnum + "</td>";
                                  List+="<td>" + data.aList[i].cl_ceo + "</td>";
                                 List+="<td>" + data.aList[i].cl_kind + "</td>";
                                 List+="<td>" + data.aList[i].cl_kind3 + "</td>";
                                 List+="</tr>";
                              }
                                   $("#Tbody").html(List);
                            },
                           error : function(error) {
                              console.log(error);
                           }
                        });
               });  
   
   $("#insertcomlist").click(function() {
                  var obj = $("#comInfo").serializeObject();
                  //var json = JSON.stringify(obj);
                  //console.log(json)
                  $.ajax({
                           url : 'rest/insertcomlist',
                           type : 'post',
                           //contentType : 'application/json; charset=UTF-8',
                           data : obj,
                           dataType : 'json',
                           success : function(data) {
                              console.log(data);
                              var List="";
                              List+="<tr><th><input type='checkbox'></th><th>코드&nbsp;&nbsp;</th><th>거래처명&nbsp;&nbsp;</th><th>사업자(주민)번호&nbsp;&nbsp;</th><th>대표자명&nbsp;&nbsp;</th><th>업태&nbsp;&nbsp;</th><th>유형&nbsp;&nbsp;</th></tr>";
                              for ( var i in data.aList) {
                                 List+="<tr>";
                                 List+="<td><input  type='checkbox' name='reportChkBxRow' value="+data.aList[i].cl_code+"></td>";
                                 List+="<td>" + data.aList[i].cl_code + "</td>";
                                 List+="<td>" + data.aList[i].cl_name + "</td>";
                                 List+="<td>" + data.aList[i].cl_comnum + "</td>";
                                  List+="<td>" + data.aList[i].cl_ceo + "</td>";
                                 List+="<td>" + data.aList[i].cl_kind + "</td>";
                                 List+="<td>" + data.aList[i].cl_kind3 + "</td>";
                                 List+="</tr>";
                              }
                                   $("#Tbody").html(List);
                                   $("input").html("");
                           },
                           error : function(error) {
                              console.log(error);
                           }
                        });
               });
   
   $("#delete").click(function(){
       var cnt = $("input[name='reportChkBxRow']:checked").length;
        var arr = new Array();
           $("input[name='reportChkBxRow']:checked").each(function() {
               arr.push($(this).attr('value'));
               
              });
           if(cnt==0){
              alert("선택된 내용이 없습니다");
           }else{
      //var json = JSON.stringify(arr);
              $.ajax({
                 url:'rest/deleteCom',
                 type:'post',
                 traditional : true,
                 //contentType : 'application/json; charset=UTF-8',
                 data:'ARR='+arr+'&CNT='+cnt,
                 datatype:'json',
                 success:function(data){
                    console.log(data);
                    var List="";
                  List+="<tr><th><input type='checkbox'></th><th>코드&nbsp;&nbsp;</th><th>거래처명&nbsp;&nbsp;</th><th>사업자(주민)번호&nbsp;&nbsp;</th><th>대표자명&nbsp;&nbsp;</th><th>업태&nbsp;&nbsp;</th><th>유형&nbsp;&nbsp;</th></tr>";
                  for ( var i in data.aList) {
                     List+="<tr>";
                     List+="<td><input  type='checkbox' name='reportChkBxRow' value="+data.aList[i].cl_code+"></td>";
                     List+="<td>" + data.aList[i].cl_code + "</td>";
                     List+="<td>" + data.aList[i].cl_name + "</td>";
                     List+="<td>" + data.aList[i].cl_comnum + "</td>";
                      List+="<td>" + data.aList[i].cl_ceo + "</td>";
                     List+="<td>" + data.aList[i].cl_kind + "</td>";
                     List+="<td>" + data.aList[i].cl_kind3 + "</td>";
                     List+="</tr>";
                  }
                       $("#Tbody").html(List);
                       $("input").html("");
                 },
                 error:function(error){
                    console.log(error);
                 }
                 
              });
           }
           console.log(arr);
           console.log(cnt);
           
   });
   
</script>
</html>