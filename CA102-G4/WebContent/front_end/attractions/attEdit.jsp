<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.attractions.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	MemberVO memVO = (MemberVO)session.getAttribute("memberVO");
	if(memVO==null){
		session.setAttribute("location", "/CA102G4/front_end/attractions/attDetail.jsp");
		session.setAttribute("att_no", request.getParameter("att_no"));
		response.sendRedirect("/CA102G4/front_end/member/mem_login.jsp");
		return;
	}
%>
<jsp:useBean id="attVO" scope="request" type="com.attractions.model.AttractionsVO" />
	
<jsp:useBean id="memberVO" scope="session" type="com.mem.model.MemberVO"/>

<html>
<head>
<!-- 網頁title -->
<title>景點細節</title>
<!-- //網頁title -->
<!-- 指定螢幕寬度為裝置寬度，畫面載入初始縮放比例 100% -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- //指定螢幕寬度為裝置寬度，畫面載入初始縮放比例 100% -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 設定網頁keywords -->
<meta name="keywords" content="TravleMaker,travlemaker,自助旅行" />
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
<!-- bootstrap-css -->
<link
	href="<%=request.getContextPath()%>/front_end/css/all/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- //bootstrap-css -->

<!-- css -->
<link
	href="<%=request.getContextPath()%>/front_end/css/attractions/att_style.css"
	rel="stylesheet" type="text/css" media="all" />

<link
	href="<%=request.getContextPath()%>/front_end/css/attractions/attDetail.css"
	rel="stylesheet">
<!-- //css -->

<!-- font-awesome icons -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	crossorigin="anonymous">
<!-- //font-awesome icons -->

<!-- font字體 -->
<link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico'
	rel='stylesheet' type='text/css'>
<!-- //font字體 -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script	src="<%=request.getContextPath()%>/front_end/js/all/bootstrap.js"></script>

</head>
<body>

	<!-- banner -->
	<div class="banner-bg">
		<div class="banner about-bg">
			<div class="top-banner about-top-banner">
				<div class="container">
					<div class="top-banner-left">
						<ul>
							<li><i class="fa fa-phone" aria-hidden="true"></i> <a
								href="tel:034257387"> 03-4257387</a></li>
							<li><a href="mailto:TravleMaker@gmail.com"><i
									class="fa fa-envelope" aria-hidden="true"></i>
									TravleMaker@gmail.com</a></li>
						</ul>
					</div>
					<div class="top-banner-right">
						<ul>
							<li><a class="top_banner" href="#"><i class="fa fa-user"
									aria-hidden="true"></i></a></li>
							<li><a class="top_banner" href="#"><i
									class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
							<li><a class="top_banner" href="#"><i
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
							<a href="<%=request.getContextPath()%>/front_end/index.jsp">Travle Maker</a>
						</h1>
					</div>
					<div class="top-nav">
						<!-- 當網頁寬度太小時，導覽列會縮成一個按鈕 -->
						<nav class="navbar navbar-default">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse" data-target="#navbar-collapse-menu">Menu
								</button>
							</div>
							<!-- //當網頁寬度太小時，導覽列會縮成一個按鈕 -->
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="navbar-collapse-menu">
								<ul class="nav navbar-nav">
									<li><a
										href="<%=request.getContextPath()%>/front_end/news/news.html">最新消息</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/attractions/att.jsp">景點介紹</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/trip/trip.jsp">行程規劃</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/blog/blog.html">旅遊記</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/ask/ask.html">問答區</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/galley/galley.html">照片牆</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/chat/chat.html">聊天室</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/togetger/together.html">揪團</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/buy/buy.html">交易平台</a></li>
									<li><a
										href="<%=request.getContextPath()%>/front_end/advertisement/advertisement.html">專欄</a></li>
									<div class="clearfix"></div>
								</ul>
							</div>
						</nav>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->

	<div class="ui container">

		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->

		<!--Modal區-->
		<form class="form-inline" method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/attEdit/attEdit.do">
			<div class="modal fade" id="userEditCommit" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">確定送出編輯?</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" align="center">
							<h4>
								編輯景點:${attVO.att_name}<br> --送出後需由管理員審核內容--
							</h4>
						</div>
						<div class="modal-footer">
							<div align="center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-danger">確定</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--//Modal區-->

			<div class="img-container">
				<div class="row">
					<div class="col-lg-8 col-md-8 col-sm-8 col-8" align="left">
						<h3>景點名稱：<input type="text" class="form-control" size="25" placeholder="景點名稱" name="att_name" value="${attVO.att_name}"><span style="color:red;font-size:small;">${errorMsgs.att_name}</span></h3>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-4" align="right">
						<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#userEditCommit">
							送出編輯 <i class="far fa-edit"></i>
						</button>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-6" align="left">
						<div class="polaroid">
							<img
								src="<%= request.getContextPath()%>/trip/getPicture.do?att_no=${attVO.att_no}"
								alt="${attVO.att_name}" style="width: 100%" id="preview_img">
						</div>
						<div class="form-group">
						    <label for="updateImg">上傳圖片</label>
						    <input type="file" id="updateImg" accept="image/*" name="att_picture">
						    <p class="help-block" style="color:red">${errorMsgs.att_picture}</p>
						</div>
					</div>
					<div
						class="col-lg-4 col-md-4 col-sm-4 col-4 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-offset-2">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<tr>
									<th>國家<span style="color:red;font-size:small;">${errorMsgs.country}</span></th>
									<td><input type="text" class="form-control" size="25" placeholder="國家" name="country" value="${attVO.country}"></td>
								</tr>
								<tr>
									<th>區域<span style="color:red;font-size:small;">${errorMsgs.administrative_area}</span></th>
									<td><input type="text" class="form-control" size="25" placeholder="區域" name="administrative_area" value="${attVO.administrative_area}"></td>
								</tr>
								<tr>
									<th>緯度<span style="color:red;font-size:small;">${errorMsgs.att_lat}</span></th>
									<td><input type="text" class="form-control" size="25" placeholder="緯度" name="att_lat" value="${attVO.att_lat}"></td>
								</tr>
								<tr>
									<th>經度<span style="color:red;font-size:small;">${errorMsgs.att_lon}</span></th>
									<td><input type="text" class="form-control" size="25" placeholder="經度" name="att_lon" value="${attVO.att_lon}"></td>
								</tr>
								<tr>
									<th>地址<span style="color:red;font-size:small;">${errorMsgs.att_address}</span></th>
									<td><input type="text" class="form-control" size="25" placeholder="地址" name="att_address" value="${attVO.att_address}"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<h3>景點介紹<span style="color:red;font-size:small;">${errorMsgs.att_information}</span></h3>
					<hr>
					<p>
						<textarea name="att_information" class="form-control" style="width:100%;height:15rem;resize:none;"><c:out value="${attVO.att_information}" default="尚無內容"></c:out></textarea>
					</p>
					<hr>
				</div>
			</div>
			<input type="hidden" name="action" value="userEditCommit"> 
			<input type="hidden" name="mem_id" value="${memberVO.mem_Id}">
			<input type="hidden" name="att_no" value="${attVO.att_no}">
		</form>
		<!-- 我是隔板 -->
		<div class="ui hidden divider"></div>
		<!-- //我是隔板 -->
	</div>

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
							<li><a href="about.html">關於Travle Maker</a></li>
							<li><a href="about.html">聯絡我們</a></li>
							<li><a href="about.html">常見問題</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>網站條款</h4>
					</div>
					<div class="footer-grid-info">
						<ul>
							<li><a href="about.html">服務條款</a></li>
							<li><a href="services.html">隱私權條款</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3 footer-grid">
					<div class="footer-grid-heading">
						<h4>社群</h4>
					</div>
					<div class="social">
						<ul>
							<li><a href="https://www.facebook.com/InstaBuy.tw/"><i
									class="fab fa-facebook"></i></a></li>
							<li><a href="https://www.instagram.com/"><i
									class="fab fa-instagram"></i></a></li>
							<li><a href="#"><i class="fab fa-line"></i></a></li>
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
					Copyright &copy; 2018 All rights reserved <a href="<%=request.getContextPath()%>/front_end/index.jsp"
						target="_blank" title="TravleMaker">TravleMaker</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<script	src="<%=request.getContextPath()%>/front_end/js/attEdit/preview_img.js"></script>
</body>
</html>