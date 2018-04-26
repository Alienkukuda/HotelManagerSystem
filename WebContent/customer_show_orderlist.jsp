<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags" %>
     <%@ page import="com.entity.*,java.util.*" %>
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
<title>Paix Hotel Reserve:Book In OrderList</title>
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
								response.sendRedirect("fail_in.jsp");
							}else{%>
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
				<h3>订单已生成</h3>
			</div>
			<div class="services-bottom">
			<% 
				String startdate =(String)session.getAttribute("startdate"); 
				String enddate =(String)session.getAttribute("enddate"); 
				String score_use=(String)session.getAttribute("score_use"); 
				String pay_type=(String)session.getAttribute("pay_type");
				Customer c = (Customer)session.getAttribute("customer");
				Hotel_room hotel_room = (Hotel_room)session.getAttribute("hotel_room");
				Hotel_city hotel_city = (Hotel_city)session.getAttribute("hotel_city"); 
				int price = hotel_room.getR_price()-Integer.parseInt(score_use);
				String date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
				session.setAttribute("price", price);
				session.setAttribute("date", date);
			%>
				<div class="col-md-6 services-left">
					<div class="services-one">
						<s:form action="OrderlistAction!affirm" theme="simple">
						<ul>
							<li><a href="#">酒店名：<%=hotel_city.getH_name() %></a></li>
							<li><a href="#">房间号：<%=hotel_room.getR_id() %></a></li>
							<li><a href="#">房间类型：<%=hotel_room.getR_name() %></a></li>
							<li><a href="#">顾客姓名：<%=c.getC_name() %></a></li>
							<li><a href="#">顾客联系方式：<%=c.getC_phone() %></a></li>
							<li><a href="#">预定时间：<%=startdate %>至<%=enddate %></a></li>
							<li><a href="#">支付方式：<%=pay_type %></a></li>
							<li><a href="#">使用积分：<%=score_use %></a></li>
							<li><a href="#">总价：<%=hotel_room.getR_price()-Integer.parseInt(score_use) %></a></li>
						</ul>
						<s:hidden name="orderlist.od_startdate" value="%{startdate}"/>
						<s:hidden name="orderlist.od_enddate" value="%{enddate}"/>
						<s:hidden name="orderlist.od_paytype" value="%{pay_type}"/>
						<input type="submit" value="确认提交"/>
						</s:form>
						<s:form action="OrderlistAction!cancel1">
							<input type="submit" value="取消订单"/>
						</s:form>
					</div>
					<div class="clearfix"></div>	
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