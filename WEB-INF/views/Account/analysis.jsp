<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>매출/매입분석</title>
<style>
#as, #ap {
	border: 3px #e1e1e1 double;
	border-radius: 8px;
	float: left;
	width: 40%;
	height: 700px;
	margin-left: 8%;
}
.table{
text-align:center;
width:100%;
height: 29%;
border:1px solid #e1e1e1;
}
td{
border:1px solid #e1e1e1;

}
</style>
</head>
<body>
	<div>
		<div id="as">
			<div id="salestatement" style="width: 100%; height: 500px;"></div>
			<table class="table">
				<tr>
					<td class="asyear">
					년
					</td>
					<td><select onchange="salestatementAS(value)">
					<option value="--">--</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>
					월
					</td>
				</tr>
				<tr><td>총 매출액</td><td id="astotal"></td></tr>
				<tr><td>총 공급가액</td><td id="asprice"></td></tr>
				<tr><td>총 부가세액</td><td id="astax"></td></tr>
			</table>
		</div>

		<div id="ap">
			<div id="purchase" style="width: 100%; height: 500px;"></div>
			<table class="table">
				<tr>
					<td class="apyear">
					</td>
					<td><select onchange="salestatementAP(value)">
					<option value="--">--</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					</select>
					월
					</td>
				</tr>
				<tr><td>총 매출액</td><td id="aptotal"></td></tr>
				<tr><td>총 공급가액</td><td id="apprice"></td></tr>
				<tr><td>총 부가세액</td><td id="aptax"></td></tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:'/erp/rest/Account/analysis',
		dataType:'json',
		type:'post',
		success:function(data){
			var str="";
			var str2="";
			var asdate = new Array();
			var apdate = new Array();
			for(var i in data.sList){
				if(data.sList[i].s_num.substring(0,2)=="AS"){
				asdate.push(data.sList[i].s_date.substring(0,4));
				}else{
				apdate.push(data.sList[i].s_date.substring(0,4));
				}
				
			}
			var asdate2=Array.from(new Set(asdate));
			var apdate2=Array.from(new Set(apdate));
			
			str+="<select id='aschange'>";
			str+="<option>--</option>";
			for(var i=0; i<asdate2.length; i++){
				str+="<option  value="+asdate2[i]+">"+asdate2[i]+"</option>";
			}
			str+="</select>";
			$(".asyear").html(str+"년");
			
			str2+="<select id='apchange'>";
			str2+="<option>--</option>";
			for(var i=0; i<apdate2.length; i++){
				str2+="<option  value="+apdate2[i]+">"+apdate2[i]+"</option>";
			}
			str2+="</select>";
			$(".apyear").html(str2+"년");
		},
		error:function(error){
		console.log(error);	
		
		}
   });
});
//매출 분석표
	var asmonth ="";
	var asyear="";
	
    
   $(document).on("change","#aschange",function(){
	   var value = $("#aschange").val();
    	var snum= new Array();
    	var total=0;
        var price=0;
        var tax=0;
        var pkind = new Array();
        var cnt = new Array();
	 asyear = value;
    	console.log(value);
    	$.ajax({
    		url:'/erp/rest/Account/analysis',
    		dataType:'json',
    		type:'post',
    		success:function(data){
    	
    			for(var i in data.sList){
    			if(data.sList[i].s_num.substring(0,2)=="AS" && data.sList[i].s_date.substring(0,4)==asyear){
    				snum.push(data.sList[i].s_num);
    			}
    			}
    				console.log(snum);
    			for(var i=0; i<snum.length; i++){
    				for(var j=0; j<data.sList2.length; j++){
    					if(snum[i]==data.sList2[j].s_num){
    						cnt.push(Math.abs(data.sList2[j].s_cnt));
    						pkind.push(data.sList2[j].s_pkind);
    						total+=Number(data.sList2[j].s_total);
    						console.log(total);
    						price+=Number(data.sList2[j].s_price2);
    						tax+=Number(data.sList2[j].s_tax);
    					}
    				}
    			}
    			var totalcnt = new Array();
    			var pkind2=Array.from(new Set(pkind));
    			for(var i=0; i<pkind2.length; i++){
    				var count=0;
    				for(var j=0; j<pkind.length; j++){
    					if(pkind2[i]==pkind[j]){
    						count+=Number(cnt[j]);
    					}
    				}
    						totalcnt.push(count);
    			}
    		    console.log(cnt);
    			
    			$("#astotal").html(total+"(원)");
    			$("#asprice").html(price+"(원)");
    			$("#astax").html(tax+"(원)");
    			asgrafe(pkind2,totalcnt);
    		},
    		error:function(error){
    			console.log(error);
    		}
    	});
    });	
    
    function salestatementAS(value2){
    	var snum= new Array();
    	var total=0;
        var price=0;
        var tax=0;
        var pkind = new Array();
        var cnt = new Array();
		 asmonth="-"+value2+"월";
		 $.ajax({
	    		url:'/erp/rest/Account/analysis',
	    		dataType:'json',
	    		type:'post',
	    		success:function(data){
	    			
	    			console.log(data);
	    			for(var i in data.sList){
	    			if(data.sList[i].s_num.substring(0,2)=="AS" && data.sList[i].s_date.substring(0,4)==asyear && data.sList[i].s_date.substring(5,7)==value2){
	    				snum.push(data.sList[i].s_num);
	    			}
	    			}
	    				console.log(snum);
	    		
	    			for(var i=0; i<snum.length; i++){
	    				for(var j=0; j<data.sList2.length; j++){
	    					if(snum[i]==data.sList2[j].s_num){
	    						cnt.push(Math.abs(data.sList2[j].s_cnt));
	    						pkind.push(data.sList2[j].s_pkind);
	    						total+=Number(data.sList2[j].s_total);
	    						price+=Number(data.sList2[j].s_price2);
	    						tax+=Number(data.sList2[j].s_tax);
	    					}
	    				}
	    			}
	    			var totalcnt = new Array();
	    			var pkind2=Array.from(new Set(pkind));
	    			for(var i=0; i<pkind2.length; i++){
	    				var count=0;
	    				for(var j=0; j<pkind.length; j++){
	    					if(pkind2[i]==pkind[j]){
	    						count+=Number(cnt[j]);
	    					}
	    				}
	    						totalcnt.push(count);
	    			}
	    			$("#astotal").html(total+"(원)");
	    			$("#asprice").html(price+"(원)");
	    			$("#astax").html(tax+"(원)");
	    			asgrafe(pkind2,totalcnt);
	    		},
	    		error:function(error){
	    			console.log(error);
	    		}
	    	});
		 
	 };
    function asgrafe(pkind2,totalcnt){
    	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);
	
	function drawChart1() {
		  var data =new google.visualization.DataTable();
		   data.addColumn('string','품목');
		   data.addColumn('number','갯수');
		 for(var i=0; i<pkind2.length; i++){  
		  data.addRows([[pkind2[i],totalcnt[i]]]);
		  }
		
		var options = {
			title : asyear+asmonth+'매출분석표',
			is3D : true ,
			
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('salestatement'));

		chart.draw(data, options);
	}
    };
    
    
//매입 분석표
	var apmonth ="";
	var apyear="";
	
    
   $(document).on("change","#apchange",function(){
	   var value = $("#apchange").val();
    	var snum= new Array();
    	var total=0;
        var price=0;
        var tax=0;
        var pkind = new Array();
        var cnt = new Array();
	 apyear = value;
    	console.log(value);
    	$.ajax({
    		url:'/erp/rest/Account/analysis',
    		dataType:'json',
    		type:'post',
    		success:function(data){
    	
    			for(var i in data.sList){
    			if(data.sList[i].s_num.substring(0,2)=="AP" && data.sList[i].s_date.substring(0,4)==apyear){
    				snum.push(data.sList[i].s_num);
    			}
    			}
    				console.log(snum);
    			for(var i=0; i<snum.length; i++){
    				for(var j=0; j<data.sList2.length; j++){
    					if(snum[i]==data.sList2[j].s_num){
    						cnt.push(Math.abs(data.sList2[j].s_cnt));
    						pkind.push(data.sList2[j].s_pkind);
    						total+=Number(data.sList2[j].s_total);
    						price+=Number(data.sList2[j].s_price2);
    						tax+=Number(data.sList2[j].s_tax);
    					}
    				}
    			}
    			var totalcnt = new Array();
    			var pkind2=Array.from(new Set(pkind));
    			for(var i=0; i<pkind2.length; i++){
    				var count=0;
    				for(var j=0; j<pkind.length; j++){
    					if(pkind2[i]==pkind[j]){
    						count+=Number(cnt[j]);
    					}
    				}
    						totalcnt.push(count);
    			}
    		    console.log(cnt);
    			
    			$("#aptotal").html(total+"(원)");
    			$("#apprice").html(price+"(원)");
    			$("#aptax").html(tax+"(원)");
    			apgrafe(pkind2,totalcnt);
    		},
    		error:function(error){
    			console.log(error);
    		}
    	});
    });	
    
    function salestatementAP(value2){
    	var snum= new Array();
    	var total=0;
        var price=0;
        var tax=0;
        var pkind = new Array();
        var cnt = new Array();
		 apmonth="-"+value2+"월";
		 $.ajax({
	    		url:'/erp/rest/Account/analysis',
	    		dataType:'json',
	    		type:'post',
	    		success:function(data){
	    			
	    			console.log(data);
	    			for(var i in data.sList){
	    			if(data.sList[i].s_num.substring(0,2)=="AP" && data.sList[i].s_date.substring(0,4)==apyear && data.sList[i].s_date.substring(5,7)==value2){
	    				snum.push(data.sList[i].s_num);
	    			}
	    			}
	    				console.log(snum);
	    		
	    			for(var i=0; i<snum.length; i++){
	    				for(var j=0; j<data.sList2.length; j++){
	    					if(snum[i]==data.sList2[j].s_num){
	    						cnt.push(Math.abs(data.sList2[j].s_cnt));
	    						pkind.push(data.sList2[j].s_pkind);
	    						total+=Number(data.sList2[j].s_total);
	    						price+=Number(data.sList2[j].s_price2);
	    						tax+=Number(data.sList2[j].s_tax);
	    					}
	    				}
	    			}
	    			var totalcnt = new Array();
	    			var pkind2=Array.from(new Set(pkind));
	    			for(var i=0; i<pkind2.length; i++){
	    				var count=0;
	    				for(var j=0; j<pkind.length; j++){
	    					if(pkind2[i]==pkind[j]){
	    						count+=Number(cnt[j]);
	    					}
	    				}
	    						totalcnt.push(count);
	    			}
	    			$("#aptotal").html(total+"(원)");
	    			$("#apprice").html(price+"(원)");
	    			$("#aptax").html(tax+"(원)");
	    			apgrafe(pkind2,totalcnt);
	    		},
	    		error:function(error){
	    			console.log(error);
	    		}
	    	});
		 
	 };
    function apgrafe(pkind2,totalcnt){
    	
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart2() {
		  var data =new google.visualization.DataTable();
		   data.addColumn('string','품목');
		   data.addColumn('number','갯수');
		 for(var i=0; i<pkind2.length; i++){  
		  data.addRows([[pkind2[i],totalcnt[i]]]);
		  }
		
		var options = {
			title : apyear+apmonth+'매입분석표',
			is3D : true ,
			
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('purchase'));

		chart.draw(data, options);
	}
    };
    
	
	
</script>
</html>