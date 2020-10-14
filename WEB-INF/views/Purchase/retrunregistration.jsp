<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반품관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
#aaa{
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
.select2{
width: 165px;
height: 23px;
}
</style>
</head>
<body>
	<div id="aaa">
	<br>
            <button id="Wearing">입고현황</button>
            <button id="rInfo">반품조회</button>
      <br><br>
      <div style="width: 1150px; background-color: #3D6B9B; color: white; padding: 1%;">반품관리</div>
               <select id="choice" style="height: 23px;">
                  <option value="r_documentcode">반품번호</option>
                  <option value="r_ieseqnum">입고번호</option>
                  <option value="r_writer">담당자</option>
                  <option value="r_date">반품일</option>
               </select>
               <input type="text" id="search" name="search" style="height: 18px">
               <button id="searchbtn">검색</button>
      <form id="o_return">
      <div style="height: 80px; padding-top: 25px; background-color: #F8F7F7; width:1175px;">
            <div>
           <table style="margin-left:188px; text-align: center;">
                     <tr>
                       <th>반품번호&emsp;</th>
                       <td><input type="text" name="r_documentcode" placeholder="자동생성" readonly>&emsp;</td>
                       <th>입고번호&emsp;</th>
                       <td id="ie"></td>
                       <th>거래처&nbsp;</th>
                       <td><input id="clcode" type="text" name="r_clcode">&nbsp;<button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></td>
                      </tr>
                      
                      <tr>
                       <th>담당자</th>
                       <td><input type="text" name="r_writer" id="writer">&emsp;</td>                 
                       <th>반품일</th>
                       <td><input type="date" name="r_date" min="2000-01-01" max="2030-12-31" style="width: 159px;">&emsp;</td>
                     </tr>
               </table>
            </div>
         </div>
         <div style="width: 1175px; overflow: auto;">
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
                     <th><input type="checkbox" id="allCheck"></th>
                           <th>상품명</th>
                           <th>상품코드</th>
                           <th>수량</th>
                           <th>단가(원)</th>
                           <th>합계(원)</th>
                           <th>적요</th>
                  </tr>
               </thead>
               <tbody id="tbody">
                  <tr>
                     <td><input type="checkbox" name="each_check" class="each"></td>
                     	   <td id="name"></td>
                          <!--  <td><input type="text" name="r_name"></td> -->
                          <!--  <td><input type="text" name="r_itcode" ></td> -->
                           <td id="it"></td>
                           <td><input id="amount" onclick="chageItcode(this)" type="number" min="1" name="r_amount"></td>
                           <td><input id="r_unlit" type="text" name="r_unlit" class="unlit"></td>
                           <td><input id="budget" type="text" name="r_budget"></td>
                           <td><input id="reason" type="text" name="r_reason"></td>
                       </tr>
               </tbody>
            </table>
         </div>
         </div>
         <div style="padding-top: 10px">
            <button type="button" id="save">등록</button>
            <!-- <button type="button" id="rDelete">삭제</button> -->
            </div>
      </form>
         
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
     
    $(function() {
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
	}); 
    
	  $('#save').click(function(){
			  var obj = $("#o_return").serialize();
		         console.log(obj);
		         $.ajax({
		            url: "/erp/rest/Purchase/rRegistration",
		            type: "post",
		            data: obj,
		            success: function(data){
		               //consloe.log(data);
		            $("input").val("");
		            $("select").val("");
		            alert("등록이 완료되었습니다.");
		            },
		            error: function(error){
		            	console.log(error);
		            	alert("등록이 실패하였습니다.");
		            }
		         });
	      });
	  
	  $('#rInfo').click(function(){
		  $.ajax({
			  url: '/erp/rest/Purchase/rInfo',
			  type: 'get',
			  dataType: 'json',
			  success: function(data){
				  console.log(data);
				  var str="";
				  str+="<tr class='tr'><td class='td'>선택</td><td class='td'>반품번호</td><td class='td'>입고번호</td><td class='td'>상품명</td><td class='td'>상품코드</td><td class='td'>담당자</td><td class='td'>거래처</td><td class='td'>반품일</td><td class='td'>수량</td><td class='td'>단가</td><td class='td'>합계</td><td class='td'>적요</td></tr>";
			 	  for(var i in data.rList){
			 		 str+="<tr class='tr'><td class='td'><input type='radio' value='"+data.rList[i].r_documentcode+"' name='each_check' class='each_check'></td>";
	  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_documentcode+"' readonly></td>"
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_ieseqnum+"' readonly></td>";
		  				 str+="<td class='td'><input tpye='text' value='"+data.rList[i].r_name+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_itcode+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_writer+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_clcode+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_date+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_amount+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_unlit+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_budget+"' readonly></td>";
		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_reason+"' readonly></td></tr>";
			 	  }
			 	  $('#list').html(str);
			  },
			  error: function(error){
				  console.log(error);
			  }
		  })
	  })
	  
	 	$('#searchbtn').click(function(){
			var choice= $('#choice').val();
			var search= $('#search').val();
			console.log(choice);
			console.log(search);
			$.ajax({
				url: '/erp/rest/Purchase/retrunsearch',
				type: 'post',
				data: "choice="+choice+"&search="+search,
				dataType: 'json',
				  success: function(data){
  	  				  console.log(data);
  					  var str="";
  					  str+="<tr class='tr'><td class='td'>선택</td><td class='td'>반품번호</td><td class='td'>입고번호</td><td class='td'>상품명</td><td class='td'>상품코드</td><td class='td'>담당자</td><td class='td'>거래처</td><td class='td'>반품일</td><td class='td'>수량</td><td class='td'>단가</td><td class='td'>합계</td><td class='td'>적요</td></tr>";
  					  for(var i in data.rList){
  				 		 str+="<tr class='tr'><td class='td'><input type='radio' value='"+data.rList[i].r_documentcode+"' name='each_check' class='each_check'></td>";
  		  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_documentcode+"' readonly></td>"
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_ieseqnum+"' readonly></td>";
  			  				 str+="<td class='td'><input tpye='text' value='"+data.rList[i].r_name+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_itcode+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_writer+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_clcode+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_date+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_amount+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_unlit+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_budget+"' readonly></td>";
  			  				 str+="<td class='td'><input type='text' value='"+data.rList[i].r_reason+"' readonly></td></tr>";
  				 	  }
  				 	  $('#list').html(str);
  				 	  
  	  				  },
  	  				  error: function(error){
  	  					  consoel.log(error);
  	  				  }
  	  			  })
			})	  
			
		$("#Wearing").click(function(){
			  $.ajax({
				  url:"/erp/rest/Purchase/stocklist",
				  type: "get",
				  dataType: "json",
				  success: function(data){
					  console.log(data);
					  var str="";
					  str+="<tr class='tr' style='text-align: center;'><td class='td'>입고번호</td><td class='td'>품목코드</td><td class='td' id='r_clcode'>거래처</td><td class='td'>날짜</td><td class='td'>수량</td><td class='td'>가격</td></tr>";
					  for(var i in data.sList){
						  if(data.sList[i].ie_clcode==null){
								str+="<tr class='tr' style='text-align: center;'><td class='td'>"+data.sList[i].ie_seqnum+"</td>";
								str+="<td class='td'><input type='text' value='"+data.sList[i].ie_itcode+"' readonly></td>";
								str+="<td class='td'><input type='text' readonly></td>";
							  	str+="<td class='td'><input type='text' value='"+data.sList[i].ie_date+"' readonly></td>";
							  	str+="<td class='td'><input type='text' value='"+data.sList[i].ie_qty+"' readonly></td>";
							  	str+="<td class='td'><input tpye='text' value='"+data.sList[i].ie_price+"' readonly></td><tr>";
						  }else{
							  	str+="<tr class='tr' style='text-align: center;'><td class='td'>"+data.sList[i].ie_seqnum+"</td>";
								str+="<td class='td'><input type='text' value='"+data.sList[i].ie_itcode+"' readonly></td>";
								str+="<td class='td'><input type='text' value='"+data.sList[i].ie_clcode+"'readonly></td>";
							  	str+="<td class='td'><input type='text' value='"+data.sList[i].ie_date+"' readonly></td>";
							  	str+="<td class='td'><input type='text' value='"+data.sList[i].ie_qty+"' readonly></td>";
							  	str+="<td class='td'><input tpye='text' value='"+data.sList[i].ie_price+"' readonly></td><tr>";
						  }
					  }
					  $('#list').html(str);
				  },
				  error: function(err){
					  console.log(err);
				  }
		 	 })
  		})
  	
		var select;
			$.ajax({
			url: "/erp/stock/getitemcode",
			type: "get",
			dataType: "json",
			success: function(data){
				select=makeSelectBox(data);
				$("#it").html(select);
			},
			error: function(err){
				console.log(err);
			}
		})
		function makeSelectBox(arr){
			var arrStr="<select id='itcode' class='select' name='r_itcode' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
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
  	
		 var select2;
		     $.ajax({
		    	 url: "/erp/stock/getimportlist",
		         dataType: "json",
		         type: "post",
		         success:function(data){
		              select2 = makeSelectBox2(data);
		              $("#ie").html(select2);
		         },
		         error:function(err){
		             console.log(err);
		         }
		     });
	     function makeSelectBox2(arr){
	         var arrStr = "<select id='ieseq' class='select2' name = 'r_ieseqnum' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
	         if(arr.length==0){
	            arrStr+="<option>입고내역이 없습니다.</option>";
	         }else{
	            for(var i = 0; i<arr.length;i++){
	               arrStr+="<option value='"+arr[i].ie_seqnum+"'>"+arr[i].ie_seqnum+"</option>"; 
	            }
	         }
	         arrStr+="</select>&emsp;";
	         return arrStr;
	      }
	     
	   var select3;
	     $.ajax({
	           url:"/erp/stock/getitemcode",
	           dataType:"json",
	           type:"get",
	           success:function(data){
	              select3 = makeSelectBox3(data);
	              $("#name").html(select3);
	           },
	           error:function(err){
	              console.log(err);
	           }
	        });
	     function makeSelectBox3(arr){
	         var arrStr = "<select class='select' id='name' name='r_name' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
	         if(arr.length==0){
	            arrStr+="<option>상품이 존재하지 않습니다. </option>";
	         }else{
	            for(var i = 0; i<arr.length;i++){
	               arrStr+="<option value='"+arr[i].it_pname+"'>"+arr[i].it_pname+"</option>"; 
	            }
	         }
	         arrStr+="</select>";
	         return arrStr;
	      }
	     
	     function changeItcode(id){
	    	 var it_stock = $(id).val();
	    	 var it_code = $(id).parent().siblings("#name").children().val();
	    	 $.ajax({
	    		 url: "/erp/stock/getstock",
	    		 data: {it_code: ti_code, it_stock : it_stock},
	    		 dataType: 'json',
	    		 success: function(result){
	    			 alert("재고가 부족합니다.");
	    			 id.value= result;
	    		 },
	    		 error: function(err){
	    			 console.log(err);
	    		 }
	    	 })
	     }
	     
/* 		  $('#rDelete').click(function(){
	  	  		 var check_list=[];
	  	  		 $("input[name=each_check]:checked").each(function(){
	  	  			 var cid= $(this).val();
	  	  			 console.log(check_list);
	  	  			  
	  	  			 $.ajax({
	  	  				 url: '/erp/rest/Purchase/rdelete',
	  	  				 type: 'post',
	  	  				 data: {check_list:cid},
	  	  				 dataType: 'json',
	  	  				 success: function(data){
	  	  				  console.log(data);
	  					  var str="";
	  					  str+="<tr class='tr'><th><span>선택</span></th><th>반품번호</th><th>입고번호</th><th>상품명</th><th>상품코드</th><th>담당자</th><th>거래처</th><th>반품일</th><th>수량</th><th>단가</th><th>합계</th><th>적요</th></tr>";
	  				 	  for(var i in data.rList){
	  				 		 str+="<tr class='tr'><td><input type='radio' value='"+data.rList[i].r_documentcode+"' name='each_check' class='each_check'></td>";
			  				 str+="<td>"+data.rList[i].r_documentcode+"</td>"
	  		  				 str+="<td>"+data.rList[i].r_ieseqnum+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_name+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_itcode+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_writer+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_clcode+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_date+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_amount+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_unlit+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_budget+"</td>";
	  		  				 str+="<td>"+data.rList[i].r_reason+"</td></tr>";
	  				 	  }
	  				 	  $('#list').html(str);
	  				 	  
	  	  				  },
	  	  				  error: function(error){
	  	  					  consoel.log(error);
	  	  				  }
	  	  			  })
	  	  		  })
	  	  	  })   */
  	
  	
</script>
</body>
</html>