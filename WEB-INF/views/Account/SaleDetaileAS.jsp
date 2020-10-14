<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/erp/img/favicon.png" rel="icon" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>매출상세정보</title>
<style>
table{
width:100%;
}
table,tr, th,td {
	border: 1px solid;
	text-align: center;
}

#saledetaile{
width:1000px;
text-align: center;
border: 3px double #e1e1e1;
    border-collapse: collapse;
    border-radius: 8px;
}

.ave{
width:100px;
}
</style>
</head>
<body>
	<div id="saledetaile">
<h2>매출 상세정보</h2>

		<table id="table">
			<c:forEach var="sale" items="${sList1}">
				<tr>
					<th style="background-color: #e1e1e1;">전표번호</th>
					<td>${sale.s_num}</td>
					<th style="background-color: #e1e1e1;">유형</th>
					<td>${sale.s_kind}</td>
					<th style="background-color: #e1e1e1;">입력자</th>
					<td colspan="2">${sale.s_employee}</td>
				</tr>
				<tr>
					<th style="background-color: #e1e1e1;">거래처</th>
					<td>${sale.s_company}</td>
					<th style="background-color: #e1e1e1;">사업자번호</th>
					<td>${sale.s_comnum}</td>
					<th style="background-color: #e1e1e1;">입력날짜</th>
					<td colspan="2">${sale.s_date}</td>
				</tr>
			</c:forEach>
			<tr>
				<th style="background-color: #e1e1e1;">품목</th>
				<th style="background-color: #e1e1e1;">수량</th>
				<th style="background-color: #e1e1e1;">단가(원)</th>
				<th style="background-color: #e1e1e1;">공급가액(원)</th>
				<th style="background-color: #e1e1e1;">부가세액(원)</th>
				<th style="background-color: #e1e1e1;">합계(원)</th>
				<th style="background-color: #e1e1e1;">적요</th>
			</tr>
			<tbody id="detaile">

			</tbody>
			<tr>
				<th colspan="2" style="background-color: #e1e1e1;">총합계</th>
				<td colspan="5" id="allprice"></td>
			</tr>
		</table>
	

	<div id="grafe">
		<table id="grafeInfo" style="border: 1px solid;">
	
			<tr>
				<td style="width: 80%;" rowspan="4"><div style="width: 100%;"
						id="chart_div"></div></td>
						
						<th class="ave" style="background-color: #e1e1e1;">년도선택</th>
						<td><select id="year">
						<option>--</option>
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						</select></td>
						</tr>
			<tr>
				<th class="ave" style="background-color: #e1e1e1;">품목명</th>
				<td id="pkind"></td>
			</tr>
			<tr>
				<th class="ave" style="background-color: #e1e1e1;">년 평균 단가</th>
				<td><span id="yearprice">(원)</span></td>
			</tr>
			<!-- <tr>
				<th class="ave" style="background-color: #e1e1e1;">월 평균 단가</th>
				<td id="monthprice" style="text-align:right;">(원)</td>
			</tr> -->
			<tr>
				<th class="ave" style="background-color: #e1e1e1;">년 평균 대비 단가비교</th>
				<td><span id="yearp">(원)</span></td>
			</tr>
			<tr><td><span>품목 밑을 클릭하시면 그래프로 평균단가가 표시됩니다.</span></td><td colspan="2"><span style="color:red;">레드</span>는 불이익<br><span style="color:blue;">블루</span>는 이익</td></tr>
		</table>
	</div>
	</div>
</body>

<script>
var compareprice=0;

var data = ${sList2};
var str="";
var allprice=0;
for(var i in data){
	str+="<tr><td onclick='getpkind(\""+data[i].s_pkind+"\")'>"+data[i].s_pkind+"</td>";
	str+="<td>"+data[i].s_cnt+"</td>";
	str+="<td>"+data[i].s_price+"</td>";
	str+="<td>"+data[i].s_price2+"</td>";
	str+="<td>"+data[i].s_tax+"</td>";
	str+="<td class='total'>"+data[i].s_total+"</td>";
	str+="<td>"+data[i].s_memo+"</td></tr>";
	
 allprice+=Number(data[i].s_total);
}
console.log(allprice);
compareprice=data[i].s_price;
 $("#allprice").html(allprice+"(원)");
 $("#detaile").html(str);
 
 google.charts.load('current', {packages: ['corechart', 'bar']});
 google.charts.setOnLoadCallback(drawBasic);

 function drawBasic() {

       var data = new google.visualization.arrayToDataTable([
     	  ['월별','단가'],
     	  ['1월',0],
     	  ['2월',0],
     	  ['3월',0],
     	  ['4월',0],
     	  ['5월',0],
     	  ['6월',0],
     	  ['7월',0],
     	  ['8월',0],
     	  ['9월',0],
     	  ['10월',0],
     	  ['11월',0],
     	  ['12월',0],
       ]);
    var date = new Date();
  var year = date.getFullYear();

       var options = {
         title: '매출/매입 통계분석 차트',
         hAxis: {
           title: '단가통계',
           format: 'yyyy-MM',
           gridlines:{count:12}
         },
         vAxis: {
           format: 'decimal',
         
         }
       };

       var chart = new google.visualization.ColumnChart(
         document.getElementById('chart_div'));

       chart.draw(data, options);
     };
     
     function getpkind(pkind) {
			var arr1 = new Array();
			var arr2 = new Array();
			var arr3 = new Array();
			var arr4 = new Array();
			var arr5 = new Array();
			var arr6 = new Array();
			var arr7 = new Array();
			var arr8 = new Array();
			var arr9 = new Array();
			var arr10 = new Array();
			var arr11 = new Array();
			var arr12 = new Array();
$.ajax({
	url:'/erp/rest/Account/getpkind',
	type:'post',
	data:{pkind:pkind},
	datatype:'json',
	success:function(data){
		console.log(data);
		var yearprice=0;
        var yearnum= $("#year").val();
        console.log(yearnum);
        if(yearnum=="--"){
        	alert("년도를 선택해주세요");
        }else{
        	
		for(var i in data.sList){
			if(data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS"){
			yearprice+=Number(data.sList[i].s_price);
				
			}
			
			if(data.sList2[i].s_date.substring(5,7)=="01" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS"){
			arr1.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="02" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr2.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="03" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr3.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="04" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr4.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="05" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr5.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="06" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr6.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="07" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr7.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="08" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr8.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="09" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr9.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="10" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr10.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="11" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr11.push(Number(data.sList[i].s_price));
			}else if(data.sList2[i].s_date.substring(5,7)=="12" && data.sList2[i].s_date.substring(0,4)==yearnum && data.sList2[i].s_num.substring(0,2)=="AS" ){
			arr12.push(Number(data.sList[i].s_price));
		}
		}	
        var totalcnt=0;
			totalcnt+=arr1.length;
			totalcnt+=arr2.length;
			totalcnt+=arr3.length;
			totalcnt+=arr4.length;
			totalcnt+=arr5.length;
			totalcnt+=arr6.length;
			totalcnt+=arr7.length;
			totalcnt+=arr8.length;
			totalcnt+=arr9.length;
			totalcnt+=arr10.length;
			totalcnt+=arr11.length;
			totalcnt+=arr12.length;
		
		
		console.log(totalcnt);
		$("#pkind").html(data.sList[0].s_pkind);
		var ever=yearprice/totalcnt;
		console.log(ever)
		 var ever2=Math.floor(Number(ever));
		if(totalcnt==0){
			$("#yearprice").html(0+"(원)");
			$("#yearp").html(0+"(원)");
		}else{
			
		$("#yearprice").html(ever2+"(원)");
		$("#yearp").html(compareprice-ever2+"(원)");
		}
		
		$("#yearp").html(compareprice-ever2+"(원)");
		if(compareprice-ever2<0){
			$("#yearp").attr("style", "color:red;")
		}else{
			$("#yearp").attr("style", "color:blue;")
			
		}
        }
		google.charts.load('current', {packages: ['corechart', 'bar']});
		google.charts.setOnLoadCallback(drawBasic);

		    		  var cnt1=arr1.length;
		    		  var cnt2=arr2.length;
		    		  var cnt3=arr3.length;
		    		  var cnt4=arr4.length;
		    		  var cnt5=arr5.length;
		    		  var cnt6=arr6.length;
		    		  var cnt7=arr7.length;
		    		  var cnt8=arr8.length;
		    		  var cnt9=arr9.length;
		    		  var cnt10=arr10.length;
		    		  var cnt11=arr11.length;
		    		  var cnt12=arr12.length;
		    		  var price1=0;
		    		  for(var i=0; i<arr1.length;i++){
		    			  price1+=Number(arr1[i]);
		    		  }
		    		  var price2=0;
		    		  for(var i=0; i<arr2.length;i++){
		    			  price2+=Number(arr2[i]);
		    		  }
		    		  var price3=0;
		    		  for(var i=0; i<arr3.length;i++){
		    			  price3+=Number(arr3[i]);
		    		  }
		    		  var price4=0;
		    		  for(var i=0; i<arr4.length;i++){
		    			  price4+=Number(arr4[i]);
		    		  }
		    		  var price5=0;
		    		  for(var i=0; i<arr5.length;i++){
		    			  price5+=Number(arr5[i]);
		    		  }
		    		  var price6=0;
		    		  for(var i=0; i<arr6.length;i++){
		    			  price6+=Number(arr6[i]);
		    		  }
		    		  var price7=0;
		    		  for(var i=0; i<arr7.length;i++){
		    			  price7+=Number(arr7[i]);
		    		  }
		    		  var price8=0;
		    		  for(var i=0; i<arr8.length;i++){
		    			  price8+=Number(arr8[i]);
		    		  }
		    		  var price9=0;
		    		  for(var i=0; i<arr9.length;i++){
		    			  price9+=Number(arr9[i]);
		    		  }
		    		  var price10=0;
		    		  for(var i=0; i<arr10.length;i++){
		    			  price10+=Number(arr10[i]);
		    		  }
		    		  var price11=0;
		    		  for(var i=0; i<arr11.length;i++){
		    			  price11+=Number(arr11[i]);
		    		  }
		    		  var price12=0;
		    		  for(var i=0; i<arr12.length;i++){
		    			  price12+=Number(arr12[i]);
		    		  }
		function drawBasic() {

		      var data = new google.visualization.arrayToDataTable([
		    	 // for(var i=0; i<arr.length; i++){
		    	  ['월별','단가'],
		    	  ['1월',price1/cnt1],
		    	  ['2월',price2/cnt2],
		    	  ['3월',price3/cnt3],
		    	  ['4월',price4/cnt4],
		    	  ['5월',price5/cnt5],
		    	  ['6월',price6/cnt6],
		    	  ['7월',price7/cnt7],
		    	  ['8월',price8/cnt8],
		    	  ['9월',price9/cnt9],
		    	  ['10월',price10/cnt10],
		    	  ['11월',price11/cnt11],
		    	  ['12월',price12/cnt12],
		    	//  }
		      ]);
		   
		 var date = new Date();
		 //var year = date.getFullYear();

		      var options = {
		        title: '매출 통계분석 차트',
		        hAxis: {
		          title: '단가통계',
		          format: 'yyyy-MM',
		          gridlines:{count:12}
		        },
		        vAxis: {
		          format: 'decimal',
		        
		        }
		      };

		      var chart = new google.visualization.ColumnChart(
		        document.getElementById('chart_div'));

		      chart.draw(data, options);
		    
		}
		
	},
	error:function(error){
		console.log(error);
	}
});
};
</script>
</html>