<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/dateRange.js"></script>
<script type="text/javascript" src="js/monthPicker.js"></script>
<link rel="stylesheet" type="text/css" href="css/dateRange.css">
<link rel="stylesheet" type="text/css" href="css/monthPicker.css">
<script type="text/javascript"> 
	var dateRange = new pickerDateRange('date', { 
		isTodayValid : true, 
		startDate : '2013-04-14', 
		endDate : '2013-04-21', 
		theme : 'ta', 
		defaultText : ' 至 ', 
		success : function(obj) { 
		//设置回调句柄 
		} 
	}); 
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
<title>Paix Hotel Reserve:Book In Choose Date</title>
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
	<div class="contact">
		<div class="container">
			<div class="contact-top heading">
				<h3>入住日期选择与积分使用</h3>
			</div>
			<s:form action="OrderlistAction!date_score" theme="simple">
				<s:hidden name="startdate" id="startdate"/>
				<s:hidden name="enddate" id="enddate"/>
				<div class="contact-bottom">
            			<input type="text" class="date_title" id="date_demo3" placeholder="Date"/>
           				<a class="opt_sel" id="input_trigger_demo3" href="#">
               				<i class="i_orderd"></i>
            			</a>
        			<script type="text/javascript">
            	var dateRange = new pickerDateRange('date_demo3', {
                	aRecent7Days: 'aRecent7DaysDemo3', //最近7天
                	isTodayValid: true,
                	defaultText: ' 至 ',
                	inputTrigger: 'input_trigger_demo3',
                	theme: 'ta',
                	success: function (obj) {
                    	$("#dCon_demo3").html('开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
                    	document.getElementById("startdate").value=obj.startDate;
                    	document.getElementById("enddate").value=obj.endDate;
                	}
            	});
        	</script>
        	<s:textfield name="score_use" placeholder="Score"/>
        	<s:select list="#{0:'在线支付',1:'到店支付'} " name="pay_type" placeholder="请选择支付方式"/>
				<div class="submit-btn">
						<input type="submit" value="SUBMIT">
				</div>
			</div>
			</s:form>
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
				<p class="footer-class">
					© 2016 All Rights Reserved | Design by <a href="#" target="_blank">Wujiawei&Yangbo</a>
				</p>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {$().UItoTop({ easingType: 'easeOutQuart' });});
		</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;">
			<span id="toTopHover" style="opacity: 1;"> </span>
		</a>
	</div>
</body>
</html>