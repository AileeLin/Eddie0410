<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.blog.model.*"%>
<%@ page import="com.blog_message.model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	List<blogVO> list = (List)request.getAttribute("list");
	String orderby = request.getParameter("orderby");
	String keyword = request.getParameter("keyword");
	String item = request.getParameter("item");
	String action = request.getParameter("action");
	request.setAttribute("list", list);
	request.setAttribute("orderby", orderby);
	request.setAttribute("keyword", keyword);
	request.setAttribute("item", item);
	request.setAttribute("action", action);
%>

<!DOCTYPE html>
<html>

<head>
<!-- 網頁title -->
<title>Travel Maker</title>
<!-- //網頁title -->
<!-- 指定螢幕寬度為裝置寬度，畫面載入初始縮放比例 100% -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- //指定螢幕寬度為裝置寬度，畫面載入初始縮放比例 100% -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 設定網頁keywords -->
<meta name="keywords" content="TravelMaker,Travelmaker,自助旅行,部落格,旅遊記" />
<!-- //設定網頁keywords -->
<!-- 隱藏iPhone Safari位址列的網頁 -->
<script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
</script>
<!-- //隱藏iPhone Safari位址列的網頁 -->

<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- //JQUERY -->

<!-- bootstrap css、JS檔案 -->
<link href="<%=request.getContextPath()%>/front_end/css/all/index_bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="<%=request.getContextPath()%>/front_end/js/all/index_bootstrap.js"></script>
<!-- //bootstrap-css -->

<!-- 套首頁herder和footer css -->
<link href="<%=request.getContextPath()%>/front_end/css/all/index_style_header_footer.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- //套首頁herder和footer css -->

<!-- font-awesome icons -->
<link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	rel="stylesheet"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<!-- //font-awesome icons -->

<!-- font字體 -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico'
	rel='stylesheet' type='text/css'>
<!-- //font字體 -->

<!-- blog 自定義的css -->
<link href="<%=request.getContextPath()%>/front_end/css/blog/blog_semantic.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/front_end/css/blog/blog.css" rel="stylesheet" type="text/css"
	media="all">
<link href="<%=request.getContextPath()%>/front_end/css/blog/blog_label.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/front_end/css/blog/blog_divider.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/front_end/css/blog/blog_button.css" rel="stylesheet"
	type="text/css">
<link href="<%=request.getContextPath()%>/front_end/css/blog/blog_icon.css" rel="stylesheet"
	type="text/css">
<!-- //blog 自定義的css -->
<!-- blog 自定義的js -->
<script src="<%=request.getContextPath()%>/front_end/js/blog/blog.js"></script>
<script src="<%=request.getContextPath()%>/front_end/js/blog/blog_semantic.min.js"></script>
<!-- //blog 自定義的js -->
<!-- LogoIcon -->
<link href="<%=request.getContextPath()%>/front_end/images/all/Logo_Black_use.png" rel="icon" type="image/png">
<!-- //LogoIcon -->
</head>

<body>
	<!-- banner -->
	<div class="banner about-bg">
		<div class="top-banner about-top-banner">
			<div class="container">
				<div class="top-banner-left">
					<ul>
						<li><i class="fa fa-phone" aria-hidden="true"></i> <a
							href="tel:034257387"> 03-4257387</a></li>
						<li><a href="mailto:TravelMaker@gmail.com"><i
								class="fa fa-envelope" aria-hidden="true"></i>
								TravelMaker@gmail.com</a></li>
					</ul>
				</div>
				<div class="top-banner-right">
					<ul>
						<li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area_home.html"><i class="fa fa-user"
								aria-hidden="true"></i></a></li>
						<li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area_home.html"><i
								class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
						<li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area_home.html"><i
								class="fa fa-envelope" aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="header">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="<%=request.getContextPath()%>/front_end/index.jsp">Travel Maker</a>
					</h1>
				</div>
				<div class="top-nav">
					<!-- 當網頁寬度太小時，導覽列會縮成一個按鈕 -->
					<nav class="navbar navbar-default">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">Menu</button>
						<!-- //當網頁寬度太小時，導覽列會縮成一個按鈕 -->
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="<%=request.getContextPath()%>/front_end/news.jsp">最新消息</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/tour.jsp">景點介紹</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/plan.jsp">行程規劃</a></li>
								<li><a href="<%=request.getContextPath()%>/blog.index">旅遊記</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/ask.jsp">問答區</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/galley.jsp">照片牆</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/chat.jsp">聊天室</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/together.jsp">揪團</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/buy.jsp">交易平台</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/advertisement.jsp">專欄</a></li>
								<div class="clearfix"></div>
							</ul>
						</div>
					</nav>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!-- 內容 -->
	<div class="ui container">
		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->
		<h1 class="ui header">
			<span style="margin-right: 1rem">最新文章列表</span>
			<p style="display: inline-block; font-size: 1rem">
				共 <span>${list.size()}</span> 篇
			</p>
		</h1>
		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->
		<!-- Menu -->
		<FORM METHOD="get" ACTION="<%=request.getContextPath()%>/blog.do">
			<div class="ui tabular menu">
				<a class="item itemRight <%= (orderby.equals("recent"))? "active" : "" %>" href="<%=request.getContextPath()%>/blog.do?orderby=recent<%= (keyword==null)? "" : "&keyword="+keyword %><%= (item==null)? "" : "&item="+item %><%= (action==null)? "" : "&action="+action %>"> 最新分享 </a> 
				<a class="item itemRight <%= (orderby.equals("popular"))? "active" : "" %>" href="<%=request.getContextPath()%>/blog.do?orderby=popular<%= (keyword==null)? "" : "&keyword="+keyword %><%= (item==null)? "" : "&item="+item %><%= (action==null)? "" : "&action="+action %>"> 最多瀏覽 </a>
				<!-- 搜尋BAR -->
				<div class="ui massive right action left icon input">
					<i class="search icon"></i> 
					<input type="text" placeholder="請輸入關鍵字..." name="keyword" value="<%= (keyword==null)? "" : keyword%>"> 
					<input type="hidden" name="action" value="keyword">
					<input type="hidden" name="orderby" value="<%= orderby %>">
					<select class="basic floating dropdown button" name="item">
						<div class="text">請選擇</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<option class="item" value="content">標題、內容</option>
							<option class="item" value="tag">標籤</option>
						</div>
					</select>
				</div>
				<!-- 搜尋BAR -->
			</div>
		</FORM>
		<!-- //Menu -->
		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font color='red'>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
			</font>
		</c:if>
		<!-- 卡片放置區 -->
		<c:if test="${not empty list}">
		<%@ include file="page1.file"%>
		<div class="ui four stackable cards">
			<c:forEach var="blogVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">
				
			<c:set var="bid" value="${blogVO.blog_id}"/>
			<%
				blogMessageService blogMessageSvc = new blogMessageService();
				String bid = (String)pageContext.getAttribute("bid");
				List<blog_messageVO> blogMessageList = blogMessageSvc.findByBlogId(bid);
				pageContext.setAttribute("blogMessageList",blogMessageList);
			%>
				<a class="fluid card" href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blogVO.blog_id}">
					<div class="image">
						<div class="ui image pic">
							<img src="<%=request.getContextPath()%>/blogPicReader?blog_id=${blogVO.blog_id}">
							<div class="ui teal ribbon label">遊記</div>
						</div>
					</div>
					<div class="content">
						<div class="header">${blogVO.blog_title}</div>
						<div class="meta">
							<i class="far fa-calendar-alt"></i> 旅行日期:${blogVO.travel_date}
						</div>
					</div>
					<div class="extra content">
						<span class="right floated">${blogMessageList.size()}個留言</span> <i class="far fa-eye"></i>
						${blogVO.blog_views}
					</div>
					<div class="extra content">
						<div class="right floated author nowrap">
							<img class="ui avatar image"
								src="https://img.travel98.com/avatar/n/19676_8c205e1c94929d8cbed3a0e748dd67f3_n.jpg">
							${blogVO.mem_id}
						</div>
					</div>
				</a>
			</c:forEach>
			<!-- 新增遊記按鈕 -->
			<div class="fab_wrapper">
				<a href="<%=request.getContextPath()%>/front_end/blog/blog_add.jsp" class="ui huge circular red icon button"
					data-content="建立文章遊記" data-variation="basic inverted"
					data-position="left center"> <i class="plus icon"></i>
				</a>
			</div>
			<!-- //新增遊記按鈕 -->
		</div>
		<!-- //卡片放置區 -->
		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->
		<!-- 換頁bar -->
		<div class="ui page grid padded page_bar">
			<!-- 上一頁button -->
			<%@ include file="page3.file"%>
			<!-- //下一頁button -->
			<!-- 頁數資訊 -->
			<div class="page_info">
				顯示第<%= whichPage %>頁，共<%= pageNumber %>頁
			</div>
			<!-- //頁數資訊 -->
		</div>
		<!-- //換頁bar -->
		</c:if>
		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->
	</div>
	<!-- //內容 -->

	<!-- //blog -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>關於我們</h4>
					</div>
					<div class="footer-grid-info">
						<ul>
							<li><a href="about.jsp">關於Travel Maker</a></li>
							<li><a href="about.jsp">聯絡我們</a></li>
							<li><a href="about.jsp">常見問題</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>網站條款</h4>
					</div>
					<div class="footer-grid-info">
						<ul>
							<li><a href="about.jsp">服務條款</a></li>
							<li><a href="services.jsp">隱私權條款</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>社群</h4>
					</div>
					<div class="social">
						<ul>
							<li><a href="https://www.facebook.com/InstaBuy.tw/"
								target="_blank"><i class="fab fa-facebook"></i></a></li>
							<li><a href="https://www.instagram.com/" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-line"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>訂閱電子報</h4>
					</div>
					<div class="footer-grid-info">
						<form action="#" method="post">
							<input type="email" id="mc4wp_email" name="EMAIL"
								placeholder="請輸入您的Email" required=""> <input
								type="submit" value="訂閱">
						</form>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="copyright">
				<p>
					Copyright &copy; 2018 All rights reserved <a href="<%=request.getContextPath()%>/front_end/index.jsp">TravelMaker</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
</body>

</html>
