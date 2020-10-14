<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>게시판 글쓰기</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/location.css" rel="stylesheet" type="text/css" media="all" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/erp/ckeditor/ckeditor.js"></script>
<link href="/erp/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- BOOTSTRAP STYLES-->
<link href="/erp/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/erp/assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/erp/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href="http://fonts.googleapis.com/css?family=Open+Sans" />
<!-- /. WRAPPER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="/erp/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="/erp/assets/js/bootstrap.min.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="/erp/assets/js/custom.js"></script>
<link href="/erp/img/favicon.png" rel="icon" />
<style type="text/css">
#h1{
font-size: 30px;
margin-top: 15px;
margin-bottom: 10px;
font-family: inherit;
font-weight: 400;
color: inherit;
text-transform: uppercase;
display: block;
}
#container2 {
margin-top: 50px;
margin-left: 30%;
width: 800px;
} 
#footer {
margin-right: 20%;
} 
body{
text-align:center;
position: relative;
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
		<a href="/erp/home/erpboard" style='color: white; line-height: 2.0; margin-right:25px; text-decoration: none; font-weight: 200; font-size: 30px;'>ERP 상담게시판 글쓰기</a>
	</div>
      <div id="container2" style="text-align: center;">
	<form id="boardData">
		<table>
               <tr>
                  <td colspan="2">
                  	<label><input type="radio" class="writeclass" id="check1" checked="checked" name="cb_type" value="a" />&nbsp;공개글&nbsp;</label>
                    <label><input type="radio" class="writeclass" id="check2" name="cb_type" value="b" />&nbsp;비밀글</label><br><br>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class='input-group'>
                        <span class='input-group-addon' style="width: 81px;">작성자</span>
                        <input type="text" name="cb_writer" class="form-control" placeholder="작성자" required="required" style="width:240px;"/>
                        <span class='input-group-addon' style="width: 81px;">비밀번호</span> 
                        <input type="password" name="cb_password" class="form-control" placeholder="비밀번호" required="required" style="width:240px;" />
                     </div>
<!--                      <div class='input-group'></div> -->
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class='input-group'>
                        <span class='input-group-addon' style="width: 81px;">제목</span> 
                        <input type='text' name='cb_title' class='form-control' style="width: 562px;" placeholder="내용을 입력해주세요." />
                     </div>
                  </td>
               </tr>
               <tr>
                  <th>
                     <div class='input-group'>
                        <span class='input-group-addon' style="width: 81px;">내용</span>
                        <textarea rows="15" cols="105" id="contents" name="cb_contents" class="form-control" required="required" placeholder="내용을 입력해주세요."></textarea>
                     </div>
                  </th>
               </tr>
               <tr>
               </tr>
            </table>
	</form>
	<div id="footer">
		  <button type="button" id="submit">등록</button>
          <button type="reset">다시쓰기</button>
          <a href="/erp/home/erpboard" style="text-decoration: none;">
          <button type="button">뒤로</button></a>
	</div>
	</div>
	</div>
</body>
<script>
$("#submit").click(function(){
	   var obj = $("#boardData").serialize();
	   $.ajax({
	      url:'/erp/rest/home/writeBoard',
	      type:'post',
	      data:obj,
	      dataType:'json',
	      success:function(data){
	         console.log(data);
	         if(data==1){
	            alert("등록완료");
	            location.href="/erp/home/erpboard";
	         }else{
	            alert("등록실패");
	         }

	      },
	      error:function(error){
	         console.log(error);
	      }
	    });

	});
	</script>
</html>
