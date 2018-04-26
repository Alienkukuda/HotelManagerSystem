<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="java.util.*,com.entity.*"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Paix Hotel Reserve:Hotel Home</title>
</head>
<body>
<!--start-header-->
	<div class="header" id="home">
		<div class="container">
			<div class="head">
			<div class="logo">
				<a href="Hotel_cityAction!findHotel"><img src="images/logo.png"></a>
			</div>
			<div class="navigation">
				 <span class="menu"></span> 
					<ul class="navig">
						<% 
							if(session.getAttribute("id")==null){
								response.sendRedirect("fail_in.jsp");
							}else{%>
						<li><a href="Hotel_cityAction!findHotel" class="active hvr-bounce-to-bottom">酒店信息</a></li>
						<li><a href="Hotel_roomAction!queryHotel_room" class="hvr-bounce-to-bottom">房间信息</a></li>
						<li><a href="OrderlistAction!findHotelOrderlist" class="hvr-bounce-to-bottom">查看我的订单</a></li>
						<li><a href="MessageAction!queryMessage" class="hvr-bounce-to-bottom">留言区</a></li>
						<li><a href="BaseAction!logout" class="hvr-bounce-to-bottom">退出</a></li>	
						<%}%>
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
	<!-- start-services -->
	<div class="services">
		<div class="container">
			<div class="services-top heading">
			<% String hotel_name = (String)session.getAttribute("hc_name"); %>
				<h3><%=hotel_name %>酒店信息一览</h3>
			</div>
			<div class="services-bottom">
				<%Hotel_city hc=(Hotel_city)session.getAttribute("hc"); 
					String hid=hc.getH_id();
				session.setAttribute("hid",hid);%>
				<div class="col-md-6 services-left">
					<div class="services-one">
						<s:form action="hotel_update_info.jsp" theme="simple">
						<img src="<%=hc.getH_picture() %>" width="200px" height="200px">
						<h4><%=hc.getH_name() %></h4>
						<p><%=hc.getH_intro() %></p>
						<ul>
							<li><a href="#">地址：<%=hc.getH_address() %></a></li>
							<li><a href="#">联系方式：<%=hc.getH_phone() %></a></li>
							<li><a href="#">酒店所在地区：<%=hc.getCi_name() %></a></li>
							<li><a href="#">营业执照：<img src="<%=hc.getH_license() %>" width="200px" height="200px"></a></li>
						</ul>
						
						<s:submit value="修改信息"/>
						</s:form>
					</div>
				</div>
				</div>
				<div class="clearfix"></div>				
			</div>			
		</div>
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