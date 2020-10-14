<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사정보</title>
<link href="/erp/img/favicon.png" rel="icon" />
<style>
.company-div{
border: 3px double #e1e1e1;
border-radius: 8px;
height: 500px;
width:80%;
margin-left: 100px;
text-align: center;
}
 table {
    margin-top:100px;
    margin-left:30px;
    width: 700px;
    border: 3px double #e1e1e1;
    border-collapse: collapse;
    border-radius: 8px;
    text-align: center;
  }
  th, td {
    border: 3px double #e1e1e1;
    padding: 10px;
  }
</style>
</head>
<body>

            <div id="page-inner">
                <div class="row">
                    <div class="col-lg-12">
                     <h2>회사정보</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr>
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="alert alert-info">
                             <strong>원하시는 회사정보를 수정해 주세요. </strong><button class="btn btn-success" id="save">저장</button>
                        </div>
                       
                    </div>
                    </div>
                   
                    
                  <!-- /. ROW  --> 
                  <div>
                            <div class="row text-center pad-top">
                            <form id="comInfo">
                            <div class="company-div" >
                
            
             </div >
                            
                            </form>
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
    </div>
            </div>
        
  
</body>
<script>
     $("#save").click(function(){
    	 var obj = $("#comInfo").serialize();
    	 
    	$.ajax({
    		url:'/erp/rest/managermode/companyUpdate',
    		type:'post',
    		data:obj,
    		success:function(data){
   alert("저장 완료");
    		},
    		error:function(error){
    			console.log(error);
    		}
    		
    	});
    	 
     });

 $(document).ready(function(){
	 
    $.ajax({
    	url:'/erp/rest/managermode/getCompanyInfo',
    	type:'get',
    	datatype:'json',
    	success:function(data){
    		console.log(data);
    		var str="";
    		for(var i in data.mList){
    			
    			str+="<table class='companyInfo'><thead><tr>";
                str+="<th colspan='4'><div class='input-group'><span class='input-group-addon'>회사코드</span>";
                str+="<input type='text' name='c_code' class='form-control' value='"+data.mList[i].c_code+"' readonly style='width:130%;'></div></th></tr>";
                str+="<tr><th colspan='2'><div class='input-group'><span class='input-group-addon'>회사이름</span>";
                str+="<input type='text' name='c_name' value='"+data.mList[i].c_name+"' class='form-control' style='width:128%;'></div></th>";
                str+="<th colspan='2'><div class='input-group'><span class='input-group-addon'>대표자명</span>";
                str+="<input type='text' name='c_ceo' value='"+data.mList[i].c_ceo+"' class='form-control' style='width:121%;'></div></th></tr></thead>";
                str+="<tbody><tr><th colspan='2'><div class='input-group'><span class='input-group-addon'>사업자번호</span>";
                str+="<input type='text' name='c_comnum' value='"+data.mList[i].c_comnum+"' class='form-control' style='width:120%;'></div></th>";
                str+="<th colspan='2'><div class='input-group'><span class='input-group-addon'>전화번호</span>";
                str+="<input type='text' name='c_phonenum' value='"+data.mList[i].c_phonenum+"' class='form-control' style='width:120%;'></div></th></tr>";
                str+="<tr><th colspan='2'><div class='input-group'><span class='input-group-addon'>업태</span>";
                str+="<input type='text' name='c_kind' value='"+data.mList[i].c_kind+"' class='form-control' style='width:141%;'></div></th>";
                str+="<th colspan='2'><div class='input-group'><span class='input-group-addon'>종류</span>";
                str+="<input type='text' name='c_kind2' value='"+data.mList[i].c_kind2+"' class='form-control' style='width:134%;'></div></th></tr>";
                str+="<tr><th colspan='4'><div class='input-group'><span class='input-group-addon'>주소</span>";
                str+="<input type='text' name='c_addr' value='"+data.mList[i].c_addr+"' class='form-control' style='width:313%;'></div></th></tr></tbody></table>";
                
            
    			
    		}
    		$(".company-div").html(str);
    		
    	},
    	error:function(error){
    		console.log(error);
    	}
    	
    });
 });
</script>
</html>