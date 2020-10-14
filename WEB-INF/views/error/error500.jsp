<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="/erp/img/favicon.png" rel="icon" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css"
	media="all" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#center {
	text-align: center;
}
</style>
</head>
<body>
	<div id="out" style="height: 100%; width: 100%;">
		<div id="center">
			<img
				src="https://assets.materialup.com/uploads/28eab5e0-b6ca-42c7-bb39-b6155fa2443a/preview.png"></img>
			<br> <a href="javascript:goBack()">이전화면으로</a>
		</div>
	</div>


	<script>
		function goBack() {
			history.go(-1);
		}
	</script>
</body>
</html>
