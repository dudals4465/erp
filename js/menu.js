
	$(document).ready(function(){
		$.ajax({
			url:'/erp/rest/managermode/getaddmenu',
			type:'get',
			datatype:'json',
			success:function(data){
				console.log(data);
				var str="";

				for(var i in data.mList){
					str+="<li><a id="+data.mList[i].f_functions+" onclick=menu('"+data.mList[i].f_functions+"')>"+data.mList[i].f_functions+"</a></li>";

					if(data.mList[i].f_functions == "인사관리"){
						if($("#myInfoMenu").length>0){
							let menu = "";
							menu += "<li><a href='/erp/myinfo/checkattendance'>출/퇴근 등록</a></li>";
							menu += "<li><a href='/erp/myinfo/myPaycheck'>급여명세서 보기</li>";
							menu += "<li><a href='/erp/myinfo/myattendance'>내 출결 보기</li>";
							menu += "<li><a href='/erp/myinfo/myholiday'>내 휴가 보기</li>";
							menu += "<li><a href='/erp/myinfo/applyholiday'>휴가신청</a></li>";
							$("#myInfoMenu").html(menu);
							console.log(menu);
						}
					}
				}

				str += "</ul>";
				$("#mainmenu").html(str);

			},
			error:function(error){
				console.log(error);
			}
		});
	});

	function menu(menu){
		console.log(menu);

		if(menu=="인사관리"){
			$("#"+menu).attr("href","/erp/hr/hr");
			}else if(menu=="영업관리"){
			$("#"+menu).attr("href","/erp/sales/main");
			}else if(menu=="구매관리"){
			$("#"+menu).attr("href","/erp/Purchase/erpmain");
			}else if(menu=="재고관리"){
			$("#"+menu).attr("href","/erp/stock/basicstock");
			}else if(menu=="회계관리"){
			$("#"+menu).attr("href","/erp/Account/acerp");
			}
	}
	function stockSideMenu(){
		$.ajax({
			url:"/erp/rest/home/getfunction",
			type:"get",
			dataType:"json",
			success:function(result){
				console.log(result)
				$("#menuList").html(result);
			},
			error:function(err){
				
			}
		});
	}
