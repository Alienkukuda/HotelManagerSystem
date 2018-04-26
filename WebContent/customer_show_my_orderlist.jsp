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
<title>Paix Hotel Reserve:Show My List</title>
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
							class="hvr-bounce-to-bottom">查看&搜索&预定酒店</a></li>
						<li><a href="customer_charge.jsp" class="hvr-bounce-to-bottom">账户充值</a></li>
						<li><a href="CustomerAction!showorderlist"
							class="active hvr-bounce-to-bottom">查看我的订单</a></li>
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
				<h3>我的订单一览</h3>
			</div>
			<div class="services-bottom">
		<%
			List<Orderlist> oc_list = (List<Orderlist>)session.getAttribute("orderlist_c"); 
			ArrayList<Hotel_room> hr = (ArrayList<Hotel_room>)session.getAttribute("hroom"); 
			ArrayList<Hotel_city> hc = (ArrayList<Hotel_city>)session.getAttribute("hcity");
			for(int i=0;i<oc_list.size();i++) {
				int ocd_id=oc_list.get(i).getOd_id();
				session.setAttribute("ocd_id",ocd_id);
				int score = hr.get(i).getR_price()-Integer.parseInt(oc_list.get(i).getOd_price());
		%>
				<div class="col-md-6 services-left">
					<div class="services-one">
						<h4>订单编号：<%=oc_list.get(i).getOd_id() %></h4>
						<ul>
							<li><a href="#">预订酒店：<%=hc.get(i).getH_name() %></a></li>
							<li><a href="#">预订房间号：<%=hr.get(i).getR_id() %></a></li>
							<li><a href="#">预订房间类型：<%=hr.get(i).getR_name() %></a></li>
							<li><a href="#">预订时间：<%=oc_list.get(i).getOd_startdate() %>至<%=oc_list.get(i).getOd_enddate() %></a></li>
							<li><a href="#">支付形式：<%=oc_list.get(i).getOd_paytype() %></a></li>
							<li><a href="#">抵用积分：<%=score %></a></li>
							<li><a href="#">订单价格：<%=oc_list.get(i).getOd_price() %></a></li>
						</ul>
							<%	if(oc_list.get(i).getOd_status()==0){%>
						<ul>
							<li><a href="#">订单状态：已完成</a></li>
						</ul>
						<s:form action="customer_review.jsp">
							<s:submit value="评价订单"/>
						</s:form>
						<%} else if(oc_list.get(i).getOd_status()==4){%>
						<ul>
							<li><a href="#">订单状态：已完成</a></li>
							<li><a href="#">你的评价：<%=oc_list.get(i).getCus_review() %></a></li>
						</ul>
						<%} else{%>
						<ul>
							<li><a href="#">订单状态：未完成</a></li>
						</ul>
						<%}
							if(oc_list.get(i).getOd_paytype().equals("在线支付")){
								if(oc_list.get(i).getOd_status()==2){
						%>
						<ul>
							<li><a href="#">支付状态：未支付</a></li>
						</ul>
						<s:form action="OrderlistAction!pay">
						<%
							session.setAttribute("score", score);
							session.setAttribute("hotel_room_cus",hr.get(i) );
							session.setAttribute("ordl", oc_list.get(i));
						%>
							<s:submit value="去支付"/>
						</s:form>
						<s:form action="OrderlistAction!cancel2">
						<%
							session.setAttribute("hotel_room_cus",hr.get(i) );
							session.setAttribute("status", 0);
						%>
							<s:submit value="取消订单"/>
						</s:form>
						<%} else if(oc_list.get(i).getOd_status()==3){%>
						<ul>					
							<li><a href="#">支付状态：已支付</a></li>
						</ul>
						<s:form action="OrderlistAction!cancel2">
						<%
							session.setAttribute("hotel_room_cus",hr.get(i) );
							session.setAttribute("score", score);
							session.setAttribute("ordl", oc_list.get(i));
							session.setAttribute("status", 1);
						%>
							<s:submit value="取消订单"/>
						</s:form>
						<%}}%>
						
					</div>	
				</div>
				<%}%>
				</div>
				<div class="clearfix"></div>				
			</div>			
		</div>
	<!--start-footer -->
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