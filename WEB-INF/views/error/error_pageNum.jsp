<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="/erp/img/favicon.png" rel="icon" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>error_pageNum.jsp</h1>
<h3>${exception.getMessage()}</h3>
<ul>
	<c:forEach items="${exception.getStackTrace()}" var="stack">
		<li>${stack}</li>	
	</c:forEach>
</ul>
</body>
</html>