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
<title>Paix Hotel Reserve:Search&Grep</title>
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
	<!--start-banner-->
	<div class="banner">
		<div class="container">
			<div class="banner-top">
				<h1>For Search & Grep</h1>
				<div class="banner-bottom">
					<s:form action= "CustomerAction!FindHotel_CityByH_name" theme="simple">
					<div class="bnr-one">
						<div class="bnr-left">
							<p>Search</p>
						</div>
						<div class="bnr-right">
							<s:textfield name="h_name"/>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="bnr-btn">
						<input type = "submit" value = "搜索"/>
						<input type = "reset" value = "重置"/>
					</div>
					</s:form>
					<div class="bnr-btn">
						<a href = "CustomerAction!ListHotel_city">
							<input type = "button" value = "全部酒店"/>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!--end-banner-->
	<!--start-test -->
	<div class="test" id="testimonials">
		<div class="container">
			<div class="test-top">
				<section class="slider">
					<div class="flexslider">
					<div class="flex-viewport" style="overflow: hidden; position: relative;">
						<ul class="slides" style="width: 1000%; transition-duration: 0s; transform: translate3d(-2160px, 0px, 0px);">
							<li class="" style="width: 720px; float: left; display: block;">
								<div class="test-one">
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_1.jpg">
										<p>桔子水晶酒店（杭州火车东站店）位于杭州火车东站西广场，旁边有地铁1号线4号线和大量的公交车线路通达杭州各大景点车站。周边配套设施完善，娱乐广场美食街购物中心大型超市一应俱全。酒店由国外着名设计师按五星级标准设计，客房音响系统支持蓝牙、Iphone、Ipad、笔记本可与电视直接相连，房间全部可以无线上网。房内还配备50寸液晶电视、浴缸、电动窗帘等；隔音系统由清华声学所设计，保证一夜安静睡眠，为宾客提供优质、舒适的休憩之所。</p>
										<h4>桔子水晶酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_2.jpg">
										<p>杭州湖滨君亭酒店地处杭州解放路商业中心。免费WIFI网络连接，旨在带给旅行者东方文化体验积累的中端精选酒店。 舒适的客房，加厚鸭绒品牌床垫，健康舒适的睡眠体验；淋浴间充足的水压给客户酣畅的沐浴体验。十三楼屋顶四季咖啡厅，供应丰盛的自助早餐，健康，绿色，一天能量的开始。 地铁1号线 “定安路”站A出口左转步行500米可抵达酒店；百年老店奎元馆，湖滨银泰，湖滨名品街，解放路百货商场等均在300米范围内。</p>
										<h4>杭州湖滨君亭酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_3.jpg">
										<p>杭州暖墅酒店位于杭州市中心下城区庆春路刀茅巷，周边是杭州成熟社区，配套的餐饮，超市，娱乐等设施丰富，充满生活气息。暖墅酒店是根据欧美非常流行的小型精品酒店的理念而打造的连锁酒店品牌。其特色是闹中取静的地理位置，优雅的家庭风格装修，管家式的服务，为旅行的宾客打造“暖墅之家”的温馨氛围。暖墅酒店根据现代人的生活方式，为所有住店的客人提供了暖墅特色服务礼包：健康营养早餐、时令鲜榨蔬果、欢乐下午茶，暖心夜宵，高档赠饮。日本独资品牌沐浴用品、全区域高速上网，特制云梦之床。为您带来舒心的旅程。</p>
										<h4>杭州暖墅酒店</h4>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>
							<li class="" style="width: 720px; float: left; display: block;">
								<div class="test-one">
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_2.jpg">
										<p>杭州湖滨君亭酒店地处杭州解放路商业中心。免费WIFI网络连接，旨在带给旅行者东方文化体验积累的中端精选酒店。 舒适的客房，加厚鸭绒品牌床垫，健康舒适的睡眠体验；淋浴间充足的水压给客户酣畅的沐浴体验。十三楼屋顶四季咖啡厅，供应丰盛的自助早餐，健康，绿色，一天能量的开始。 地铁1号线 “定安路”站A出口左转步行500米可抵达酒店；百年老店奎元馆，湖滨银泰，湖滨名品街，解放路百货商场等均在300米范围内。</p>
										<h4>杭州湖滨君亭酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_3.jpg">
										<p>杭州暖墅酒店位于杭州市中心下城区庆春路刀茅巷，周边是杭州成熟社区，配套的餐饮，超市，娱乐等设施丰富，充满生活气息。暖墅酒店是根据欧美非常流行的小型精品酒店的理念而打造的连锁酒店品牌。其特色是闹中取静的地理位置，优雅的家庭风格装修，管家式的服务，为旅行的宾客打造“暖墅之家”的温馨氛围。暖墅酒店根据现代人的生活方式，为所有住店的客人提供了暖墅特色服务礼包：健康营养早餐、时令鲜榨蔬果、欢乐下午茶，暖心夜宵，高档赠饮。日本独资品牌沐浴用品、全区域高速上网，特制云梦之床。为您带来舒心的旅程。</p>
										<h4>杭州暖墅酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_1.jpg">
										<p>桔子水晶酒店（杭州火车东站店）位于杭州火车东站西广场，旁边有地铁1号线4号线和大量的公交车线路通达杭州各大景点车站。周边配套设施完善，娱乐广场美食街购物中心大型超市一应俱全。酒店由国外着名设计师按五星级标准设计，客房音响系统支持蓝牙、Iphone、Ipad、笔记本可与电视直接相连，房间全部可以无线上网。房内还配备50寸液晶电视、浴缸、电动窗帘等；隔音系统由清华声学所设计，保证一夜安静睡眠，为宾客提供优质、舒适的休憩之所。</p>
										<h4>桔子水晶酒店</h4>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>
							<li class="" style="width: 720px; float: left; display: block;">
								<div class="test-one">
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_3.jpg">
										<p>杭州暖墅酒店位于杭州市中心下城区庆春路刀茅巷，周边是杭州成熟社区，配套的餐饮，超市，娱乐等设施丰富，充满生活气息。暖墅酒店是根据欧美非常流行的小型精品酒店的理念而打造的连锁酒店品牌。其特色是闹中取静的地理位置，优雅的家庭风格装修，管家式的服务，为旅行的宾客打造“暖墅之家”的温馨氛围。暖墅酒店根据现代人的生活方式，为所有住店的客人提供了暖墅特色服务礼包：健康营养早餐、时令鲜榨蔬果、欢乐下午茶，暖心夜宵，高档赠饮。日本独资品牌沐浴用品、全区域高速上网，特制云梦之床。为您带来舒心的旅程。</p>
										<h4>杭州暖墅酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_1.jpg">
										<p>桔子水晶酒店（杭州火车东站店）位于杭州火车东站西广场，旁边有地铁1号线4号线和大量的公交车线路通达杭州各大景点车站。周边配套设施完善，娱乐广场美食街购物中心大型超市一应俱全。酒店由国外着名设计师按五星级标准设计，客房音响系统支持蓝牙、Iphone、Ipad、笔记本可与电视直接相连，房间全部可以无线上网。房内还配备50寸液晶电视、浴缸、电动窗帘等；隔音系统由清华声学所设计，保证一夜安静睡眠，为宾客提供优质、舒适的休憩之所。</p>
										<h4>桔子水晶酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_2.jpg">
										<p>杭州湖滨君亭酒店地处杭州解放路商业中心。免费WIFI网络连接，旨在带给旅行者东方文化体验积累的中端精选酒店。 舒适的客房，加厚鸭绒品牌床垫，健康舒适的睡眠体验；淋浴间充足的水压给客户酣畅的沐浴体验。十三楼屋顶四季咖啡厅，供应丰盛的自助早餐，健康，绿色，一天能量的开始。 地铁1号线 “定安路”站A出口左转步行500米可抵达酒店；百年老店奎元馆，湖滨银泰，湖滨名品街，解放路百货商场等均在300米范围内。</p>
										<h4>杭州湖滨君亭酒店</h4>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>
							<li class="flex-active-slide" style="width: 720px; float: left; display: block;">
								<div class="test-one">
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_1.jpg">
										<p>桔子水晶酒店（杭州火车东站店）位于杭州火车东站西广场，旁边有地铁1号线4号线和大量的公交车线路通达杭州各大景点车站。周边配套设施完善，娱乐广场美食街购物中心大型超市一应俱全。酒店由国外着名设计师按五星级标准设计，客房音响系统支持蓝牙、Iphone、Ipad、笔记本可与电视直接相连，房间全部可以无线上网。房内还配备50寸液晶电视、浴缸、电动窗帘等；隔音系统由清华声学所设计，保证一夜安静睡眠，为宾客提供优质、舒适的休憩之所。</p>
										<h4>桔子水晶酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_2.jpg">
										<p>杭州湖滨君亭酒店地处杭州解放路商业中心。免费WIFI网络连接，旨在带给旅行者东方文化体验积累的中端精选酒店。 舒适的客房，加厚鸭绒品牌床垫，健康舒适的睡眠体验；淋浴间充足的水压给客户酣畅的沐浴体验。十三楼屋顶四季咖啡厅，供应丰盛的自助早餐，健康，绿色，一天能量的开始。 地铁1号线 “定安路”站A出口左转步行500米可抵达酒店；百年老店奎元馆，湖滨银泰，湖滨名品街，解放路百货商场等均在300米范围内。</p>
										<h4>杭州湖滨君亭酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_3.jpg">
										<p>杭州暖墅酒店位于杭州市中心下城区庆春路刀茅巷，周边是杭州成熟社区，配套的餐饮，超市，娱乐等设施丰富，充满生活气息。暖墅酒店是根据欧美非常流行的小型精品酒店的理念而打造的连锁酒店品牌。其特色是闹中取静的地理位置，优雅的家庭风格装修，管家式的服务，为旅行的宾客打造“暖墅之家”的温馨氛围。暖墅酒店根据现代人的生活方式，为所有住店的客人提供了暖墅特色服务礼包：健康营养早餐、时令鲜榨蔬果、欢乐下午茶，暖心夜宵，高档赠饮。日本独资品牌沐浴用品、全区域高速上网，特制云梦之床。为您带来舒心的旅程。</p>
										<h4>杭州暖墅酒店</h4>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>
						<li class="" style="width: 720px; float: left; display: block;">
								<div class="test-one">
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_2.jpg">
										<p>杭州湖滨君亭酒店地处杭州解放路商业中心。免费WIFI网络连接，旨在带给旅行者东方文化体验积累的中端精选酒店。 舒适的客房，加厚鸭绒品牌床垫，健康舒适的睡眠体验；淋浴间充足的水压给客户酣畅的沐浴体验。十三楼屋顶四季咖啡厅，供应丰盛的自助早餐，健康，绿色，一天能量的开始。 地铁1号线 “定安路”站A出口左转步行500米可抵达酒店；百年老店奎元馆，湖滨银泰，湖滨名品街，解放路百货商场等均在300米范围内。</p>
										<h4>杭州湖滨君亭酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_3.jpg">
										<p>杭州暖墅酒店位于杭州市中心下城区庆春路刀茅巷，周边是杭州成熟社区，配套的餐饮，超市，娱乐等设施丰富，充满生活气息。暖墅酒店是根据欧美非常流行的小型精品酒店的理念而打造的连锁酒店品牌。其特色是闹中取静的地理位置，优雅的家庭风格装修，管家式的服务，为旅行的宾客打造“暖墅之家”的温馨氛围。暖墅酒店根据现代人的生活方式，为所有住店的客人提供了暖墅特色服务礼包：健康营养早餐、时令鲜榨蔬果、欢乐下午茶，暖心夜宵，高档赠饮。日本独资品牌沐浴用品、全区域高速上网，特制云梦之床。为您带来舒心的旅程。</p>
										<h4>杭州暖墅酒店</h4>
									</div>
									<div class="col-md-4 test-left">
										<img src="hotel_pictures/test_1.jpg">
										<p>桔子水晶酒店（杭州火车东站店）位于杭州火车东站西广场，旁边有地铁1号线4号线和大量的公交车线路通达杭州各大景点车站。周边配套设施完善，娱乐广场美食街购物中心大型超市一应俱全。酒店由国外着名设计师按五星级标准设计，客房音响系统支持蓝牙、Iphone、Ipad、笔记本可与电视直接相连，房间全部可以无线上网。房内还配备50寸液晶电视、浴缸、电动窗帘等；隔音系统由清华声学所设计，保证一夜安静睡眠，为宾客提供优质、舒适的休憩之所。</p>
										<h4>桔子水晶酒店</h4>
									</div>
									<div class="clearfix"></div>
								</div>
							</li></ul></div><ol class="flex-control-nav flex-control-paging"><li><a class="">1</a></li><li><a class="">2</a></li><li><a class="flex-active">3</a></li></ol><ul class="flex-direction-nav"><li><a class="flex-prev" href="#">Previous</a></li><li><a class="flex-next" href="#">Next</a></li></ul></div>
				</section>
			</div>
		</div>
	</div>
	<!--end-test-->
	<!--FlexSlider-->
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen">
	<script src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
		});
		</script>
	<!--End-slider-script-->
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