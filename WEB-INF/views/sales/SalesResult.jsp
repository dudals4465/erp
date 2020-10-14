<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<link href="/erp/img/favicon.png" rel="icon" />
<title>영업실적조회</title>



<style>

* {
	margin: 0px; 
	padding: 0px; 
	box-sizing: border-box;
}

body, html {
	height: 100%;
	font-family: sans-serif;
}

/* ------------------------------------ */
a {
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
}

a:focus {
	outline: none !important;
}

a:hover {
	text-decoration: none;
}

/* ------------------------------------ */
h1,h2,h3,h4,h5,h6 {margin: 0px;}

p {margin: 0px;}

ul, li {
	margin: 0px;
	list-style-type: none;
}


/* ------------------------------------ */
input {
  display: block;
	outline: none;
	border: none !important;
}

textarea {
  display: block;
  outline: none;
}

textarea:focus, input:focus {
  border-color: transparent !important;
}

/* ------------------------------------ */
button {
	outline: none !important;
	border: none;
	background: transparent;
}

button:hover {
	cursor: pointer;
}

iframe {
	border: none !important;
}


.table100 .ps__rail-y {
  width: 9px;
  background-color: transparent;
  opacity: 1 !important;
  right: 5px;
}

.table100 .ps__rail-y::before {
  content: "";
  display: block;
  position: absolute;
  background-color: #ebebeb;
  border-radius: 5px;
  width: 100%;
  height: calc(100% - 30px);
  left: 0;
  top: 15px;
}

.table100 .ps__rail-y .ps__thumb-y {
  width: 100%;
  right: 0;
  background-color: transparent;
  opacity: 1 !important;
}

.table100 .ps__rail-y .ps__thumb-y::before {
  content: "";
  display: block;
  position: absolute;
  background-color: #cccccc;
  border-radius: 5px;
  width: 100%;
  height: calc(100% - 30px);
  left: 0;
  top: 15px;
} 


.table100 {
  background-color: #fff;
}

table {
  width: 100%;
}

th, td {
  font-weight: unset;
  padding-right: 10px;
}

.column1 {
  width: 33%;
  padding-left: 40px;
}

.column2 {
  width: 13%;
}

.column3 {
  width: 22%;
}

.column4 {
  width: 19%;
}

.column5 {
  width: 13%;
}

.table100-head th {
  padding-top: 18px;
  padding-bottom: 18px;
}

.table100-body td {
  padding-top: 16px;
  padding-bottom: 16px;
}

/*==================================================================
[ Fix header ]*/
.table100 {
  position: relative;
  padding-top: 60px;
}

.table100-head {
  position: absolute;
  width: 100%;
  top: 0;
  left: 0;
}

.table100-body {
  max-height: 585px;
  overflow: auto;
}


/*==================================================================
[ Ver1 ]*/

.table100.ver1 th {
  font-family: Lato-Bold;
  font-size: 18px;
  color: #fff;
  line-height: 1.4;

  background-color: #6c7ae0;
}

.table100.ver1 td {
  font-family: Lato-Regular;
  font-size: 15px;
  color: #808080;
  line-height: 1.4;
}

.table100.ver1 .table100-body tr:nth-child(even) {
  background-color: #f8f6ff;
}

/*---------------------------------------------*/

.table100.ver1 {
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
  -moz-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
  -webkit-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
  -o-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
  -ms-box-shadow: 0 0px 40px 0px rgba(0, 0, 0, 0.15);
}

.table100.ver1 .ps__rail-y {
  right: 5px;
}

.table100.ver1 .ps__rail-y::before {
  background-color: #ebebeb;
}

.table100.ver1 .ps__rail-y .ps__thumb-y::before {
  background-color: #cccccc;
}

.table100 ver1 m-b-110{
  width:2000px;
}












#salesResult{
border: 3px #e1e1e1 double;
	border-radius: 8px;
	float: left;
	margin-left: 10%;
	float: left;
}
.table{
text-align:center;
border:1px solid #e1e1e1;
}

td{
border:1px solid #e1e1e1;


}
.column,.value{
width:100px;
}

</style>
</head>

<body>

<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">영업실적조회</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
<div id="as">
			<div id="salesResult" style="width: 800px;%; height:575px;"></div>
			<table class="table"  style="width:150px;">
				<tr>
					<td class="year">
					년
					</td></tr>
					<tr><td id="month">
			
					</td>
				</tr>
			<tr><td class="column">이름</td></tr>
			<tr><td class="value" id="hrcode"></td></tr>
				<tr><td>총 영업예산</td></tr>
				<tr><td id="total"></td></tr>
				<tr><td>총 영업매출</td></tr>
				<tr><td id="price"></td></tr>
				<tr><td>영업이익</td></tr>
				<tr><td id="gain"></td></tr>
			</table>
		</div>
	<table>
<tbody>

</body>
<script>
	var bList= ${bList};
$(document).ready(function(){
			 var str="";
			 var str2="";
			 var str3="";
			var date = new Array();
			var hrcode = new Array();
			var month = new Array();
			for(var i in bList){
				date.push(bList[i].ba_date.substring(0,4));
				hrcode.push(bList[i].ba_hrcode);
				month.push(bList[i].ba_date.substring(5,7))
				}
			
			var date2=Array.from(new Set(date));
			var month2=Array.from(new Set(month));
			var hrcode2=Array.from(new Set(hrcode));
				console.log(month2);
			
			str+="<select id='change'>";
			str+="<option>--</option>";
			for(var i=0; i<date2.length; i++){
				str+="<option  value="+date2[i]+">"+date2[i]+"</option>";
			}
			str+="</select>";
			$(".year").html(str+"년");
			
			
			str2+="<select id='name'>";
			str2+="<option>--</option>";
			for(var i=0; i<hrcode2.length; i++){
				str2+="<option  value="+hrcode2[i]+">"+hrcode2[i]+"</option>";
				console.log(hrcode2);
			}
			str2+="</select>";
			$("#hrcode").html(str2);
			
			str3+="<select id='month2'>";
			str3+="<option>--</option>";
			for(var i=0; i<month2.length; i++){
				str3+="<option  value="+month2[i]+">"+month2[i]+"</option>";
			}
			str3+="</select>";
			$("#month").html(str3+("월"));
			
			
			
});

 var year = "";
 var allmonth = "";
 var name ="";
$(document).on("change","#change",function(){
		 year = $("#change").val();
	var total=0;
    var price=0;
    var pkind = new Array();
    var cnt = new Array();
	
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
	
});

$(document).on("change","#name",function(){
	    name = $("#name").val();
	var total=0;
    var price=0;
    var pkind = new Array();
    var cnt = new Array();
    if(year==""){
    	alert("년도를 선택해주세요");
    	window.location.reload();
    }else if(allmonth==""){
    	
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_hrcode==name){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
    }else{
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_hrcode==name && bList[i].ba_date.substring(5,7)==allmonth){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
    	
    }
	
	
});

$(document).on("change","#month2",function(){
	     allmonth =$("#month2").val();
	var total=0;
    var price=0;
    var pkind = new Array();
    var cnt = new Array();
    if(year==""){
    	alert("년도를 선택해주세요");
    	window.location.reload();
    }else if(name==""){
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_date.substring(5,7)==allmonth){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
    }else{
			for(var i in bList){
			if(bList[i].ba_date.substring(0,4)==year && bList[i].ba_hrcode==name && bList[i].ba_date.substring(5,7)==allmonth){
				total+=Number(bList[i].ba_estimatedsalesamount);
				price+=Number(bList[i].ba_actualsalesamount);
				pkind.push(bList[i].ba_content);
				cnt.push(bList[i].ba_estimatedsalesamount);
			}
			}
			console.log(pkind);
			console.log(cnt);
		var gain=(price-total);
	      
			console.log(gain);
			$("#total").html(total+"(원)");
			$("#price").html(price+"(원)");
			if(gain<0){
				$("#gain").attr("style","color:red;");
			}else{
				$("#gain").attr("style","color:blue;");
			}
			$("#gain").html(gain+"(원)");
			grafe(pkind,cnt);
	
    	
    }
});

function grafe(pkind,cnt){
	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		  var data =new google.visualization.DataTable();
		   data.addColumn('string','수주이름');
		   data.addColumn('number','액수');
		 for(var i=0; i<pkind.length; i++){  
		  data.addRows([[pkind[i],cnt[i]]]);
		  }
		
		var options = {
			title : year+"-"+allmonth+'영업실적',
			is3D : true ,
			
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('salesResult'));

		chart.draw(data, options);
	}
    };
</script>
</html>