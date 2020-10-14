<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="/erp/img/favicon.png" rel="icon" />
<meta charset="UTF-8">
<title>결재라인</title>
<style>
div {
	border: 1px gray dotted;
	text-align: center;
}

table {
	width: 100%;
}

tr, td {
	border: 1px gray dotted;
	width: auto%;
}

#main1 {
	width: 28%;
	height: 500px;
	float: left;
	overflow: auto;
}

#main2 {
	width: 40%;
	height: 500px;
	float: left;
	overflow: auto;
}

#main3 {
	width: 5%;
	height: 500px;
	float: left;
	overflow: auto;
}
#main4 {
	width: 20%;
	height: 500px;
	float: left;
	overflow: auto;
}

.search {
	height: 10px;
	font-size: 15px;
	background-color: #3B77AF;
	color: white;
}

.addtable {
	height: 450px;
	overflow: auto;
	}

.but{
margin-top: 200px;
}
.title{
height:10px;
}

</style>
</head>
<body>
	<h1>결재라인 주소록</h1>
	
	
	<div>
		<div id="main1">
			<table>
				<tr class="search">
					<td>주소록</td>
					
				</tr>
				<tr id="Info"></tr>
			</table>
		</div>

		<div id="main2">
			<table>
				<tr class="search">
					<td colspan="5">이름으로 찾기</td>
				</tr>
				<tr>
					<td colspan="4"><input id="name" type="text" name="m_name"></td>
					<td><button id="namesc">검색</button></td>
				</tr>
				<tr>
					<td style="width: 45px;">체크</td>
					<td style="width: 70px;">이름</td>
					<td style="width:112px;">부서</td>
					<td style="width:48px;">직급</td>
					<td style="width:214px;">이메일</td>
				</tr>
				<tbody id="nameInfo">

				</tbody>
			</table>
		</div>
		<div id="main3"><br>
		<button id="addapproval1" class="but">></button><br>
		<button id="deleteCheck1"><</button><br><br><br><br><br>
	<!-- <button id="addapproval2" class="but">></button><br>
	<button id="deleteCheck2"><</button><br><br> -->
	
		</div>
		<div id="main4">
			<h3 class="title">
				결재자<span id="cnt1" style="color:green;">0</span>
			</h3>
			<div class="addtable">
				<table class="table">
				<tr class="search"><td>체크</td><td>이름</td><td>직급</td><td>부서</td></tr>
					<tbody id="addAp1"></tbody>
				</table>
			</div>
			
		</div>
	</div><br>
	<a  href="javascript:sendChildValue()"><button>결재라인 등록</button></a>
</body>
<script>
var count1=0;

function sendChildValue(){
	
	if(count1==0){
		alert("선택한 사람이 없습니다");
	}else if(count1==1){
		
	var code1 = new Array();
	for(var i =0; i<count1; i++){
		code1.push($("#addname1"+i).val());
	}
	
	$.ajax({
		 url:"/erp/rest/Account/approLinecom?code1="+code1,
		 type:'post',
		 datatype:'json',
		 success:function(data){
			 console.log(data);
			 
				 opener.setChildValue(data);

				 window.close();
		 },
		 error:function(error){
			 console.log(error);
			 
		 }
		
	});
	
	} else{
		alert("1명만 선택해 주세요.")
	}
}




$("#deleteCheck1").click(function() {
	var cnt = $("input[name='checknum']:checked").length;
	for (var i = 0; i < $(".check1").length; i++) {
		if ($(".check1")[i].checked == true) {
			$(".check1")[i].parentElement.parentElement.remove();
			i--;
			count1--;
			$("#cnt1").html(count1);
		}
	}
});
	var list = ${aList};
	console.log(list);
	var str = "";
	for (var i = 0; i < list.length; i++) {
		str += "<tr><td><input name='checknum' type='checkbox' value="+list[i].hc_hrcode+"></td><td>"
				+ list[i].m_name + "(" + list[i].m_email + ")" + "</td></tr>";
	}

	$("#Info").append(str);
	  


	$("#namesc").click(function() {
		var str='';
						var name = $("#name").val();
						$.ajax({
							url : '/erp/rest/Account/searchName?name=' + name,
							type : 'post',
							datatype : 'json',
							success : function(data) {
								console.log(data);
								
								for ( var i in data.aList) {
									str += "<tr><td><input name='checknum' type='checkbox' value='"+data.aList[i].hc_hrcode+"'></td>";
									str += "<td>"+ data.aList[i].m_name+ "</td>";
									str += "<td>"+ data.aList[i].hc_dept+ "</td>";
									str += "<td>"+ data.aList[i].hc_position+ "</td>";
									str += "<td>"+ data.aList[i].m_email+ "</td></tr>";
									}
										$("#nameInfo").html(str);
									},
									error : function(error) {
										console.log(error);
									}
								});
					});
	
	   
		var arr;
	$("#addapproval1").click(function(){
		arr = new Array();

		var hrcode="${hrCode}";
		var cnt = $("input[name='checknum']:checked").length;
		
		$("input[name='checknum']:checked").each(function() {
			
			arr.push($(this).attr('value'));
		});
		
		if(arr[0]==hrcode||arr[1]==hrcode||arr[2]==hrcode){
			alert("자신을 결재자로 추가할 수 없습니다.");
			console.log(cnt);
		}else if(cnt>2 || count1==2){
			alert("2명이상  선택 할 수 없습니다.");
			console.log(cnt);
			
		}else if(cnt == 0){
			alert("선택한 이름이 없습니다");
			console.log(cnt);
	}else if($("#addAp1").html()!="" && arr[0]==$("#addname10").val()){
	      alert("이미 추가한 이름입니다.");
	}else if(count1==1 && cnt==2){
		alert("총 2명만 추가 할 수 있습니다.");
	}else{
			   $.ajax({
					url : '/erp/rest/Account/addApproval',
					type : 'post',
					traditional : true,
					data : 'ARR=' + arr + '&CNT=' + cnt,
					datatype : 'json',
					success : function(data) {
						console.log(data);
						var str="";
						if(data.aList.length==1){
							
							for(var i in data.aList){
								str+="<tr><td><input class='check1' type='checkbox'></td>";
								str+="<td><input id='addname1"+count1+"' type='text' value='"+data.aList[i].hc_hrcode+"' hidden='true'>"+data.aList[i].m_name+"</td>";
								str+="<td>"+data.aList[i].hc_position+"</td>";
								str+="<td>"+data.aList[i].hc_dept+"</td></tr>";
										
									}
							$("#addAp1").append(str);
						}else{
							
							for(var i in data.aList){
								str+="<tr><td><input class='check1' type='checkbox'></td>";
								str+="<td><input id='addname1"+i+"' type='text' value='"+data.aList[i].hc_hrcode+"' hidden='true'>"+data.aList[i].m_name+"</td>";
								str+="<td>"+data.aList[i].hc_position+"</td>";
								str+="<td>"+data.aList[i].hc_dept+"</td></tr>";
										
									}
							$("#addAp1").append(str);
						}
						
							
						count1+=Number(cnt);
					     $("#cnt1").html(count1);
				},
					error:function(error){
						console.log(error);
					}	
		
		});
		
	};		
		
	});
		
     

</script>
</html>