<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
		<link href="/erp/img/favicon.png" rel="icon" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
.List {
border-collapse: collapse;
border-top: 3px solid #168;
}
.List th {
color: #168; 
font-size: 15px;
background: #f0f6f9;
text-align: center;
} 
.List th, .List td {
padding: 10px;
border: 1px solid #ddd;
text-align: center;
}
.List th:first-child, .List td:first-child {
border-left: 0;
}
.List th:last-child, .List td:last-child {
border-right: 0;
}
.List tr td:first-child{
text-align: center;
}
#paging{
display: block;
text-align: center;
margin-top: 15px;
margin-left: 5px;
padding-bottom: 12px;
}
#bbb{
float: right;
margin-top: 10px;
}
#ccc{
position:relative;
float: right;
margin-top: 10px;
padding-bottom: 20px;
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
		<a href="/erp/home/erpboard" style='color: white; line-height: 2.0; margin-right:25px; text-decoration: none; font-weight: 200; font-size: 30px;'>ERP상담게시판</a>
	</div>
	<div class="center">
	<form action="erpboard">
	<div id="a">
<!-- 		<h2>상담 게시판</h2> -->
		<table class="List">
			<tr>
				<th style="width: 100px;">번호</th>
				<th style="width: 800px;">제목</th>
				<th style="width: 200px;">작성자</th>
			</tr>
		</table>
	</div>
   <div id="bbb"><a href="/erp/home/writeFrm" style="text-decoration: none;"><button type="button" id="writebtn">글쓰기</button></a></div>
	</form>
	<div align="cneter" id="paging">${paging}</div>
 	<div id="ccc">
		<select id="choice" style="height: 25px;">
			<option value="CB_TITLE">제목</option>
			<option value="CB_WRITER">작성자</option>
		</select>
		<input type="text" id="keyword" name="search" style="height:20px;" />
		<button type="button" id="searchbtn">검색</button>
	</div>
	</div>
	</div>
</body>
<script>
		var bList=${bList};

	$(document).ready(function(){
		var str="";
		for(var i=0; i<bList.length; i++){

		var type=bList[i].cb_type;
			str+="<tr><td>"+bList[i].cb_num+"</td>";
			if(type=="a"){
			str+="<td><a style='text-decoration: none;' href='/erp/home/boardContents?CB_NUM="+bList[i].cb_num +"'>"+bList[i].cb_title+"</a></td>";
			}else{
			str+="<td><a style='text-decoration: none;' href='#' onclick='secret(\""+bList[i].cb_num+"\",\""+bList[i].cb_password+"\")'>비밀글입니다</a></td>";
			}

			str+="<td>"+bList[i].cb_writer+"</td></tr>";
		}
		$(".List").append(str);
		console.log(bList);
	});


	function secret(num,password){
		var id="${id}";
		if(id=="admin"){
        	location.href="/erp/home/boardContents?CB_NUM="+num;
		}else{
      var passwordNum = prompt("비밀글 입니다! 비밀번호를 입력해주세요");
        if(passwordNum==password){
        	location.href="/erp/home/boardContents?CB_NUM="+num;
        }else{
        	alert("비밀번호가 틀립니다.");
        }
		}
	};

	$("#searchbtn").click(function(){
        var pageNum=0;
		var choice= $("#choice").val();
		var keyword= $("#keyword").val();
		console.log(choice);
		console.log(keyword);

		if(keyword==""){
			alert("검색어를 입력해 주세요");
		}else{
		$.ajax({
			url: "/erp/rest/home/boardSearch",
			type: "post",
			data: "choice="+choice+"&keyword="+keyword,
			dataType: 'json',
			success: function(data){
				$(".List").html("");
				console.log(data);
				 var str="";
				 str+="<tr style='background-color: #3D6B9B; width: 350px; color:white;'><th scope='row'style='width: 100px;'>번호</th><th scope='row' style='width: 800px;'>제목</th><th scope='row' style='width: 200px;'>작성자</th></tr>";
				 if(data.bList!=""){
					 for(var i=0; i<data.bList.length; i++){
						 str+="<tr><td>"+data.bList[i].cb_num+"</td>";
						 str+="<td><a style='text-decoration: none;' href='/erp/home/boardContents?CB_NUM="+data.bList[i].cb_num+"'>"+data.bList[i].cb_title+"</a></td>";
						 str+="<td>"+data.bList[i].cb_writer+"</td></tr>";
						}
					 pageNum=data.bList.length;
					 console.log(pageNum);

						$(".List").html(str);
						var totalData = pageNum;
						var pageCount=0;
					    var dataPerPage = 10;
					    if(pageNum<10){
					       pageCount = 1;

					    }else{

					       pageCount = 5;
					    }


					        paging(totalData, dataPerPage, pageCount, 1);


					    function paging(totalData, dataPerPage, pageCount, currentPage){

					        console.log("currentPage : " + currentPage);

					        var totalPage = Math.ceil(totalData/dataPerPage);
					        var pageGroup = Math.ceil(currentPage/pageCount);

					        console.log("pageGroup : " + pageGroup);

					        var last = pageGroup * pageCount;
					        if(last > totalPage)
					            last = totalPage;
					        var first = last - (pageCount-1);
					        var next = last+1;
					        var prev = first-1;

					        console.log("last : " + last);
					        console.log("first : " + first);
					        console.log("next : " + next);
					        console.log("prev : " + prev);

					        var $pingingView = $("#paging");

					        var html = "";

					        if(prev > 0)
					            html += "<a style='text-decoration: none;' href=# id='prev'><</a> ";

					        for(var i=first; i <= last; i++){
					            html += "<a style='text-decoration: none;' href='#' id=" + i + ">[ " + i + " ]</a> ";
					        }

					        if(last < totalPage)
					            html += "<a href=# id='next'>></a>";

					        $("#paging").html(html);
					        $("#paging a").css("color", "black");
					        $("#paging a#" + currentPage).css({"text-decoration":"none",
					                                           "color":"red",
					                                           "font-weight":"500"});

					        $("#paging a").click(function(){

					            var $item = $(this);
					            var $id = $item.attr("id");
					            var selectedPage = $item.text();

					            if($id == "next")    selectedPage = next;
					            if($id == "prev")    selectedPage = prev;

					            paging(totalData, dataPerPage, pageCount, selectedPage);
					        });

					    }
				 }else{

					alert("데이터가 없습니다.");
					console.log(data);
					 var str="";
					 str+="<tr style='background-color: #3D6B9B; width: 350px; color:white;'><th scope='row'style='width: 100px;'>번호</th><th scope='row' style='width: 800px;'>제목</th><th scope='row' style='width: 200px;'>작성자</th></tr>";
					 $(".List").html(str);
					 $("#paging").html("");
				 }
			 },
			error: function(err){
				console.log(err);
			}
		});
		}
	});

</script>
</html>
