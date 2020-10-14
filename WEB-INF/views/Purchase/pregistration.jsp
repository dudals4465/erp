<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
#center{
text-align: center;
}
input{
text-align: center;
}
#list{
width: 1140px;
border: 1px solid silver;
}
.tr, .th, .td{
border: 1px solid;
border-collapse:collapse;
border-spacing:0;
}
.select{
width: 160px;
height: 24px;
}
</style>
</head>
<body>
${msg}
	<div id="center">
		<br>
		 <span style="padding-left: 5px"><a href="#"
         onclick="window.open('/erp/Account/comPany','comlist','width=1350,height=500')"><button>거래처등록</button></a></span>
         <span><a href=# onclick="window.open('/erp/stock/setcategory','PopupWin','width=550,height=600')"><button>분류코드 추가</button></a></span>
         <span><a href=# onclick="window.open('/erp/stock/setitemcode','PopupWin','width=565,height=600')"><button>품목코드 추가</button></a></span>
         <span><a href="#" onclick="window.open('/erp/stock/searchitemcode','PopupWin','width=1550,height=600')"><button>품목코드 검색</button></a></span>
         <button type="button"id="stock">재고현황</button>
         <button type="button" id="Pinfo" style="padding-left: 5px;">구매조회</button>
         <button type="button" id="approval">결재요청</button>
     	<br>
     	<br>
      <div style="width:1150px; background-color:#3D6B9B; color:white; padding:1%;">구매관리</div>
					<select id="choice" style="height: 23px;">
						<option value="p_documentcode">구매번호</option>
						<option value="p_writer">담당자</option>
						<option value="p_day">구매일</option>
					</select>
					<input type="text" id="search" name="search" style="height: 18px;">
					<button id="searchbtn">검색</button>
		<form id="purchase">
         <div border="1" style="width:1175px; height:80px; padding-top:25px; background-color:#F8F7F7; text-align: center;">
				<table style="margin-left:188px; text-align: center;">
                 	 <tr>
                 	 	<th>구매번호&emsp;</th>
                    	<td><input type="text" name="p_documentcode" placeholder="자동생성" readonly>&emsp;</td>
                    	<th>제품번호&emsp;</th>
                     	<td><input type="text" name="p_productnum" id="p_productnum">&emsp;</td>
                     	<th>거래처&nbsp;</th>
                     	<td><input id="clcode" type="text" name="p_clcode">&nbsp;<button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></td>
                    </tr>
                    <tr>
                    	<th>담당자</th>
                    	<td><input type="text" name="p_writer" id="p_writer">&emsp;</td>
                     	<th>구매일</th>
                     	<td><input type="date" name="p_day" min="2000-01-01" max="2030-12-31" style="width: 159px;" id="p_day">&emsp;</td>
                  	</tr>
            	</table>
			</div>
            <table summary="Code page support in different versions of MS Windows."
               rules="groups" frame="hsides" border="1"  id="list" style="width: 1175px; background-color: #ECEBEA;">
               <colgroup align="center">
               </colgroup>
               <colgroup align="left">
               </colgroup>
               <colgroup span="2" align="center">
               </colgroup>
               <colgroup span="3" align="center">
               </colgroup>
               <thead valign="top">
                  <tr>
						<tr>
							<td><input type="checkbox" id="allCheck"></td>
                     		<th>상품명</th>
                     		<th>상품코드</th>
                     		<th>수량</th>
                     		<th>단가(원)</th>
                     		<th>합계(원)</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td><input type="checkbox" name="each_check" class="each"></td>
                     		<td><input type="text" name="p_name" class="p_name"></td>
                     		<!-- <td><input type="text" name="p_itcode"></td> -->
                     		<td class="it"></td>
                     		<td><input type="number" min="1" name="p_amount" class="p_amount"></td>
                     		<td><input class="unlit" type="text" name="p_unlit"></td>
                     		<td><input type="text" name="p_budget" class="p_budget"></td>
                    	</tr>
					</tbody>
				</table>
			<div style="float: left; padding-top: 10px">
				<button type="button" id="pDetail">상세보기</button>
				<button type="button" id="Pdelete">삭제</button>
				<button type="button" id="save">등록</button>
				<button type="button" class="addList">추가</button>
			</div>
         </form>
	</div>
	
	  <script type="text/javascript">
	  
	  $(document).on("keyup",".unlit",function(){
		 var cnt =$(this).parent().prev().children().val();
		 console.log(cnt);
		 var unlit = $(this).val();
		 var budget=cnt*unlit;
		 $(this).parent().next().children().val(budget);
	  });
	  
	  function setChildValue(data) {
		   console.log(data)
		   for(var i in data.aList){ 
		   var clcode=data.aList[i].cl_code;
		   }
		   
		   $("#clcode").val(clcode);
		};
		
	 $(document).ready(function(){
		 var select;
			$.ajax({
				url: "/erp/stock/getitemcode",
				type: "get",
				dataType: 'json',
				success: function(data){
					select=makeSelectBox(data);
					$(".it").html(select);
				},
				error: function(err){
					console.log(err);
				}
			})
			function makeSelectBox(arr){
				var arrStr="<select class='select' name='p_itcode' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
				if(arr.length==0){
					arrStr+="<option>품목코드를 먼저 작성해주세요</option>";
				}else{
					for(var i=0; i<arr.length; i++){
						arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>";
					}
				}
				arrStr+="</select>";
				return arrStr;
			}
			
		 $('.addList').click(function(){
			 $('#tbody').append('<tr><td><input type="checkbox" name="each_check" class="each"></td><td><input type="text" name="p_name" class="p_name"></td><td class="it"></td><td><input type="number" min="1" name="p_amount" class="p_amount"></td><td><input class="unlit" type="text" name="p_unlit"></td><td><input type="text" name="p_budget" class="p_budget"></td><td><input type="button" value="삭제" onclick="javascript:thisRowDel(this);"></td></tr>');
		
		var select;
		$.ajax({
			url: "/erp/stock/getitemcode",
			type: "get",
			dataType: "json",
			success: function(data){
				select=makeSelectBox(data);
				$(".it").html(select);
			},
			error: function(err){
				console.log(err);
			}
		})
		function makeSelectBox(arr){
			var arrStr="<select class='select' name='p_itcode' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
			if(arr.length==0){
				arrStr+="<option>품목코드를 먼저 작성해주세요</option>";
			}else{
				for(var i=0; i<arr.length; i++){
					arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>";
				}
			}
			arrStr+="</select>";
			return arrStr;
			}
		 });	
	 });
	 
	 function thisRowDel(row){
		   console.log(row);
		   let tr = row.parentNode.parentNode;
		   tr.parentNode.removeChild(tr);
		}
	 
      $(function() {
			$("#allCheck").click(function() {
				if ($("#allCheck").prop("checked")) {
					$("input[type=checkbox]").prop("checked", true);
				} else {
					$("input[type=checkbox]").prop("checked", false);
				}
			});
		}); 

      $("#save").click(function(){
 			 var obj = $("#purchase").serialize();
 	         console.log(obj);
 	         $.ajax({
 	            url: '/erp/rest/Purchrase/pregistration',
 	            type: 'post',
 	            data: obj,
 	            success: function(data){
 	               //consloe.log(data);
 	            $('input').val("");
 	            $("select").val("");
 	            alert("등록이 완료되었습니다.");
 	            },
 	            error: function(error){
 	            	console.log(error);
 	            }
 	         });
       });
      
       $('#Pinfo').click(function(){
    		$.ajax({
    			url: '/erp/rest/Purchase/pference',
    			type: 'get',
    			dataType: 'json',
    			success: function(data){
    				//console.log(data);
     				var str="";
     				str+="<tr class='tr'><td class='td'>선택</td><td class='td'>구매번호</td><td class='td'>제품번호</td><td>담당자</td><td class='td'>거래처</td><td class='td'>구매일</td></tr>";
    				for(var i in data.pList){
    	    			str+="<tr class='tr'><td class='td'><input type='radio' value="+data.pList[i].p_documentcode+" name='each_check' class='each_check'></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_documentcode+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_productnum+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_writer+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_clcode+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_day+"' readonly></td><tr>";
    				}
    				$('#list').html(str); 
    				$("#save").attr("style","visibility: hidden");
    				$(".addList").attr("style","visibility: hidden");
    			},
    			error: function(error){
    				console.log(error);
    			}
    		});
      });
 	  
 	  $("#pDetail").click(function(){
 		  console.log("여기들어와?");
           $("input[name=each_check]:checked").each(function(){
               var check = $(this).attr("value");
               console.log(check);
               
               if(check!=""){
               	window.open("/erp/Purchase/purchasedetail?check="+check,"purchasedetail", "width=1050, height=500, top=75, left=300");
               }
            });
 		});
       
      $('#searchbtn').click(function(){
			 var choice = $('#choice').val();
			 var search = $('#search').val();
			 console.log(choice);
			 console.log(search);
			 $.ajax({
				 url: '/erp/rest/Purchase/pfsearch',
				 type: 'post',
				 data: "choice="+choice+"&search="+search,
				 dataType: 'json',
				 success: function(data){
					 var str="";
	     				str+="<tr class='tr'><td class='td'>선택</td><td class='td'>구매번호</td><td class='td'>제품번호</td><td>담당자</td><td class='td'>거래처</td><td class='td'>구매일</td></tr>";
					 if(data.pList!=""){
						 for(var i in data.pList){
							 str+="<tr class='tr'><td class='td'><input type='radio' value="+data.pList[i].p_documentcode+" name='each_check' class='each_check'></td>";
				    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_documentcode+"' readonly></td>";
				    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_productnum+"' readonly></td>";
				    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_writer+"' readonly></td>";
				    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_clcode+"' readonly></td>";
				    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_day+"' readonly></td><tr>";
			    		}
			    			$('#list').html(str); 
					 }else{
						alert("데이터가 없습니다.");
					 }
				 },
				 error: function(error){
					 console.log(error);
				 }
			 });
      	});
      
		$('#Pdelete').click(function(){
			$("input[name=each_check]:checked").each(function(){
				var check= $(this).attr("value");
				console.log(check); 
			
			$.ajax({
				url: '/erp/rest/Purchase/pfdelete',
				type: 'post',
				data: {check:check},
				dataType: 'json',
				success: function(data){
					//console.log(data);
					var str="";
					if(data.pList==null){
						alert("이미 결재 요청된 데이터 입니다.");
					}else{
						alert("데이터가 삭제되었습니다.");
						str+="<tr class='tr'><td class='td'>선택</td><td class='td'>구매번호</td><td class='td'>제품번호</td><td>담당자</td><td class='td'>거래처</td><td class='td'>구매일</td></tr>";
    				for(var i in data.pList){
    					str+="<tr class='tr'><td class='td'><input type='radio' value="+data.pList[i].p_documentcode+" name='each_check' class='each_check'></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_documentcode+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_productnum+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_writer+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_clcode+"' readonly></td>";
		    			str+="<td class='td'><input type='text' value='"+data.pList[i].p_day+"' readonly></td><tr>";
    				}
    				$('#list').html(str); 
					}
				},
				error: function(error){
					console.log(error);
				}
			});
		}); 
	});
		
	$('#approval').click(function(){
		  $("input[name=each_check]:checked").each(function(){
		    var check= $(this).attr("value");
		        console.log(check);
		        	
		        $.ajax({
		        	url: '/erp/rest/Purchase/approvalcheck',
		        	type: 'post',
		        	data: {check:check},
		        	dataType: 'json',
		        	success: function(data){
		        		//console.log(data);
		        		if(data.pList==null){
		        			alert("이미 결재요청되었습니다.");
		        		}else{
		        		    window.open("/erp/Purchase/pprogramwrite?check="+check,"pprogramwrite", "width=1200, height=650, top=75 left=200");
		        		}
		        	},
		        	error: function(err){
		        		console.log(err);
		        	}
		        })		    		
		    });
		});
      
    $("#stock").click(function(){
		  $.ajax({
			  url:"/erp/rest/Purchase/getstocklist",
			  type: "get",
			  dataType: "json",
			  success: function(data){
				  console.log(data);
				  var str="";
				  str+="<tr class='tr' style='text-align: center;'><td class='td'>품목코드</td><td class='td'>상품명</td><td class='td'>재고량</td><td class='td'>단위</td><td class='td'>크기</td></tr>";
				  for(var i in data.sList){
				  	str+="<tr class='tr' style='text-align: center;'><td class='td'><input type='text' value='"+data.sList[i].it_code+"'readonly></td>";
					str+="<td class='td'><input type='text' value='"+data.sList[i].it_pname+"' readonly></td>";
				  	str+="<td class='td'><input type='text' value='"+data.sList[i].it_stock+"' readonly></td>";
				  	str+="<td class='td'><input type='text' value='"+data.sList[i].it_unit+"' readonly></td>";
				  	str+="<td class='td'><input type='text' value='"+data.sList[i].it_size+"' readonly></td><tr>";
				  }
				  $('#list').html(str);
	              $("#save").attr("style","visibility: hidden");
	              $(".addList").attr("style","visibility: hidden");
	              $("#pDetail").attr("style","visibility: hidden");
	              $("#Pdelete").attr("style","visibility: hidden");

			  },
			  error: function(err){
				  console.log(err);
			  }
		  })
	})
  	
   </script>
</body>
</html>