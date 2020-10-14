<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>출하입력 form</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="/erp/img/favicon.png" rel="icon" />
</head>
<style>
#center{
text-align:center;
}
input{
text-align: center;
}
.select{
width: 140px;
height: 22px;
}
.txt{
width: 154px;
}
/* html, body {
text-align:center;
   height: 100%;
   margin: 0
}

tr,td{
text-align: center;
width: 150px;
border: 1px solid;
} */

</style>
<body>
    <div id="center">
        <br>
        <button type="button" id="shippingitemfrm">출하등록 현황</button>
        <span><a href="#" onclick="window.open('/erp/stock/setcategory','PopupWin','width=550,height=600')"><button>분류코드 추가</button></a></span>
        <span><a href="#" onclick="window.open('/erp/stock/setitemcode','PopupWin','width=565,height=600')"><button>품목코드 추가</button></a></span>
        <span><a href="#" onclick="window.open('/erp/stock/searchitemcode','PopupWin','width=1550,height=600')"><button>품목코드 검색</button></a></span>
        <button type="button" id="approvalplan">결재 요청하기</button>
        <br>
        <br>
        <div style="width:1150px; background-color:#3D6B9B;  color:white; padding:1%;">출하의뢰입력</div>
          <select id="choice" style="width:180px;">
                      <option value="bs_docunum">출하번호</option>
                      <option value="bs_bonum">수주번호</option>
                      <option value="bs_clcode">거래처회사코드</option>
          </select>
        <input type="text" name="search" id="search">
        <button id="searchh">검색</button>
        <form id="shippingrequestinput">
        <div border="1" style="width:1175px; height:60px; padding-top:25px; background-color:#F8F7F7;">
        <table style="margin-left:165px;">
         <thead>
            <tr>
               <th>출하번호&nbsp;</th>
               <th><input type="text" name="bs_docunum" placeholder="자동생성" readonly>&emsp;</th>
               <th>회사코드&nbsp;</th>
               <th><input type="text" name="bs_ccode" value="${cCode}" readonly>&emsp;</th>
               <th>수주번호&nbsp;</th>
               <th><input id="bonum" type="text" readonly name="bs_bonum">&nbsp;<button type="button" onclick="window.open('/erp/sales/bs_bonumInfo','bs_bonumInfo','width=700,height=700')" >검색</button></th>
            </tr>
         </thead>
      </table>
      </div>
            <div style="width:1175px; background-color:#ECEBEA;">
            <table id="item" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1"
              style="margin-left:0px;">
                <colgroup align="center">
                </colgroup>
                <colgroup align="left">
                </colgroup>
                <colgroup span="2" align="center">
                </colgroup>
                <colgroup span="3" align="center">
                </colgroup>
                <tbody id="tBody">
                    <tr>
                        <th><input type="radio" id="allCheck"></th>
                        <th>출하의뢰일</th>
                        <th>거래처회사코드</th>
                        <th>품목코드</th>
                        <th>제품명</th>
                        <th>판매단가</th>
                        <th>수량</th>
                        <th>판매금액</th>
                   </tr>
                    <tr>
                        <td><input type="radio" name="each_check" class="each"></td>
                        <td><input type="date"  name="bs_basedate" required></td>
                        <td><input type="text" name="bs_clcode" required id="clcode" readonly>&nbsp;<button type="button" onclick="window.open('/erp/home/comInfo','comInfo','width=550,height=700')">검색</button></td>
                        <td class = "cl"></td>
                        <td class = "pn"></td> <!-- <td><input type="text" name="bs_proname" required></td> -->
                        <td><input type="number" name="bs_unit" class="bs_unit" required></td>
                        <td><input onclick="changeItcode(this)" min="1" type="number" name="bs_quantity" class="bs_quantity" required></td>
                        <td><input type="number" name="bs_price" class="bs_price" required></td>
                    </tr>
                </tbody>
            </table>
            </div>
            <br>
            <div style="margin-right: 180px;">
              <!-- <button type="button" class="addList" value="추가">추가</button> -->
              <button type="button" id="deleteCheck" value="삭제">삭제</button>
              <button type="button" id="sub">저장</button>
            </div>
            </form>
          </div>
    <br>
    <br>
    <div id="a">


    </div>

    <script type="text/javascript">
    $(document).on("keyup",".bs_quantity",function(){
        var cnt =$(this).parent().prev().children().val();
        console.log(cnt);
        var unit = $(this).val();
        var price=cnt*unit;
        $(this).parent().next().children().val(price);
     });
    
    function setChildValue(data) {
 	   console.log(data)
 	   for(var i in data.aList){
 	   var clcode=data.aList[i].cl_code;

 	   }

 	   $("#clcode").val(clcode);
 	};

    function setChildValue2(data) {
 	   console.log(data)
 	   var bonum="";
 	   for(var i in data.sList){
 	   bonum=data.sList[i].bo_num;
 	   }
 	   $("#bonum").val(bonum);
 	};


    $('#shippingitemfrm').click(function(){
      var str="";

     $.ajax({
      url: '/erp/rest/sales/shippingitem',
      type: 'get',
      dataType: "json",
      success:function(data){
         console.log(data);
          str+="<tr><th><input type='radio' id='allCheck'></th><th>수주번호</th><th>거래처회사코드</th><th>품목코드</th><th>제품명</th><th>판매단가</th><th>수량</th><th>판매금액</th></tr>";
         //거래처랑 제품명도!
         for(var i in data.sList){
            str+="<tr><td><input type='radio' name='each_check' value="+data.sList[i].bs_docunum+"></td>";
            str+="<td><input class='txt' type='text' value='"+data.sList[i].bs_bonum+"'></td>";
            str+="<td><input class='txt' type='text' value='"+data.sList[i].bs_clcode+"'></td>";
            str+="<td><input class='txt' type='text' value='"+data.sList[i].bs_itcode+"'></td>";
            str+="<td><input class='txt' type='text' value='"+data.sList[i].bs_proname+"'></td>";
            str+="<td><input class='txt' type='number' value='"+data.sList[i].bs_unit+"'></td>";
            str+="<td><input class='txt' onclick='changeItcode(this)' type='number' value='"+data.sList[i].bs_quantity+"'></td>";
            str+="<td><input class='txt' type='number' value='"+data.sList[i].bs_price+"'></td></tr>";
         }
            $('#tBody').html(str);
      },
      error:function(error){
         console.log(error);
      }
   });
  });

   $(document).ready(function(){
    var select;
    $.ajax({
          url:"/erp/stock/getitemcode",
          dataType:'json',
          success:function(data){
             select = makeSelectBox(data);
             $(".cl").html(select);
          },
          error:function(err){
             console.log(err);
          }
       });
   });

         $(document).ready(function(){
        	    var select2;
        	    $.ajax({
        	          url:"/erp/stock/getitemcode",
        	          dataType:'json',
        	          success:function(data){
        	             select = makeSelectBox2(data);
        	             $(".pn").html(select);
        	          },
        	          error:function(err){
        	             console.log(err);
        	          }
        	       });
          });


         function makeSelectBox(arr){
             var arrStr = "<select class='select' name = 'bs_itcode' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
             if(arr.length==0){
                arrStr+="<option>품목코드를 먼저 작성해주세요 </option>";
             }else{
                for(var i = 0; i<arr.length;i++){
                   arrStr+="<option value='"+arr[i].it_code+"'>"+arr[i].it_code+"</option>";
                }
             }
             arrStr+="</select>";
             return arrStr;
          }
           function thisRowDel(row){
                console.log(row);
                let tr = row.parentNode.parentNode;
                tr.parentNode.removeChild(tr);
         };

         function makeSelectBox2(arr){
             var arrStr = "<select class='select' name = 'bs_proname' style='vertical-alian: middle; text-align-last: center;'><option disabled selected value>==선택하세요==</option>";
             if(arr.length==0){
                arrStr+="<option>품목명을 먼저 작성해주세요 </option>";
             }else{
                for(var i = 0; i<arr.length;i++){
                   arrStr+="<option value='"+arr[i].it_pname+"'>"+arr[i].it_pname+"</option>";
                }
             }
             arrStr+="</select>";
             return arrStr;
          }
           function thisRowDel(row){
                console.log(row);
                let tr = row.parentNode.parentNode;
                tr.parentNode.removeChild(tr);
         };


    $('#sub').click(function(){
       console.log("저장클릭");

       var obj= $('#shippingrequestinput').serialize();

       $.ajax({
             type : 'post',
             url : '/erp/rest/sales/shippingrequestinput',
             data:obj,
             success : function(data) {
                console.log(data);
                alert("출하등록이 완료되었습니다.");
             },
             error : function(error) {
                console.log(error);
                alert("출하등록에 실패하였습니다.");
             }
          });
         $('input').val("");
         $("select").val("");
       });


         $("#approvalplan").click(function(){
            var check='';
            $("input[name=each_check]:checked").each(function(){
              check= $(this).attr("value");

              console.log(check);
                $.ajax({
                	url:'/erp/rest/sales/approvalcheck',
                	type:'post',
                	data:{check:check},
                	dataType:'json',
                	success:function(data){
                		console.log(data);
                		if(data.sList==null){
                			alert("이미 결재요청되었습니다.");
                		}else{
                 window.open("/erp/sales/approvalplan?check="+check,'approvalplan','width=1200, height=670, top=60 left=200');
                		}
                	},
                	error:function(error){
                		console.log(error);
                	}

                })

            });
         });


         $('#searchh').click(function(){
            var choice=$('#choice').val();
            var search=$('#search').val();
            console.log(choice);
            console.log(search);
            $.ajax({
                  type : 'post',
                  url : '/erp/rest/sales/shippingrequestsearch',
                  data: "choice="+choice+"&search="+search,
                  dataType: "json",
                  success : function(data) {
                     console.log(data);

                     var str="";
                      if(data.sList!=""){
                     for(var i in data.sList){
                        str+="<tr class='tr'><td><input type='radio' name='each_check' value='"+data.sList[i].bs_docunum+"'></td>";
                        str+="<td><input type='text' value='"+data.sList[i].bs_docunum+"'></td>";
                        str+="<td><input type='text' value='"+data.sList[i].bs_clcode+"'></td>";
                        str+="<td>"+select+"</td>";
                        str+="<td><input type='text' value='"+data.sList[i].bs_proname+"'></td>";
                        str+="<td><input type='number' value='"+data.sList[i].bs_unit+"'></td>";
                        str+="<td><input type='number' value='"+data.sList[i].bs_quantity+"'></td>";
                        str+="<td><input type='number' value='"+data.sList[i].bs_price+"'></td>";
                        }
                         $('#tBody').html(str);
                      }else{
                         alert("데이터가 없습니다.");
                      }
                  },
                  error : function(error) {
                     console.log(error);
                  }
               });
            });


         $('#deleteCheck').click(function(){
            var check="";
            $("input[name=each_check]:checked").each(function(){
               check = $(this).attr("value");
               console.log(check);
            });

            $.ajax({
                  type : 'post',
                  url : '/erp/rest/sales/shippingrequestdelete',
                  data: {check:check},
                  dataType: 'json',
                  success : function(data) {
                     console.log(data);
                     var str="";
                      if(data.sList==null){
                    	  alert("이미 결재 요청된 데이터입니다.");
                      }else{
                        str+="<tr><th><input type='radio' id='allCheck'></th><th>수주번호</th><th>거래처회사코드</th><th>품목코드</th><th>제품명</th><th>판매단가</th><th>수량</th><th>판매금액</th></tr>";

                     for(var i in data.sList){
                        str+="<tr><td><input type='radio' name='each_check' value='"+data.sList[i].bs_docunum+"'></td>";
                        str+="<td><input type='text' value='"+data.sList[i].bs_bonum+"'></td>";
                        str+="<td><input type='text' value='"+data.sList[i].bs_clcode+"'></td>";
                        str+="<td>"+select+"</td>";
                        str+="<td><input type='text' value='"+data.sList[i].bs_proname+"'></td>";
                        str+="<td><input type='number' value='"+data.sList[i].bs_unit+"'></td>";
                        str+="<td><input type='number' value='"+data.sList[i].bs_quantity+"'></td>";
                        str+="<td><input type='number' value='"+data.sList[i].bs_price+"'></td>";
                      }
                         $('#tBody').html(str);
                      }
                  },
                  error : function(error) {
                     console.log(error);
                  }
               });
            });


        function changeItcode(id){
           var it_stock = $(id).val();
           var it_code = $(id).parent().siblings(".cl").children().val();
           $.ajax({
              url:"/erp/stock/getstock",
              data : {it_code : it_code, it_stock : it_stock} ,
              dataType : "json",
              type : "get",
              success : function(result){
            	  if(result!=''){
                 alert("재고가 부족합니다.");
                 id.value = result;
            	  }

              },error: function(err){
                 console.log(err)
              }
           })
        }

  		$('#shippingitemfrm').click(function(){
			$("#sub").attr("style","visibility: hidden");
	});

</script>
</body>
</html>
