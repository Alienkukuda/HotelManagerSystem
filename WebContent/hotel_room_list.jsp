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
<title>Paix Hotel Reserve:Hotel Room List</title>
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
						<% 
							if(session.getAttribute("id")==null){
						%>
						<li><a href="index_search_grep.jsp" class="active hvr-bounce-to-bottom">查看&搜索酒店</a></li>
						<li><a href="index_login_register.jsp" class="hvr-bounce-to-bottom">登录&注册</a></li>
						<%}else{%>
						<li><a href="index_search_grep.jsp"
							class="active hvr-bounce-to-bottom">查看&搜索&预定酒店</a></li>
						<li><a href="customer_charge.jsp" class="hvr-bounce-to-bottom">账户充值</a></li>
						<li><a href="CustomerAction!showorderlist"
							class="hvr-bounce-to-bottom">查看我的订单</a></li>
						<li><a href="customer_manager_message.jsp" class="hvr-bounce-to-bottom">留言</a></li>
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
				<h3><%=hotel_name %>酒店房间信息一览</h3>
			</div>
			<div class="services-bottom">
			<% List<Hotel_room> hr_list=(List<Hotel_room>)session.getAttribute("hr_list"); 
				for(int i=0;i<hr_list.size();i++) {
				int str=hr_list.get(i).getR_no();
				session.setAttribute("str",str);
				if(hr_list.get(i).getR_status()!=1){
			%>
				<div class="col-md-6 services-left">
					<div class="services-one">
						<s:form action="OrderlistAction!choosedate" theme="simple">
						<s:hidden name="r_no" value="%{#session.str}"/>
						<h4><%=hr_list.get(i).getR_id() %></h4>
						<p><%=hr_list.get(i).getR_name() %></p>
						<ul>
							<li><a href="#">价格：<%=hr_list.get(i).getR_price() %></a></li>
						</ul>
						<s:submit value="预定"/>
						</s:form>
					</div>
				</div>
						<%}else{%>
						<div class="col-md-6 services-left">
						<div class="services-one">
						<h4><%=hr_list.get(i).getR_id() %></h4>
						<p><%=hr_list.get(i).getR_name() %></p>
						<ul>
							<li><a href="#">价格：<%=hr_list.get(i).getR_price() %></a></li>
							<li><a href="#">已预订</a></li>
						</ul>
						
					</div>	
				</div>
				<%}} %>
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