<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/img/favicon.png" rel="icon" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
   media="all" />
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
<title>게시판 상세보기</title>

<style>
h2{
font-size: 26px;
margin-top:15px;
margin-bottom: 10px;
margin-left: auto;
font-family: inherit;
font-weight: 400;
color: inherit;
text-transform: uppercase;
display: block;
text-align: center;
}
table#table {
border-collapse: separate;
border-spacing: 0;
text-align: left;
line-height: 1.5;
border-top: 1px solid #ccc;
border-left: 1px solid #ccc;
margin : 20px 10px;
text-align: center;
margin-left: -10px; 
margin-top: 20px;
}
table#table th {
width: 100px;
padding: 10px;
font-weight: bold;
vertical-align: top;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
border-top: 1px solid #fff;
border-left: 1px solid #fff;
background: #eee;
}
table#table td {
width: 250px;
padding: 10px;
vertical-align: top;
border-right: 1px solid #ccc;
border-bottom: 1px solid #ccc;
}
#aaa{
float: left;
margin-left: 315px;
}
#container2{
margin-top: 15px;
}

</style>
</head>
<body>
	<div id="header" class="container" style="text-align: center;">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black; font-weight: 500; font-size: 46px; margin-left: 30px;">N7 COMPANY</a>
			</h1>
		</div>
		<div id="menu"></div>
	</div>
	<div id="description" class="out" style="height: 700px;">
	<div style='width: 100%; height: 60px; text-align:center; background-color: #3D6B9B;'>
		<a href="/erp/home/erpboard" style='color: white; line-height: 2.0; margin-right:25px; text-decoration: none; font-weight: 200; font-size: 30px;'>상세보기</a>
	</div>
	<div class="center">
        <div id="container2">
		<table id="table" style="width:600px;">
			<tr>
				<th scope="row">글 번호</th>
				<td id="num">${board.cb_num}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${board.cb_writer}</td>
			</tr>
			<tr>
				<th scope="row">글 제목</th>
				<td>${board.cb_title}</td>
			</tr>
			<tr>
				<th scope="row">글 내용</th>
				<td>${board.cb_contents}</td>
			</tr>
			<tr>
			<th>댓글</th><td id="response">${board.cb_reply}</td>
			</tr>
			<tr>
			<th>비밀번호</th><td><input type="password" id="password" placeholder="삭제 시  입력해 주세요." style="text-align:center; height: 30px; border: 1px solid white;"/></td>
			</tr>
			<c:choose>
			<c:when test="${id eq 'admin'}">
			<tr>
			<td colspan="2"><textarea rows="10" cols="90" id="reply" style="resize: none;"></textarea><br><button id="commit">댓글등록</button></td>
			</tr>
			</c:when>
			</c:choose>
		</table>
		</div>
		<a href="/erp/home/erpboard" style="text-decoration: none;"><button id="aaa">뒤로</button></a>&nbsp;
		<c:choose>
			<c:when test="${id==null}">
		  <button type="button" id="delete">삭제</button>
			</c:when>
			<c:when test="${id eq 'admin'}">
		  <button type="button" id="admindelete" value="${board.cb_password}">삭제</button>
			</c:when>
			</c:choose>
	</div>
</div>

</body>
<script>

$("#commit").click(function(){
	var num = $("#num").html();
	var reply = $("#reply").val();
	$.ajax({
		url:'/erp/rest/home/insertReply',
		type:'post',
		data:{num:num,reply:reply},
		dataType:'json',
		success:function(data){
			console.log(data);
			$("#response").html(data.cb.cb_reply);
			$("#reply").val("");
		},
		error:function(error){
			console.log(error);
		}

	});

});

$("#delete").click(function(){
	var num = Number($("#num").html());
	var password = $("#password").val();
	$.ajax({
		url:'/erp/rest/home/delectBoard',
		type:'post',
		data:{num:num,password:password},
		dataType:'json',
		success:function(data){
			if(data==1){
				alert("삭제완료");
				location.href="/erp/home/erpboard";
			}else{
				alert("비번이 맞지 않습니다.");
			}

		},
		error:function(error){
			console.log(error);
		}

	});
});

$("#admindelete").click(function(){
	var num = $("#num").html();
	var password = $("#admindelete").val();
	$.ajax({
		url:'/erp/rest/home/delectBoard',
		type:'post',
		data:{num:num,password:password},
		dataType:'json',
		success:function(data){
			if(data==1){
				alert("삭제완료");
				location.href="/erp/home/erpboard";
			}else{
				alert("비번이 맞지 않습니다.");
			}

		},
		error:function(error){
			console.log(error);
		}

	});
});

</script>
</html>
