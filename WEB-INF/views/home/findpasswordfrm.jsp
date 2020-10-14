<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/img/favicon.png" rel="icon" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<style>

/* BASIC */

html {
  height:20px;
  background-color:#3D6B9B;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 200;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px;
  color: #cccccc;
}


/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  margin-bottom: 200px;
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 20px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=password] {
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -50%, 0);
    transform: translate3d(0, -50%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -20%, 0);
    transform: translate3d(0, -20%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}



 #loginContainer {
	width: 300px;
/* 	width: auto; */
	margin-left: 600px;
	margin-top: 170px;
	text-align: center;
}


button {
	margin-top: 10px;
	width: 100px;
	height: 50px;
	border: 0px;
	background-color: #3D6B9B;
	color: white;
	font-weight: bolder;
	border-radius: 8%;
}

.warnMsg {
	color: red;
}

#idserach {
	margin-left: 30px;
}

</style>
</head>

<body>
	<div id="header" class="container" style="text-align: center;">
		<div id="logo">
			<h1>
				<a href="/erp/" style="color: black;">N7 COMPANY</a>
			</h1>
		</div>
<%-- 		<div id="menu">
			<ul>
				<li><a href="/erp/" accesskey="1" title="">MAIN</a></li>
				<li><a href="/erp/introducecompany" accesskey="2" title="">회사
						소개</a></li>
				<li><a href="/erp/erpboard" accesskey="3" title="">상담 게시판</a></li>
				<li><a href="/erp/erpapply" accesskey="4" title="">ERP 신청</a></li>
				<c:if test="${id==null}">
				<li><a href="/erp/join" accesskey="5" title="">JOIN</a></li>
				</c:if>
				<c:if test="${id!=null}">
             	<li><form action="logout" method="post"><button>LOGOUT</button></form></li>
				<li class="current_page_item"><a href="#" accesskey="6">ERP시작</a></li>
				</c:if>
			</ul>
		</div> --%>
	</div>

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first" style="height:100px; , text-align:center;">
      <a href="/erp/" style="color: black;"><img src="img/logo.png" style="width:200px; height:100px;"></a>
    </div>

    <!-- Login Form -->
      <input type="text" style="width:385px;" id="userId" class="form-control" placeholder="id를 입력해주세요" required id="usr">
      <input type="text" style="width:258px;" id="userEmail" class="form-control" name="email" placeholder="email을 입력해주세요" required id="usr">
      <button type="button" class="fadeIn fourth" id="authenticationBtn"  style="width:120px;">인증번호 전송</button>
      <input style="width:258px;" type="text" id="authenticationNum" class="form-control" name="m_pw" placeholder="인증번호를 입력해주세요!" required id="pwd" >
      <button id="checkAuthenticationNumBtn" class="fadeIn fourth" value="LogIn" style="width:120px;">인증번호 확인</button>
      <br>
      <br>

    <span class="warnMsg"></span><br>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <!-- <a class="underlineHover" href="#">Forgot Password?</a> -->
      <a href="/erp/findidfrm">아이디 찾기</a> |
      <a href="/erp/joinpage">회원가입</a>
    </div>
  </div>
</div>
	<script>
		var authenticationNum;
		var userId;
		$("#authenticationBtn").click(
				function() {
					if ($("#userEmail").val() == "") {
						$(".warnMsg").html("email을 입력해주세요!");
						return;
					}
					$.ajax({
						url : "/erp/home/findpassword",
						type : "post",
						dataType : "json",
						data : {
							userEmail : $("#userEmail").val(),
							userId : $("#userId").val()
						},
						success : function(result) {
							if (result == null) {
								$(".warnMsg").html(
										"해당 이메일로 가입된 회원이 없습니다. 다시 확인해 주세요!");
								return;
							} else {
								userId = result.m_id;
								sendAuthenticationNum(result.m_email);
							}
						},
						error : function(err) {

						}
					})
				});
		function sendAuthenticationNum(userEmail) {
			authenticationNum = Math.floor(Math.random() * 8889 + 1111);
			$.ajax({
				url : "/erp/home/sendauthenticationnum",
				type : "post",
				dataType : "json",
				data : {
					userEmail : userEmail,
					authenticationNum : Number(authenticationNum)
				},
				success : function(result) {
					$(".warnMsg").html(result);
					return;
				},
				error : function(err) {
				}
			})
		}
		$("#checkAuthenticationNumBtn").click(function() {
			if ($("#userEmail").val() == "") {
				$(".warnMsg").html("email을 입력해주세요!");
				return;
			}
			if ($("#authenticationNum").val() == "") {
				$(".warnMsg").html("인증번호를 입력해주세요!");
				return;
			}
			if (authenticationNum == $("#authenticationNum").val()) {
				location.href = "/erp/home/modifypasswordfrm?userId=" + userId;
			}
			if (authenticationNum != $("#authenticationNum").val()) {
				$(".warnMsg").html("인증번호가 틀립니다.");
			}
		});
	</script>
</body>
</html>
