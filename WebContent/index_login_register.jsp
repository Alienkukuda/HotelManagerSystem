<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>Paix Hotel Reserve:Login&Register</title>
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
					<s:form action="BaseAction!loginforward" theme="simple">
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Type</p>
						</div>
						<div class="bnr-right">
							<s:select name = "type" list="#{0:'用户',1:'旅店',2:'管理员' }"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>User Account</p>
						</div>
						<div class="bnr-right">
							<s:textfield name = "id"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Password</p>
						</div>
						<div class="bnr-right">
							<s:password name = "password"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-btn">
						<input type="submit" value = "登录"/>
						<input type="reset" value="重置"/>
					</div>
					<div class="bnr-btn">
						<a href = "index_customer_register.jsp">
							<input type="button" value = "用户注册入口">
						</a>
						<a href = "index_hotel_register.jsp">
							<input type="button" value = "酒店注册入口">
						</a>
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