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
<title>Paix Hotel Reserve:Manager Home</title>
</head>
<body>
<!--start-header-->
	<div class="header" id="home">
		<div class="container">
			<div class="head">
			<div class="logo">
				<a href="ManagerAction!findManager"><img src="images/logo.png"></a>
			</div>
			<div class="navigation">
				 <span class="menu"></span> 
					<ul class="navig">
						<% 
							if(session.getAttribute("id")==null){
								response.sendRedirect("fail_in.jsp");
							}else{%>
						<li><a href="ManagerAction!findManager" class="active hvr-bounce-to-bottom">管理员信息</a></li>
						<li><a href="CustomerAction!list" class="hvr-bounce-to-bottom">会员信息</a></li>
						<li><a href="Hotel_cityAction!list" class="hvr-bounce-to-bottom">酒店信息</a></li>
						<li><a href="OrderlistAction!list" class="hvr-bounce-to-bottom">订单信息</a></li>
						<li><a href="MessageAction!list" class="hvr-bounce-to-bottom">留言</a></li>
						<li><a href="manager_insert.jsp" class="hvr-bounce-to-bottom">添加管理员</a></li>
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
				<h3>管理员信息一览</h3>
			</div>
			<div class="services-bottom">
				<%Manager m=(Manager)session.getAttribute("manager"); %>
				<div class="col-md-6 services-left">
					<div class="services-one">
						<h4><%=m.getM_name() %></h4>
						<ul>
							<li><a href="#">账号：<%=m.getM_account() %></a></li>
						</ul>
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