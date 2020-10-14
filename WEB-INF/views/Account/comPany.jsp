<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<!-- <script src="js/jquery.serializeObject.js"></script> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

body, td, th, select, textarea {
	font-family: Nanum Gothic, Gulim, Arial, ms sans serif;
	font-size: 11px;
	color: #000;
}

.main {
	width: 50%;
	height: 50%;
	display: inline;
	float: left;
	overflow: auto:
}

#search {
	width: 50px;
}

#Info {
	text-align: center;
}
#maincontents{
border: 3px double #e1e1e1;
border-radius: 8px;
}
#mainhead{
border: 3px double #e1e1e1;
border-radius: 8px;
height: 485px;
text-align: center;
}

#Info{
width:100%;
}
.allinfo{
font-size: 20px;
}
</style>
</head>
<body>
	<div id="mainhead" class="main">
		<br>
		<!-- <form id="code"> -->
					<input type="text" id="code">
					<button type="button" id="codesearch">코드검색</button>
	                    <!-- </form> -->
	                    <button type="button" id="Alllist">리스트출력</button>
				        활성<input type="radio" name="use" value="1"> 
				        비활성<input type="radio" name="use" value="0"> 
	                    <!-- <button type="button" id="trens">사용안함</button> -->
		
			<table id="Info" class="table">
				<tbody id="Tbody">
					
				</tbody>
			</table>
	</div>
	<div id="maincontents" class="main">
		<form id="comInfo">
			<br>
			<table>
				<tbody>
				<tr><th><div class='input-group'><span class='input-group-addon'>거래처코드</span>
                <input type='text' name='cl_code' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>거래처명</span>
                <input type='text' name='cl_name' class='form-control'></div></th>
					
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon'>사업자번호</span>
                <input type='text' name='cl_comnum' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>대표자명</span>
                <input type='text' name='cl_ceo' class='form-control'></div></th>

					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon' style="width:94px;">담당자명</span>
                <input type='text' name='cl_employee' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>전화번호</span>
                <input type='text' name='cl_phone' class='form-control'></div></th>
		
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon'>핸드폰번호</span>
                <input type='text' name='cl_phone2' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>팩스번호</span>
                <input type='text' name='cl_fax' class='form-control'></div></th>
			
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon' style="width:94px;">이메일</span>
                <input type='text' name='cl_email' class='form-control' style="width:215px;"></div></th>
                <th><div class='input-group'><span class='input-group-addon' style="width:80px;">유형</span>
                <select name='cl_kind3' class='form-control'>
                <option value="">--</option>
				<option value="매출">매출</option>
				<option value="매입">매입</option>
                </select></div></th>

		
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon' style="width:94px;">우편번호</span>
                <input type='text' name='cl_addrnum' class='form-control' style="width:215px;"></div></th>
				

					</tr>


					<tr>
				<th colspan="2"><div class='input-group'><span class='input-group-addon' style="width:94px;">주소</span>
                <input type='text' name='cl_addr' class='form-control' style="width:507px;"></div></th>
						
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon' style="width:94px;">업태</span>
                <input type='text' name='cl_kind' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>&nbsp;&nbsp;종목&nbsp;&nbsp;</span>
                <input type='text' name='cl_kind2' class='form-control'></div></th>
					
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon' style="width:94px;">거래은행</span>
                <input type='text' name='cl_bank' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>&nbsp;예금주&nbsp;</span>
                <input type='text' name='cl_bankholder' class='form-control'></div></th>
						
					</tr>
					<tr>
				<th><div class='input-group'><span class='input-group-addon' style="width:94px;">계좌번호</span>
                <input type='text' name='cl_banknum' class='form-control' style="width:215px;"></div></th>
				<th><div class='input-group'><span class='input-group-addon'>종사업장번호</span>
                <input type='text' name='cl_comnum2' class='form-control' style="width:185px;"></div></th>
					</tr>

					<tr>
				<th colspan="2"><div class='input-group'><span class='input-group-addon' style="width:94px;">메모</span>
                <textarea name='cl_memo' rows="3" cols="" class='form-control' style="width:509px;"></textarea></div></th>
                
						<!-- <th class="th1">메모</th>
						<td><textarea name="cl_memo"
								style="width: 380px; height: 75px; background: #FFFFFF; -ms-ime-mode: active;"></textarea></td> -->
					
					</tr>
				</tbody>

			</table>
			<button type="button" id="insertcomlist">저장</button>
		</form>
	</div>
</body>
<script type="text/javascript">
	 $("#Alllist").click(function(){
   var use = "";
$("input[name='use']:checked").each(function() {
    use=($(this).attr('value'));
    
	});
		 
		 console.log(use);
		 if(use==null){
			 alert("사용여부를 체크해주세요");
		 }else{
			 
		$.ajax({
			url : '/erp/rest/Account/serchcomlist',
			type : 'post',
			data : {use:use},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				var List="";
				if(use==1){
					List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
    				for ( var i in data.aList) {
    					List+="<tr class='success'>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
    					List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.aList[i].cl_code+")'>비활성화</button></td>"; 
    					List+="</tr>";
    				}
					
				}else{
					
					List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
    				for ( var i in data.aList) {
    					List+="<tr class='success'>";
    					List+="<input id="+data.aList[i].cl_code+" type='text' name='reportChkBxRow' value="+data.aList[i].cl_code+" hidden='true'>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
    					List+="<td class='allinfo'><button onclick='trensCom("+1+","+data.aList[i].cl_code+")'>활성화</button></td>";
    					List+="</tr>";
    				}
				}
                 $("#Tbody").html(List);
                 $("input").html("");
			},
			error : function(error) {
				console.log(error);
			}
		});
		 }

	});

	$("#codesearch").click(function() {
		 var use = "";
		 $("input[name='use']:checked").each(function() {
		     use=($(this).attr('value'));
		     
		 	});
		 		 
		 		 console.log(use);
		 		 
		var code = $("#code").val();
		console.log(code);
		 if(use==null){
			 alert("사용여부를 체크해주세요");
		 }else{
						$.ajax({
									url : '/erp/rest/Account/searchcode',
									type : 'post',
									data : {code:code,use:use},
									dataType : 'json',
									success : function(data) {
									
										console.log(data);
										var List="";
										if(use==1){
											List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
						    				for ( var i in data.aList) {
						    					List+="<tr class='success'>";
						    					List+="<input id="+data.aList[i].cl_code+" type='text' name='reportChkBxRow' value="+data.aList[i].cl_code+" hidden='true'>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
						    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
						    					List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.aList[i].cl_code+")'>비활성화</button></td>";
						    					List+="</tr>";
						    				}
											
										}else{
											
											List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
						    				for ( var i in data.aList) {
						    					List+="<tr class='success'>";
						    					List+="<input id="+data.aList[i].cl_code+" type='text' name='reportChkBxRow' value="+data.aList[i].cl_code+" hidden='true'>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
						    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
						    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
						    					List+="<td class='allinfo'><button onclick='trensCom("+1+","+data.aList[i].cl_code+")'>활성화</button></td>";
						    					List+="</tr>";
						    				}
										}
						                 $("#Tbody").html(List);
									 },
									error : function(error) {
										console.log(error);
									}
								});
		 }
					});  
	
	$("#insertcomlist").click(function() {
						var obj = $("#comInfo").serialize();
						$.ajax({
									url : '/erp/rest/Account/insertcomlist',
									type : 'post',
									data : obj,
									dataType : 'json',
									success : function(data) {
										console.log(data);
										var List="";
										List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
					    				for ( var i in data.aList) {
					    					List+="<tr class='success'>";
					    					List+="<input id="+data.aList[i].cl_code+" type='text' name='reportChkBxRow' value="+data.aList[i].cl_code+" hidden='true'>";
					    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
					    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
					    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
					    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
					    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
					    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
					    					List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.aList[i].cl_code+")'>비활성화</button></td>";
					    					List+="</tr>";
					    				}
						                 $("#Tbody").html(List);
						                 $(".form-control").val("");
									},
									error : function(error) {
										console.log(error);
									}
								});
					});
	
	function trensCom(use,code){
		
		console.log(code);
		
	     		$.ajax({
	     			url:'/erp/rest/Account/trensCom',
	     			type:'post',
	     			traditional : true,
	     			data:'CODE='+code+'&USE='+use,
	     			datatype:'json',
	     			success:function(data){
	     				console.log(data);
	     				var size=data.aList.length;
	     				console.log(size);
	     				var List="";
	     				if(size>=1 && data.aList[0].cl_status=='0'){
	     					
	    				List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
	    				for ( var i in data.aList) {
	    					List+="<tr class='success'>";
	    					List+="<input id="+data.aList[i].cl_code+" type='text' name='reportChkBxRow' value="+data.aList[i].cl_code+" hidden='true'>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
	    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
	    					List+="<td class='allinfo'><button onclick='trensCom("+1+","+data.aList[i].cl_code+")'>활성화</button></td>";
	    					List+="</tr>";
	    				}
	     				}else{
	     					
	    				List+="<tr><th class='allinfo'>코드</th><th class='allinfo'>거래처명</th><th class='allinfo'>사업자(주민)번호</th><th class='allinfo'>대표자명</th><th class='allinfo'>업태</th><th class='allinfo'>유형</th><th class='allinfo'>사용여부</th></tr>";
	    				for ( var i in data.aList) {
	    					List+="<tr class='success'>";
	    					List+="<input id="+data.aList[i].cl_code+" type='text' name='reportChkBxRow' value="+data.aList[i].cl_code+" hidden='true'>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_code + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_name + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_comnum + "</td>";
	    				    List+="<td class='allinfo'>" + data.aList[i].cl_ceo + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_kind + "</td>";
	    					List+="<td class='allinfo'>" + data.aList[i].cl_kind3 + "</td>";
	    					List+="<td class='allinfo'><button onclick='trensCom("+0+","+data.aList[i].cl_code+")'>비활성화</button></td>";
	    					List+="</tr>";
	    				}
	     				}
	                     $("#Tbody").html(List);
		                 
	     			},
	     			error:function(error){
	     				console.log(error);
	     			}
	     			
	     		});
	     	
	};
	
</script>
</html>