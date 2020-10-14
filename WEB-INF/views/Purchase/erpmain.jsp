<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src=/erp/js/menu.js></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>erp 메인</title>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style>
#header{
	width: 100%;
	height: 200px;
}

#side_menu{
 	height: 100%;
 	width: 250px;
	font-size: 20px;
	font-weight: bolder;
	float: left;
	border-right: 1px solid #E6E6E6;
}

#side_menu #menuList{
	list-style: none;
 	margin-top: 150px;
}

#side_menu #menuList li{
 	margin: 20px;
}

a{
	text-decoration: none;
}

#description{
    float:left;
    height:100%;
    width: 1150px;
    position: absolute;
    transform:translate(300px, 0);
}

</style>
</head>
<body>
    <div id="header">
        <div id="logo">
            <h1><a href="/erp/myInfo/myInfo">N7 ERP SYSTEM</a></h1>
    </div>
		<div id="menu">
			<ul>
				<li ><a href="/erp/myInfo/myInfo" accesskey="4" title="">내 정보</a></li>
				<li><a href="/erp/hr/movehrcardpage">사내정보</a></li>
				</ul>
				<ul id="mainmenu"></ul>
		</div>
    </div>
    <div id="side_menu">
        <ul id="menuList">
            <li><a id="pregistration">구매관리</a></li>
            <li><a id="rregistration">반품 관리</a></li>
            <li><a id="oregistration">발주 관리</a></li>
        </ul>
    </div>
    <center>
    <div id="description">

    </div>
    </center>
</body>

<script src=/erp/js/menu.js></script><!-- 메뉴Ajax로 출력 -->
<script>
	$(document).ready(function(){
		 $.ajax({
			   type:'get',
			   url:' /erp/Purchase/pregistration',
			   dataType: 'html',
			   success: function(data){
				   $('#description').html(data);
				   console.log(data);

			   },
			   error: function(err){
				   console.log(err);
			   }
		   });
	});

    $("#pregistration").click(function(){
	   $.ajax({
		   type:'get',
		   url:' /erp/Purchase/pregistration',
		   dataType: 'html',
		   success: function(data){
			   $('#description').html(data);
			   console.log(data);

		   },
		   error: function(err){
			   console.log(err);
		   }
	   });
   });

   $("#rregistration").click(function(){
	   $.ajax({
		   type:'get',
		   url:' /erp/Purchase/retrunregistration',
		   dataType: 'html',
		   success: function(data){
			   $("#description").html(data);
		   },
		   error: function(err){
			   console.log(err);
		   }
	   });
   });

   $("#oregistration").click(function(){
	   $.ajax({
		   type:'get',
		   url:' /erp/Purchase/orderregistration',
		   dataType: 'html',
		   success: function(data){
			   $("#description").html(data);
		   },
		   error: function(err){
			   console.log(err);
		   }
	   });
   });


</script>
</html>
