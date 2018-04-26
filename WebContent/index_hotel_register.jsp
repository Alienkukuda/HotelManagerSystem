<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/Area.js" type="text/javascript"></script>
<script src="js/AreaData_min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function (){
	initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
});

//得到地区码
function getAreaID(){
	var area = 0;          
	if($("#seachdistrict").val() != "0"){
		area = $("#seachdistrict").val();                
	}else if ($("#seachcity").val() != "0"){
		area = $("#seachcity").val();
	}else{
		area = $("#seachprov").val();
	}
	return area;
}
	var a;
function showAreaID() {
	//地区码
	var areaID = getAreaID();
	//地区名
	var areaName = getAreaNamebyID(areaID) ;
	a = areaName;
	document.getElementById("city").value=a;
}

//根据地区码查询地区名
function getAreaNamebyID(areaID){
	var areaName = "";
	if(areaID.length == 2){
		areaName = area_array[areaID];
	}else if(areaID.length == 4){
		var index1 = areaID.substring(0, 2);
		areaName = area_array[index1] + " " + sub_array[index1][areaID];
	}else if(areaID.length == 6){
		var index1 = areaID.substring(0, 2);
		var index2 = areaID.substring(0, 4);
		areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
	}
	return areaName;
}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="application/x-javascript"> 
		addEventListener("load", function(){ setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script src="js/jquery-index.min.js"></script>
	<!---- start-smoth-scrolling---->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
	<!--end-smoth-scrolling-->
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paix Hotel Reserve:Hotel Register</title>
</head>
<body>
<!--start-header-->
	<div class="header" id="home">
		<div class="container">
			<div class="head">
			<div class="logo">
				<a href="index_search_grep.jsp"><img src="images/logo.png"></a>
			</div>
			<div class="navigation">
				 <span class="menu"></span> 
					<ul class="navig">
						<li><a href="index_search_grep.jsp" class="hvr-bounce-to-bottom">查看&搜索酒店</a></li>
						<li><a href="index_login_register.jsp" class="active hvr-bounce-to-bottom">登录&注册</a></li>
					</ul>
			</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- script-for-menu -->
	<script>
		$("span.menu").click(function(){
			$(" ul.navig").slideToggle("slow" , function(){
			});
		});
	</script>
	<!-- script-for-menu -->
		<!--start-banner-->
	<div class="banner">
		<div class="container">
			<div class="banner-top">
				<h1>For Login & Register</h1>
				<div class="banner-bottom">
					<s:form action="Hotel_cityAction!register" enctype="multipart/form-data" theme="simple" validate="true">
					<div class="bnr-one">
						<div class="bnr-left">
						</div>
						<div class="bnr-right">
							<s:fielderror fieldName = "hotel_city.h_id"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Account(Use for login)</p>
						</div>
						<div class="bnr-right">
							<s:textfield name = "hotel_city.h_id"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
						</div>
						<div class="bnr-right">
							<s:fielderror fieldName = "hotel_city.h_password"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Password</p>
						</div>
						<div class="bnr-right">
							<s:password name = "hotel_city.h_password"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
						</div>
						<div class="bnr-right">
							<s:fielderror fieldName = "hotel_city.h_name"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Name</p>
						</div>
						<div class="bnr-right">
							<s:textfield name = "hotel_city.h_name"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Address</p>
						</div>
						<div class="bnr-right">
							<s:textfield name = "hotel_city.h_address"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Intro</p>
						</div>
						<div class="bnr-right">
							<s:textarea name = "hotel_city.h_intro"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
						</div>
						<div class="bnr-right">
							<s:fielderror fieldName = "hotel_city.h_phone"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Phone</p>
						</div>
						<div class="bnr-right">
							<s:textfield name = "hotel_city.h_phone"/>
						</div>
						<div class="clearfix"></div>
					</div>
						<div class="bnr-one">
						<div class="bnr-left">
							<p>License</p>
						</div>
						<div class="bnr-right">
						<a href="#" class="file">点击选择文件
							<s:file name = "licensefile" accept="image/*"/>
							<% session.setAttribute("status", 1); %>
						</a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Province</p>
						</div>
						<div class="bnr-right">
							<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>City</p>
						</div>
						<div class="bnr-right">
							<select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
						</div>
						<div class="bnr-right">
							<span id="seachdistrict_div">
								<select id="seachdistrict" name="seachdistrict"></select>
							</span>
						</div>
						<div class="clearfix"></div>
					</div>

 						<input type="hidden" name="city" id ="city">
					<div class="bnr-btn">
						<input type="submit" value = "提交" onClick="showAreaID()"/>
						<input type="reset" value="重置"/>
					</div>						
					</s:form>
				</div>
			</div>
		</div>
	</div>	
	<!--end-banner-->
	<!--start-footer-->
	<div class="footer">
		<div class="container">
		<div class="touch-top heading">
				<h3>FOLLOW US</h3>
			</div>
			<div class="touch-bottom">
				<ul>
					<li><a href="#"><span class="fb"> </span></a></li>
					<li><a href="#"><span class="twit"> </span></a></li>
					<li><a href="#"><span class="google"> </span></a></li>
				</ul>
			</div>
			<div class="footer-top">
				<p class="footer-class">© 2016 All Rights Reserved | Design by  <a href="#" target="_blank">Wujiawei&Yangbo</a> </p>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {$().UItoTop({ easingType: 'easeOutQuart' });});
		</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	</div>
</body>
</html>