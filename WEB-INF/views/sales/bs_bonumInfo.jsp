<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수주번호 검색창</title>
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
</head>
<body>
<div id="mainhead" class="main">
		<br>
		<!-- <form id="code"> -->
					<input type="text" id="code">
					<button type="button" id="codesearch">수주번호검색</button>
	                    <!-- </form> -->
	                    <!-- <button type="button" id="trens">사용안함</button> -->
		
			<table id="Info" class="table">
				<tbody id="Tbody">
					
				</tbody>
			</table>
	</div>
</body>
<script>
$(document).ready(function(){
				 
			$.ajax({
				url : '/erp/rest/sales/serchbonumlist',
				type : 'post',
				dataType : 'json',
				success : function(data) {
					console.log(data);
					var List="";
						List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>거래처코드</th><th class='allinfo'>회사코드</th><th class='allinfo'>담당자</th><th class='allinfo'>제품명</th><th class='allinfo'>사용여부</th></tr>";
	    				for ( var i in data.sList) {
	    					List+="<tr class='success'>";
	    					List+="<input id="+data.sList[i].bo_num+" type='text' name='reportChkBxRow' value="+data.sList[i].bo_num+" hidden='true'>";
	    					List+="<td class='allinfo'>" + data.sList[i].bo_num + "</td>";
	    					List+="<td class='allinfo'>" + data.sList[i].bo_clcode + "</td>";
	    					List+="<td class='allinfo'>" + data.sList[i].bo_ccode + "</td>";
	    				    List+="<td class='allinfo'>" + data.sList[i].bo_manager + "</td>";
	    					List+="<td class='allinfo'>" + data.sList[i].bo_pronum + "</td>";
	    					List+="<td class='allinfo'><button onclick='useCom(\""+data.sList[i].bo_num+"\")'>사용</button></td>";
	    					List+="</tr>";
	    				}
	                 $("#Tbody").html(List);
				},
				error : function(error) {
					console.log(error);
				}
			});

		});
		
		function useCom(code){
	console.log(code);
			$.ajax({
				url : '/erp/rest/sales/searchcode',
				type : 'post',
				data : {code:code},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					opener.setChildValue2(data);
					window.close();
				},
				error:function(error){
					console.log(error);
				}
				
			});
		}
		
		$("#codesearch").click(function(){
			var code = $("#code").val();
			$.ajax({
				url : '/erp/rest/sales/searchcode',
				type : 'post',
				data : {code:code},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					var List="";
					List+="<tr><th class='allinfo'>수주번호</th><th class='allinfo'>거래처코드</th><th class='allinfo'>회사코드</th><th class='allinfo'>담당자</th><th class='allinfo'>제품명</th><th class='allinfo'>사용여부</th></tr>";
    				for ( var i in data.sList) {
    					List+="<tr class='success'>";
    					List+="<input id="+data.sList[i].bo_num+" type='text' name='reportChkBxRow' value="+data.sList[i].bo_num+" hidden='true'>";
    					List+="<td class='allinfo'>" + data.sList[i].bo_num + "</td>";
    					List+="<td class='allinfo'>" + data.sList[i].bo_clcode + "</td>";
    					List+="<td class='allinfo'>" + data.sList[i].bo_ccode + "</td>";
    				    List+="<td class='allinfo'>" + data.sList[i].bo_manager + "</td>";
    					List+="<td class='allinfo'>" + data.sList[i].bo_pronum + "</td>";
    					List+="<td class='allinfo'><button onclick='useCom(\""+data.sList[i].bo_num+"\")'>사용</button></td>";
    					List+="</tr>";
    				}
                 $("#Tbody").html(List);
				},
				error:function(error){
					console.log(error);
				}
				
			});
		});
		</script>
</html>