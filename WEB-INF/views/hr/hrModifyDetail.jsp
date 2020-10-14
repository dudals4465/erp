<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src=/erp/js/menu.js></script> <!-- 메뉴Ajax로 출력 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/erp/css/hrCss.css" rel="stylesheet" type="text/css" media="all" />
<link href="/erp/css/default.css" rel="stylesheet" type="text/css"
	media="all" />
	<link href="/erp/img/favicon.png" rel="icon" />
<title>사원 인사 카드 수정 및 입력</title>
<style>
.modifyMode{
	background-color: skyblue;
}
.registMode{
}
img{
width: 199px;
height: 199px;
}
span{
	float: left;
}
.info{
	height:60px;
}

.attendance{
	border: 1px solid black;
}
#dataTable{
	border: 1px solid black;
	width: 300px;
}
tr{
	border: 1px solid black;
	border-collapse: collapse;
}
.dataSpan{
	width:250px;
	float:left;
	align-content: center;
	text-align: center;
}
#hrmenu{
	float:none;
	width:670px;
}
#member{
	height:300px;
}


</style>

<meta charset="UTF-8">
</head>
<body>

	<div class="first_div_css">
		<h1 class="deptregist_color_size" id="title">사원 인사 카드</h1>
	</div>

<table >
<tr >
<td>
<div id="member"></div>
</td>
</tr>


<tr  >
<td>
<div id="hrmenu" width="670px" style="padding-left: 60px;"></div>
</td>
</tr>


<tr>
<td>
<form id="form" method="post" onsubmit="return checkCurrent();">
<div id="hrDetailInfo" align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/6/6c/Mass-Effect-N7-sign.png" style="opacity: 10%; width:650px;">
<table id="hrDetail" border="1" cellspacing="0">
</table>
<div id="addRecord" align="center">
</div>
</div>
</td>
</tr>


<tr>
<td>
<div align="right" style="width: 670px; padding-right:60px;">
	<input type='hidden' value='' id='current'>
	<input type='button' value='추가하기' class = 'infobtn' onclick='addRecord()' id='addRecordBtn'>
	<input type='button' value='수정/등록모드'  class = 'infobtn' onclick='changeMode()' id='changeBtn' style='width:150px;'>
	<input type='submit' value='등록완료'  class = 'infobtn' disabled="disabled" id='registBtn'>
</div>
</form>
</td>
</tr>
</table>

<script>
var cnt = 0;
function checkCurrent(){
	console.log($("#checkmonth").val());
	var $check = $("#current").val();
	if($check==""){
		console.log("공백");
		alert("잘못된 접근입니다. 정보를 입력해주세요.");
		return false;
	}
	if(cnt == 0){
		console.log(cnt);
		alert("잘못된 접근입니다. 정보를 입력해주세요.");
		return false;
	}
	if($("#checkmonth").val()==""){
		alert("입사일을 안고르셨습니다 선택해주세요.");
		return false;
	}
	return true;

}
var num;
var curPosition = "";
var id = location.search.substr(4);
$(document).ready(function(){
	$.ajax({
		url:"/erp/rest/hr/memberfromid",
		data:{m_id:id},
		dataType:"json",
		method:"get",
		contentType : 'application/json',
		success : function(data){
				console.log(data);
				let info = "";
				info += '<div style="margin-left:60px;" class="dataSpan"><img style="width:199px; height: 250px;" src="/erp/upload/'+data.m_photo+'"></div>';
				info += '<div class="dataSpan"><table id="dataTable" style="border-collapse:collapse;" border="1px solid black"><tr class="infomenu"><td>이름</td></tr>'
				info += '<tr><td id="m_name">'+data.m_name+'</td></tr>';
				info += '<tr  class="infomenu"><td>생년월일</td></tr>';
				info += '<tr><td id="m_birth">'+data.m_birth+'</td></tr>';
				info += '<tr  class="infomenu"><td>전화번호</td></tr>';
				info += '<tr><td id="m_phonenum">'+data.m_phonenum+'</td></tr>';
				info += '<tr  class="infomenu"><td conlspan="2">주소</td></tr>'
				info += '<tr style="height:80px;"><td id="m_address" colspan="2">'+data.m_address+'</td></tr></table></div>';
				$("#member").html(info);

				let title = "";
				title += data.m_name + "님의 인사카드";
				$("#title").html(title);
		},error : function(err){
		}
	});
	$.ajax({
		url:"/erp/rest/hr/hrcodefromid",
		data:{m_id:id},
		dataType:"json",
		method:"get",
		contentType: 'application/json',
		success : function(data){
			let str="";
			str+='<tr><td><a href="javascript:InCompanyInfo()"><button class = "infobtn" >사내정보</button></a></td>';
			if(data){
				str +='<td><a href="javascript:AcademicInfo()"> <button class = "infobtn">학력</button></a></td>';
				str +='<td><a href="javascript:CareerInfo() "> <button class = "infobtn">이력</button> </a></td>';
				str +='<td><a href="javascript:CertificationInfo()"> <button class = "infobtn">자격증</button> </a></td>';
			}
			str+='</tr>';
			$("#hrmenu").html(str);
		}, error : function(err){
			console.log(err);
		}
	});
	console.log("load");
});

/* var str1 = Number(replaceAll($('.checkDate')[0].value,"-",""));
var str2;
if($('.checkDate')[1].value!=''){
str2 = Number(replaceAll($('.checkDate')[1].value,"-",""));
console.log(str1);
if(str1>str2){
   alert("종료일은 시작일보다 이전일 수 없습니다.");
   return;
}
} */


function replaceAll(str, searchStr, replaceStr) {
    return str.split(searchStr).join(replaceStr);
 }

function checkDateValue(val1, val2){
	let date1 = Number(replaceAll(val1.value, "-", ""));
	let date2 = Number(replaceAll(val2.value, "-", ""));
	if(date1>date2){
		alert("종료일은 시작일보다 이전일 수 없습니다.");
		val2.value = "";
	}
}

function addRecord(){
	let str ="";
	let cntAc = 0;
	let cntCt = 0;
	var $current = $("#current").val();
	console.log(num);
	if($current == 'Academic'){
		str += "<tr id='test'><td><input type='text' name='hac_school' class='detailInfo' style='width:190px;' required='required'></td>";
		str += "<td><input type='text' name='hac_major' class='detailInfo' style='width:190px;' required='required'></td>";
		str += "<td><input type='date' name='hac_year' class='detailInfo' required='required'></td>";
		str += "<td><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
	}else if($current =='Certification'){
		str += "<tr><td><input type='text' name='hct_name' class='detailInfo' style='width:190px;' required		></td>";
		str += "<td><input type='text' name='hct_agency' class='detailInfo' style='width:190px;' required></td>";
		str += "<td><input type='date' name='hct_date' class='detailInfo' required></td>"
			str += "<td><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
	}else if($current =='Career'){
		str += "<tr><td><input type='text' name='hcr_name' class='detailInfo' style='width:140px; height:50px;'></td>";
		str += "<td><input type='date' name='hcr_startperiod' id='chk"+(num*2)+"' class='detailInfo checkDate' style='width:140px;'><br>";
		str += "<input type='date' name='hcr_endperiod' id='chk"+((num*2)+1)+"' class='detailInfo checkDate' onchange='checkDateValue(chk"+(num*2)+", chk"+((num*2)+1)+")' style='width:140px;'></td>"
		str += "<td><input type='text' name='hcr_position' class='detailInfo' style='width:130px; height:50px;'></td>";
		str += "<td><textarea rows='3' cols='20' name='hcr_content' class='detailInfo'style='width:140px; height:50px;'></textarea></td>"
		str += "<td><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td></tr>";
		num++;
	}
		cnt++;
//		$("#hrDetail > tbody:last").append(str);
	$("#infoTable > tbody:last").append(str);
}
function thisRowDel(row){
	let tr = row.parentNode.parentNode;
	console.log(tr);
	tr.parentNode.removeChild(tr);
	var $current = $("#current").val();
	var num;
	cnt--;
	if(tr.className=="origin"){
		if(confirm("정말 삭제하시겠습니까?")){
			if($current=="Academic"){
				num = tr.childNodes[2].children.hac_num.value;
			}else if($current == "Career"){
				num=tr.childNodes[3].children.hcr_num.value;
			}else if($current == "Certification"){
				num=tr.childNodes[2].children.hct_num.value;
			}
			$.ajax({
				url:"/erp/rest/hr/removeinfo",
				data:{num : num, type : $current},
				dataType:"text",
				method:"post",
				success : function(data){
					console.log(data);
				}, error : function(err){
					console.log(err);
				}
			});
		}else{
			alert("취소되었습니다.")
		}

	}
}

function changeMode(){
	console.log($("#changeBtn").attr('class'));
	if($("#changeBtn").attr('class')=="infobtn mf"){
		$(".detailInfo").attr("readonly", true).addClass("modifyMode").removeClass("registMode");
		$("#registBtn").attr("disabled", false);
		$("#registBtn").css('background-color','#3D6B9B');
		for(let i = 0 ; i<$(".origin").length ; i++){
			if($("#origin_"+i)[0].lastChild.className=="removebtn"){
			$("#origin_"+i)[0].lastChild.remove();
			}
		}
	}else{
		if($("#current").val()=='HRCard'){
			changeDept(document.getElementById("dept"));
			console.log("dd");
		}
		$(".detailInfo").removeAttr("readonly").removeClass("modifyMode").addClass("registMode");
		$("#registBtn").attr("disabled", true);
		$("#registBtn").css('background-color','#d2d2d2');
		for(let i = 0 ; i <$(".origin").length ; i++){
			$("#origin_"+i).append("<td class='removebtn' width='50px'><input type='button' value='삭제' onclick='javascript:thisRowDel(this);'></td>");
		}
	}
	$("#changeBtn").toggleClass("mf");

}

var formURL = "/erp/hr";





function AcademicInfo(){
	$("#form").attr("action", formURL + "/newacademic/" + id);
	$("#current").val("Academic");
	$("#registBtn").attr("disabled", true);
	$("#registBtn").css('background-color','#d2d2d2');
	console.log("aca");
	cnt =0;
	$.ajax({
		url:"/erp/rest/hr/academic",
		dataType:"json",
		data:{m_id : id},
		method:"get",
		contentType: 'application/json',
		async:false,
		success : function(data){
			if(data.length==undefined){
				var arr = [data]
				data = arr;
				}
			let str ="";
			str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
			str += "<td style='width:199px;'>학교/학위</td><td style='width:199px;'>전공</td><td style='width:199px;' colspan='2'>날짜</td></tr>";
			console.log(data);
			for(let i = 0 ; i <data.length ; i++){
			str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hac_school' class='detailInfo' style='width:190px;' value='"+data[i].hac_school+"' readonly></td>"
			str += "<td><input type='text' name='hac_major' style='width:190px;' class='detailInfo' value='"+data[i].hac_major+"' readonly></td>";
			str += "<td><input type='date' name='hac_year' style='width:190px;' class='detailInfo' value='"+data[i].hac_year+"' readonly>";
			str += "<input type='hidden' name='hac_num' value='"+data[i].hac_num+"'></td></tr>";
			}
			str += "</table>";
			cnt = data.length;
			$("#hrDetailInfo").html(str);
		},error : function(err){
			/* let str ="";
			str += "<table border='1px solid black'><tr>";
			str += "<td>학교/학위</td><td>전공</td><td>날짜</td></tr>";
			str += "<tr><td><input type='text' name='hac_school' class='detailInfo'></td>"
			str += "<td><input type='text' name='hac_major' class='detailInfo'></td>";
			str += "<td><input type='date' name='hac_year' class='detailInfo'></td></tr>";
			str += "</table>";
			$("#hrDetailInfo").html(str); */
		}
	});
}

function CertificationInfo(){
	$("#form").attr("action", formURL + "/newcertification/" + id);
	$("#current").val("Certification");
	$("#registBtn").attr("disabled", true);
	cnt=0;
	$("#registBtn").css('background-color','#d2d2d2');
	$.ajax({
		url:"/erp/rest/hr/certification",
		dataType:"json",
		method:"get",
		async:false,
		data:{m_id : id},
		success : function(data){
			if(data.length==undefined){
			var arr = [data]
			console.log(arr);
			data = arr;
			}
			cnt = data.length;
			let str ="";
			str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu'>";
			str += "<td style='width:199px;'>자격증</td><td style='width:199px;'>발급처</td><td style='width:199px;' colspan='2'>발급일</td></tr>";
			for(let i = 0 ; i <data.length ; i++){
			str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hct_name' class='detailInfo' style='width:190px;' value='"+data[i].hct_name+"' readonly ></td>"
			str += "<td><input type='text' name='hct_agency' style='width:190px;' class='detailInfo' value='"+data[i].hct_agency+"' readonly ></td>";
			str += "<td><input type='date' name='hct_date' style='width:190px;' class='detailInfo' value='"+data[i].hct_date+"' readonly></td>";
			str += "<input type='hidden' name='hct_num' style='width:190px;' value='"+data[i].hct_num+"'></td></tr>";
			}str += "</table>";
			$("#hrDetailInfo").html(str);

		},error : function(err){
			/* let str ="";
			str += "<table border='1px solid black'><tr>";
			str += "<td>자격증</td><td>발급처</td><td>발급일</td></tr>";
			str += "<tr><td><input type='text' name='hct_name' class='detailInfo'></td>"
			str += "<td><input type='text' name='hct_agency' class='detailInfo'></td>";
			str += "<td><input type='date' name='hct_date' class='detailInfo' required pattern='\d{4}-\d{2}-\d{2}'></td></tr>";
			str += "</table>";
			$("#hrDetailInfo").html(str); */
		}
	});
}
function CareerInfo(){
	$("#form").attr("action", formURL + "/newcareer/" + id);
	$("#current").val("Career");
	$("#registBtn").attr("disabled", true);
	$("#registBtn").css('background-color','#d2d2d2');
	cnt = 0;
	$.ajax({
		url:"/erp/rest/hr/career",
		async:false,
		dataType:"json",
		method:"get",
		data:{m_id : id},
		success : function(data){
			console.log(data);
			let str ="";
			str += "<table border='1px solid black' id='infoTable' border='1' cellspacing='0'><tr class='infomenu' style='text-align:center;'>";
			str += "<td style='width:140px;'>회사/프로젝트명</td><td style='width:110px;'>기간</td><td style='width:140px;'>직책</td><td style='width:170px;' colspan='2'>내용</td></tr>";
			for(let i=0; i<data.length ; i++){
			str += "<tr class='origin' id='origin_"+i+"'><td><input type='text' name='hcr_name' style='width:140px; height:50px;' class='detailInfo' value='"+data[i].hcr_name+"' readonly ></td>"
			str += "<td style='width:140px;'><input type='date' style='width:140px;' name='hcr_startperiod' id='chk"+(i*2)+"'class='detailInfo checkDate' value='"+data[i].hcr_startperiod+"' readonly >";
			str += "<input type='date' style='width:140px;' name='hcr_endperiod' id='chk"+((i*2)+1)+"' class='detailInfo checkDate' value='"+data[i].hcr_endperiod+"' readonly onchange='checkDateValue(chk"+(i*2)+", chk"+((i*2)+1)+")'></td>"
			str += "<td><input type='text' style='width:130px; height:50px;' name='hcr_position' class='detailInfo' value='"+data[i].hcr_position+"' readonly ></td>";
			if(data[i].hcr_content=="null" || data[i].hcr_content==null){
				str += "<td style='width:140px;'><input rows='3' cols='20' style='width:140px; height:50px;' name='hcr_content' class='detailInfo' value=''>";
			}else{
				str += "<td style='width:140px;'><input rows='3' cols='20' style='width:140px; height:50px;' name='hcr_content' class='detailInfo' value='"+data[i].hcr_content+"'>";
			}
			console.log(data[i].hcr_content);
			str += "<input type='hidden' name='hcr_num' value='"+data[i].hcr_num+"'></td></tr>";
			}
			str+="</table>";
			$("#hrDetailInfo").html(str);
			num=data.length;
			cnt = data.length;
		},error : function(err){
			console.log(err);
		}
	});
}function InCompanyInfo(){
	$("#form").attr("action", formURL + "/newhrcard/" +id);
	$("#current").val("HRCard");
	$("#registBtn").attr("disabled", true);
	$("#registBtn").css('background-color','#d2d2d2');
	cnt = 1;
	$.ajax({
		url :"/erp/rest/hr/deptlist",
		dataType:"json",
		method :"get",
		async : false,
		success : function(deptList){
			$.ajax({
				url:"/erp/rest/hr/hrcard",
				data:{m_id:id},
				dataType:"json",
				method:"get",
				success : function(data){
					console.log(deptList);
					console.log(data);
					var married ="";
					var status ="";
					var work="";
					if(data.hc_status==1){
						status="근무";
					}else if(data.hc_status==0){
						status="퇴근"
					}else{
						status="휴가";
					}
					if(data.hc_work==1){
						work="휴직";
					}else if(data.hc_work==2){
						work="퇴사";
					}else{
						work="재직";
					}
					let str ="";
					str += "<table border='1px solid black' style='border-collapse:collapse;'><tr class='infomenu'>";
					str += "<td style='width:199px;'>사원코드</td><td style='width:199px;'>부서</td><td style='width:199px;'>직책</td></tr>";
					str += "<tr><td><input type='text' name='hc_hrcode' value='"+data.hc_hrcode+"' class='detailInfo' style='width:190px;' readonly></td>"
					str += "<td><select name='hc_dept' class='detailInfo' onchange='changeDept(this)' id='dept' style='width:190px;height:25px;'>"
					for(let i = 0 ; i<deptList.deptList.length ; i++){
						if(data.hc_dept===deptList.deptList[i]){
							str += "<option value='"+deptList.deptList[i]+"' selected='selected'>"+deptList.deptList[i]+"</option>";
						}else{
						str += "<option value='"+deptList.deptList[i]+"'>"+deptList.deptList[i]+"</option>";
						}
					}
					str += "</select></td><td><span id='position'>";
					str += "<select name='hc_position' class='detailInfo' style='width:190px;height:25px;'>";
					str += "<option value='"+data.hc_position+"' selected='selected'>"+data.hc_position+"</select>"
					str += "</span></td></tr>";
					str += "<tr class='infomenu'><td colspan='2'>입사일</td><td></td></tr>";
					str += "<td colspan='2'><input type='date' id='checkmonth' name='hc_joindate' value='"+data.hc_joindate+"' class='detailInfo' readonly></td><td></td>"
					str += "<tr class='infomenu'><td>현재 상태</td><td>재/휴직 상태</td><td>남은 연차</td></tr>";
					str += "<td><input type='text' value='"+status+"' style='width:190px;' readonly></td>"
					str += "<td><input type='text' value='"+work+"' style='width:190px;' readonly></td>"
					str += "<td><input type='text' name = 'hc_holynum' value='"+data.hc_holynum+"' style='width:190px;' class='detailInfo' readonly></td></tr></table>";
					console.log(data.hc_joindate);
					$("#hrDetailInfo").html(str);
					curPosition = data.hc_position;
				},error : function(err){
					console.log(deptList);
					console.log(err);
					let str ="";
					str += "<table border='1px solid black'><tr class='infomenu'>";
					str += "<td>사원코드</td><td>부서</td><td>직책</td></tr>";
					str += "<tr class='infomenu'><td><input type='text' name='hc_hrcode' style='width:190px;' placeholder='---' readonly></td>"
					str += "<td><select name='hc_dept' class='detailInfo' id='dept' style='width:190px;height:25px;' onchange='changeDept(this)'>"
						for(let i = 0 ; i<deptList.deptList.length ; i++){
							str += "<option>"+deptList.deptList[i]+"</option>";
						}
					str += "</select></td><td><span id='position'></td></tr>";
					str += "<tr class='infomenu'><td colspan='3'>입사일</td></tr>";
					str += "<td colspan='3'><input id='checkmonth' type='date' name='hc_joindate' class='detailInfo' required></td></tr>"
					str += "<tr><td>현재 상태</td><td>재/휴직 상태</td><td>남은 연차</td></tr>";
					str += "<td><input type='text' placeholder='---' style='width:190px;' readonly></td>"
					str += "<td><input type='text' placeholder='---' style='width:190px;' readonly></td>"
					str += "<td><input type='text' placeholder='---' style='width:190px;' readonly></td></tr></table>";
					$("#hrDetailInfo").html(str);
					changeDept(document.getElementById("dept"));
				}
			});
		},error : function(err){
			console.log(err);
		}
	});
}

function changeDept(id){

	console.log(id.value)
	$.ajax({
		url:"/erp/rest/hr/positionfromdept",
		method : "get",
		dataType : "json",
		data : {"dept" : id.value},
		success : function(data){
			console.log(data);
			let str = "";
			str += "<select name='hc_position' class='detailInfo' style='width:150px;height:25px;'>";
			for(let i = 0 ; i<data.length ; i++){
				if(curPosition == data[i]){
					str += "<option value='"+data[i]+"' selected='selected'>"+data[i]+"</option>";
				}else{
					str += "<option value='"+data[i]+"'>"+data[i]+"</option>";
				}
			}
			$("#position").html(str);
		}, error : function(err){
			console.log(err);
		}
	});

/*	for(let i = 0 ; i<deptList.positionList.length ; i++){
		if(data.hc_position===deptList.positionList[i]){
			str += "<option value='"+deptList.positionList[i]+"' selected='selected'>"+deptList.positionList[i]+"</option>";
		}else{
		str += "<option value='"+deptList.positionList[i]+"'>"+deptList.positionList[i]+"</option>";
		}
	} */
}
</script>
</body>
</html>
