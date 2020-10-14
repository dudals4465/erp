<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link href="/erp/img/favicon.png" rel="icon" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" type="text/css"></link>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>


<style>
/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/

.border-md {
    border-width: 2px;
}

.btn-facebook {
    background: #405D9D;
    border: none;
}

.btn-facebook:hover, .btn-facebook:focus {
    background: #314879;
}

.btn-twitter {
    background: #42AEEC;
    border: none;
}

.btn-twitter:hover, .btn-twitter:focus {
    background: #1799e4;
}



/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/

body {
    min-height: 100vh;
    height: 800px;
}

.form-control:not(select) {
    padding: 1.5rem 0.5rem;
}

select.form-control {
    height: 52px;
    padding-left: 0.5rem;
}

.form-control::placeholder {
    color: #ccc;
    font-weight: bold;
    font-size: 0.9rem;
}
.form-control:focus {
    box-shadow: none;
}


/* #joinContainer {
	margin-top: 50px;
	width: 340px;
	margin-left: 600px;
	margin-bottom: 100px;
}

select {
	width: 300px;
	height: 35px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
} */

button {
	margin-top: 10px;
/* 	margin-left: 90px; */
	width: 100px;
	height: 50px;
	border: 0px;
	background-color: #FFB2D9;
	color: white;
	font-weight: bolder;
	border-radius: 8%;
}

.file_input label {
    position:relative;
    border-radius: 8px;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:40px; 
    background:#3D6B9B;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
#file_route {
    vertical-align:middle;
    display:inline-block;
	width:370px;
    height:35px;
    line-height:28px;
    font-size:20px;
    padding:0;
    border:0;
    
}

#file{
font-family:sans-serif;
font-weight:bold;
}
출처: https://uidevelop.tistory.com/29 [UI Develop]
</style>
</head>

<body>
<!-- Navbar-->
<header class="header">
    <nav class="navbar navbar-expand-lg navbar-light py-3">
        <div class="container" style="padding-top:30px;">
<!--      Navbar Brand
            <a href="#" class="navbar-brand">
                <img src="https://res.cloudinary.com/mhmd/image/upload/v1571398888/Group_1514_tjekh3_zkts1c.svg" alt="logo" width="150">
            </a> -->
			<h3><a href="/erp/" style="color: black;  text-decoration: none;">N7 ERP SYSTEM</a></h3>
		</div>
        </div>
    </nav>
</header>


<div class="container">
    <div class="row py-5 mt-4 align-items-center" style="height:300px;">
        <div class="col-md-5 pr-lg-5 mb-5 mb-md-0">
            <img src="https://res.cloudinary.com/mhmd/image/upload/v1569543678/form_d9sh6m.svg" alt="" class="img-fluid mb-3 d-none d-md-block">
            <h1>Create an Account</h1>
            <p class="font-italic text-muted mb-0">Create a minimal registeration page using Bootstrap 4 HTML form elements.</p>
            <p class="font-italic text-muted">Snippet By <a href="https://bootstrapious.com" class="text-muted">
                <u>Bootstrapious</u></a>
            </p>
        </div>

        <!-- Registeration Form -->
        <div class="col-md-7 col-lg-6 ml-auto">
            <form id="form" name="form" action="join" method="post" enctype="multipart/form-data" onsubmit="return sum();">
                <div class="row" style="margin-right:-25px;">

      <!--               id
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                         <p class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted"></i>
                         </p>
                        </div>
                    <div><input id="id" type="text" name="m_id" placeholder="ID를 입력해주세요" class="form-control bg-white border-left-0 border-md" style="width:300px;" required></div> oninput="dupleID()"
                         &nbsp;&nbsp;<button type="button" onclick="dupleID()" style="width: 100px; height: 40px; background-color:#3D6B9B; ">중복체크</button>
                        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id="dupleID"></div>
                    </div> -->

                     <div class="input-group col-lg-12 mb-4">
                           <div class="input-group-prepend">
                             <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-user text-muted" style='font-size:15px'></i>
                            </span>
                        </div>
                       <input id="id" type="text" name="m_id" style="width:300px;" placeholder="ID를 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required>
                      &nbsp;&nbsp;<button type="button" onclick="dupleID()" style="width: 100px; height: 40px; background-color:#3D6B9B; ">중복체크</button>
                      <br><span id="dupleID"></span>
                    </div>


                    <!-- passward -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                             <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-lock' style="font-size:15px color:gray;"></i>
                            </span>
                        </div>
                    <input type="password" style="width:300px;" class="form-control bg-white border-left-0 border-md" placeholder="password를 입력해주세요" required id="pw" name="m_pw" required/>
                    </div>

                    <!-- name -->
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-pencil-alt' style="font-size:15px"></i>
                            </span>
                        </div>
                        <input id="name" style="width:200px;" type="text" name="m_name" placeholder="이름을 입력해주세요" class="form-control bg-white border-left-0 border-md" required>
                    </div>

<!--                     companycode
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-address-card' style='font-size:15px'></i>
                            </span>
                        </div>


                     <font style="color:gray;">회사코드가 없으신분은</font><font style="font-weight : bold;">N7</font><font style="color:gray;">을 입력해주세요.</font><br/>
                          <br>
                          <br>
                    <div><input id="cCode" type="text" style="width:300px;" name="m_ccode" placeholder="회사코드가 없으신분은 N7을 입력해주세요" class="form-control postcodify_address bg-white border-md border-left-0 pl-3" required></div>
                        &nbsp;&nbsp;<button type="button" onclick="dupleCCode()" style="width: 100px; height: 40px; background-color:#3D6B9B; ">코드확인</button>
                        <br><span id="dupleCCode"></span>
                    </div> -->

                     <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-address-card' style='font-size:15px'></i>
                            </span>
                        </div>
                      <input id="cCode" type="text" style="width:300px;" name="m_ccode" placeholder="회사코드를 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required>
                      &nbsp;&nbsp;<button type="button" onclick="dupleCCode()" style="width: 100px; height: 40px; background-color:#3D6B9B; ">코드확인</button>
                      <br><span id="dupleCCode"></span>
                    </div>


                    <!--email-->
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-envelope-open' style='font-size:15px'></i>
                            </span>
                        </div>
                      <input type="email" id="m_email" style="width:300px;" name="m_email" placeholder="이메일을 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required>
                      &nbsp;&nbsp;<button type="button" id="authenticationBtn" style="width: 100px; height: 40px; background-color:#3D6B9B; ">번호 전송</button>
                    </div>
                    <div class="input-group col-lg-12 mb-4">
                         <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                            </span>
                        </div>
                      <input type="text" style="width:300px;" id="authenticationNum" placeholder="인증번호를 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" required>
                      &nbsp;&nbsp;<button type="button" id="checkAuthenticationNumBtn" style="width: 100px; height: 40px; background-color:#3D6B9B; ">번호 확인</button>
                    </div>

                    <!-- 주소 -->
                    <div class="input-group col-lg-12 mb-4">
                        <div class="input-group-prepend">
                            <p class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-home' style='font-size:15px'></i>
                            </p>

                        </div>
					    <input type="text" style="width:300px;" id="roadAddrPart1" name="roadAddrPart1" class="form-control postcodify_address bg-white border-md border-left-0 pl-3" value="" /><br>
                        &nbsp;&nbsp;<button type="button" onclick="goPopup()" style="width: 100px; height: 40px; background-color:#3D6B9B; ">주소검색</button>
                   </div>
                    
                    <!-- 주민번호 -->
             	<div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class='fas fa-address-card' style='font-size:15px'></i>
                            </span>
                        </div>
                        <input type="text" name="m_birth" placeholder="주민번호 앞 6자리를 입력해주세요" maxlength="6" class="form-control bg-white border-md border-left-0 pl-3"/>
                    </div>

                    <!-- phone-->
                     <div class="input-group col-lg-6 mb-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-white px-4 border-md border-right-0">
                                <i class="fa fa-phone-square text-muted"></i>
                            </span>
                        </div>
                      <input  type="text" name="m_phonenum" placeholder="핸드폰 번호를 입력해주세요" class="form-control bg-white border-md border-left-0 pl-3" />
                    </div>

                   <!--file-->
                     <div class="input-group col-lg-12 mb-4">
                            <span class="input-group-text bg-white px-4 border-md" style="margin-right: 10px;">
                                <i class='fas fa-images' style='font-size:15px'></i>
    <input type="text" readonly="readonly" title="File Route" id="file_route" />
                            </span>
                    <div class="file_input" style="margin-top: 10px;" >
    <label style="padding-top: 5px; font-size: medium;">
        <span id="file">파일첨부</span>
        <input type="file" name="m_photo" onchange="javascript:document.getElementById('file_route').value=this.value" />
    </label>
</div>


                    </div>


                    <!-- join -->
                    <div class="form-group col-lg-12 mx-auto mb-0">
                        <input type="hidden" name="m_address" id="addr"></input>
<!--                          <a href="#" class="btn btn-primary btn-block py-2">
                            <span class="font-weight-bold">Create your account</span>
                        </a> -->
                        <button class="btn btn-primary btn-block py-2" type="submit">Create your account</button>
                    </div>

                   <!--  Divider Text -->
                    <div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                        <div class="border-bottom w-100 ml-5"></div>
                        <span class="px-2 small text-muted font-weight-bold text-muted">OR</span>
                        <div class="border-bottom w-100 mr-5"></div>
                    </div>

                    <!-- Already Registered -->
                    <div class="text-center w-100">
                        <p class="text-muted font-weight-bold">Already Registered? <a href="/erp/login" class="text-primary ml-2">Login</a></p>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


	<script>
	var authenticationNum;
	var userId;
	var a = false;
	$("#authenticationBtn").click(function(){
			authenticationNum = Math.floor(Math.random() * 8889 + 1111);
			$.ajax({
				url : "/erp/home/sendauthenticationnum",
				type : "post",
				dataType : "json",
				data : {
					userEmail : $("#m_email").val(),
					authenticationNum : Number(authenticationNum),
					type:'join'
				},
				success : function(result) {
					alert(result)
					return;
				},
				error : function(err) {
				}
			})
			});

	$("#checkAuthenticationNumBtn").click(function() {
		if ($("#userEmail").val() == "") {
			$(".warnMsg").html("email을 입력해주세요!");
			a = false;
			return;
		}
		if ($("#authenticationNum").val() == "") {
			$(".warnMsg").html("인증번호를 입력해주세요!");
			a = false;
			return;
		}
		if (authenticationNum == $("#authenticationNum").val()) {
			a = true;
			alert("인증되었습니다.")
		}
		if (authenticationNum != $("#authenticationNum").val()) {
			alert("인증번호가 틀립니다.")
			a = false;
		}
	});
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.form.roadAddrPart1.value = roadAddrPart1;
}
	function goPopup(){
		// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
		window.name="jusoPopup";

		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/erp/home/jusopopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}
	// For Demo Purpose [Changing input group text on focus]
	$(function () {
	    $('input, select').on('focus', function () {
	        $(this).parent().find('.input-group-text').css('border-color', '#80bdff');
	    });
	    $('input, select').on('blur', function () {
	        $(this).parent().find('.input-group-text').css('border-color', '#ced4da');
	    });
	});


		var checkid;
		var checkccode
		$("#searchAddr").click(function () {
			// IE에서 opener관련 오류가 발생하는 경우, window에 이름을 명시해줍니다.
			window.name = "jusoPopup";

			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("/erp/jusopopup", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		})

		function jusoCallBack(roadAddrPart1) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadAddrPart1.value = roadAddrPart1;
		}
	function dupleID() {
		var $id = $("#id").val()
		if ($id == null || $id =='') {
			$("#dupleID").html( "<font style='color:red;'>ID를 입력해주세요.</font>");
			} else {
	console.log($id)
	$ .ajax({ url : "/erp/rest/home/dupleid",
		data : {m_id : $id },
		dataType : "text",
		method : "get",
		async : false,
		success	: function(data) {
			console.log(data)
			if (data == 1) {
				checkid = false;
	$("#dupleID") .html( "<font style='color:red;'>아이디가 중복됩니다.</font>");
	} else {
		checkid = true;
		$("#dupleID").html("<font style='color:blue;'>가능한 아이디입니다.</font>"); }
	},
	error :	function(err) {
		console.log(err);
		}
	});
	}
	}
	function dupleCCode() {
		var	$cCode = $("#cCode").val();
		console.log($cCode);
		$ .ajax({ url :	"/erp/rest/home/dupleccode",
			data : { m_ccode : $cCode },
			dataType :	"text",
			method : "get",
			async : false,
			success : function(data) {
	console.log(data)
	if (data == 1) {
		checkccode = true;
	$("#dupleCCode").html("<font style='color:blue;'>해당 회사코드가 존재합니다.</font>");
	} else {
		checkccode	= false;
		$("#dupleCCode") .html( "<font style='color:red;'>해당 회사코드가 존재하지 않습니다.</font>");
		}
	},
	error :	function(err) {
		console.log(err); } }) }

	function sum() {
		if(!a){
			alert("이메일을 인증해 주세요!")
			return false;
		}
	console.log(checkid, checkccode);
	if (checkid && checkccode) {
	$("#addr").val( $('#roadAddrPart1').val()); return true;
	} else {
		alert("회사코드 혹은 아이디 중복을 확인해주세요.");
	return false;
	}
	}
	</script>
</body>
</html>
