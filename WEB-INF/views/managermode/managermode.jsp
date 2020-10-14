<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/erp/img/favicon.png" rel="icon" />
	<!-- BOOTSTRAP STYLES-->
    <link href="/erp/assets/css/bootstrap.css" rel="stylesheet">
     <!-- FONTAWESOME STYLES-->
    <link href="/erp/assets/css/font-awesome.css" rel="stylesheet">
        <!-- CUSTOM STYLES-->
    <link href="/erp/assets/css/custom.css" rel="stylesheet">
     <!-- GOOGLE FONTS-->
   <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="/erp/assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="/erp/assets/js/bootstrap.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="/erp/assets/js/custom.js"></script>
<meta charset="UTF-8">
<title>관리자모드</title>
<style>
.div-square{
height: 500px;
width: 40%;
float: left;
margin-left: 50px;
}
.badge{
width:100%;
}

#save{
float: right;
}
</style>
</head>
<body>

     
           
          
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top" style="background-color: #3D6B9B">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img src="/erp/img/logo.png" style="width:200px; height: 60px;">

                    </a>
                    
                </div>
              
                <span class="logout-spn">
                  <a href="#" onclick="window.close()" style="color:#fff;">나가기</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 


                    <li class="active-link">
                        <a href="/erp/managermode/managermode"><i class="fa fa-desktop "></i>메뉴관리 </a>
                    </li>
                   

                    <li>
                        <a id="company"><i class="fa fa-table "></i>회사정보</a>
                    </li>
                    <li>
                        <a id="erpmanage"><i class="fa fa-edit "></i>부서관리</a>
                    </li>
                    
                    
                </ul>
                            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>메뉴관리</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr>
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>원하시는 메뉴를 선택해 주세요. </strong><button class="btn btn-success" id="save">저장</button>
                        </div>
                       
                    </div>
                    </div>
               
                    
                  <!-- /. ROW  --> 
                  <div>
                            <div class="row text-center pad-top">
                            
                            <div class="div-square" >
                            <span class="badge">선택할 메뉴</span>
                              <ul class="nav" id="menu">
                      
                              </ul>
                            </div >
                            
                            
                            <div class="div-square" >
                            <span class="badge">선택한 메뉴</span>
                             <ul class="nav" id="addmenu">
                      
                              </ul>
                            </div >
                            </div>
                
                 <!-- /. ROW  -->   
				  <div class="row">
                    <div class="col-lg-12 ">
					<br>
                        <div class="alert alert-danger">
                             <strong>문제가 있으신가요?</strong> 오류 및 문제점 문의는 <a target="_blank" href="http://localhost/erp/access">여기를 클릭하세요</a>.
                        </div>
                       
                    </div>
                    </div>
                  <!-- /. ROW  --> 
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
        </div>
    <div class="footer">
            <div class="row">
                <div class="col-lg-12">
                    ©  2014 yourdomain.com | Design by: <a href="http://binarytheme.com" style="color:#fff;" target="_blank">www.binarytheme.com</a>
                </div>
            </div>
        </div>
</body>

<script>
   $("#erpmanage").click(function(){
	   $.ajax({
			url:'/erp/managermode/erpmanage',
			type:'get',
			success:function(data){
				console.log(data);
				$("#page-wrapper").html(data);
				$(".active-link").attr("class","none");
			},
			error:function(error){
				console.log(error);
			}
			
			  
		  });
	   
   });

   $("#company").click(function(){
	  $.ajax({
		url:'/erp/managermode/Company',
		type:'get',
		success:function(data){
			console.log(data);
			$("#page-wrapper").html(data);
			$(".active-link").attr("class","none");
		},
		error:function(error){
			console.log(error);
		}
		
		  
	  });
	  
	   
   });


var clientMenu= new Array();
var newMenu= new Array();

	$(document).ready(function(){
		
$.ajax({
	 url:'/erp/rest/managermode/getaddmenu',
	 type:'get',
	 datatype:'json',
	 success:function(data){
		 //console.log(data);
		 var str="";
		 if(data.mList==null){
		 $("#addmenu").html(str);
			 
		 }else{
			 
		 for(var i in data.mList){
			 clientMenu.push(data.mList[i].f_functions);
		        str+="<li id='"+data.mList[i].f_functions+"'><a href='#' onclick=addmenu('"+data.mList[i].f_functions+"') return false>"+data.mList[i].f_functions+"</a></li>";
		 }
		 console.log(clientMenu);
		 $("#addmenu").html(str);
		 }
		 
		 $.ajax({
			 url:'/erp/rest/managermode/getmenu',
			 type:'get',
			 datatype:'json',
			 success:function(data){
				 //console.log(data);
				 var str="";
				 
				 for(var i in data.mList){
					 newMenu.push(data.mList[i].m_menu);
				 }
				
				 newMenu = newMenu.sort();
				 clientMenu = clientMenu.sort();
				
				 for(var i=0; i<clientMenu.length; i++){
					 newMenu.splice(newMenu.indexOf(clientMenu[i]),1)
				 }
				 console.log(newMenu);
				for(var i=0; i<newMenu.length; i++){
				 str+="<li id='"+newMenu[i]+"'><a href='#' onclick=addmenu('"+newMenu[i]+"') return false>"+newMenu[i]+"</a></li>"; 
					
				}
				 $("#menu").html(str);
		 	 },
			 error:function(error){
				
				 console.log(error);
				 
			 }
			  
		  });
	 },
	 error:function(error){
		
		 console.log(error);
		 
	 }
	  
 });


  
	});

  
  var menuName= new Array();
  var count =0;
function addmenu(menu){
	var clientMenu2 = clientMenu.indexOf(menu);
	var addmenu = $("#"+menu).html();
    if($("#"+menu).parent().attr("id")=="menu"){
    	clientMenu.push(menu);
	 $("#"+menu).remove();
	 $("#addmenu").append("<li id='"+menu+"'>"+addmenu+"</li>");
	
    }else{
	 $("#"+menu).remove();
	 $("#menu").append("<li id='"+menu+"'>"+addmenu+"</li>");
	 clientMenu.splice(clientMenu2,1);
    }
	
};

   $("#save").click(function(){
	   console.log(clientMenu);
	   clientMenu.sort();
	   console.log(clientMenu);
	   if($("#addmenu").html()==""){
		   alert("선택한 메뉴가 없습니다.");
	   }else{
		   
	   $.ajax({
		  url:'/erp/rest/managermode/addmenu',
		  type:'post',
		  traditional : true,
		  data:'MENU='+clientMenu,
		  success:function(data){
			  console.log(data);
				 alert("저장완료");
		  },
		  error:function(error){
			  console.log(error);
		  }
		  
	   });
		   
	   }
	  
	   
	   
   });

   
</script>
</html>