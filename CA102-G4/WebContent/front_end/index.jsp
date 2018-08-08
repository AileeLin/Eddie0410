<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.blog.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("Pragma","no-cache"); 
	response.setHeader("Cache-Control","no-store"); 
	response.setDateHeader("Expires", 0);
	
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	String login,logout;
	if(memberVO != null){		
		login = "display:none;";
		logout = "display:'';";
	}else{
		login = "display:'';";
		logout = "display:none;";
	}
	
	boolean login_state = false;
	Object login_state_temp = session.getAttribute("login_state");
	if(login_state_temp!=null){
		login_state=(boolean)login_state_temp;
	}
%>
<!DOCTYPE html>
<html>
<jsp:useBean id="blogSvc" scope="page" class="com.blog.model.blogService"></jsp:useBean>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>
<jsp:useBean id="adSvc" scope="page" class="com.ad.model.AdService"></jsp:useBean>
<jsp:useBean id="grpSvc" scope="page" class="com.grp.model.GrpService"></jsp:useBean>
<head>
    <!-- 網頁title -->
    <title>Travel Maker</title>
    <!-- //網頁title -->

    <!-- 指定螢幕寬度為裝置寬度，畫面載入初始縮放比例 100% -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- //指定螢幕寬度為裝置寬度，畫面載入初始縮放比例 100% -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- 設定網頁keywords -->
    <meta name="keywords" content="TravelMaker,Travelmaker,自助旅行" />
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

    <!-- bootstrap css及JS檔案 -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="<%=request.getContextPath()%>/front_end/js/all/index_bootstrap.js"></script>
    <!-- //bootstrap css及JS檔案 -->

    <!-- css -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //css -->

    <!-- js -->
    <script src="<%=request.getContextPath()%>/front_end/js/all/index.js"></script>
    <!-- //js -->
    
    <!-- 幻燈片css -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_ken_burns.css" rel="stylesheet">
    <!-- //幻燈片css -->

    <!-- font-awesome icons -->
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!-- //font-awesome icons -->

    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->
    <!-- LogoIcon -->
    <link href="<%=request.getContextPath()%>/front_end/images/all/Logo_Black_use.png" rel="icon" type="image/png">
    <!-- //LogoIcon -->
</head>

<body>
    <!-- banner -->
    <div class="banner" style="width: 100%;left:0;">
        <div class="top-banner" style="border-bottom: 0;">
            <div class="container">
                <div class="top-banner-left">
                    <ul>
                        <li><i class="fa fa-phone" aria-hidden="true"></i>
                            <a href="tel:034257387"> 03-4257387</a></li>
                        <li><a href="mailto:TravelMaker@gmail.com"><i class="fa fa-envelope" aria-hidden="true"></i> TravelMaker@gmail.com</a></li>
                    </ul>
                </div>
                <div class="top-banner-right">
                		
                		<!-- 暫時登出用的 -->
                     <ul>
                        <li>
                        	<!-- 判斷是否登入，若有登入將會出現登出按鈕 -->
                         <c:choose>
                          <c:when test="<%=login_state %>">
                           <a href="<%= request.getContextPath()%>/front_end/member/member.do?action=logout"><span class=" top_banner"><i class=" fas fa-sign-out-alt" aria-hidden="true"></i></span></a>
                          </c:when>
                          <c:otherwise>
                           <a href="<%= request.getContextPath()%>/front_end/member/mem_login.jsp"><span class="top_banner"><i class=" fa fa-user" aria-hidden="true"></i></span></a>
                          </c:otherwise>
                         </c:choose>
                         </li>
                        <li style="<%= logout %>"><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area/personal_area_home.jsp"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                        
                        <li><a class="top_banner" href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                        <li><a class="top_banner" href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <hr style="width: 1200px;border-top: 1px solid #eee;margin-top: 0px;margin-bottom: 0px;">
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
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu
                        </button>
                        <!-- //當網頁寬度太小時，導覽列會縮成一個按鈕 -->
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
								<li><a href="<%=request.getContextPath()%>/front_end/news.jsp">最新消息</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/attractions/att.jsp">景點介紹</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/trip/trip.jsp">行程規劃</a></li>
								<li><a href="<%=request.getContextPath()%>/blog.index">旅遊記</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/ask.jsp">問答區</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/galley.jsp">照片牆</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/together.jsp">揪團</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/buy.jsp">交易平台</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/ad/ad.jsp">專欄</a></li>
								<div class="clearfix"></div>
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- //banner -->
    
    
    <div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
        <!-- 搜尋 -->
        <FORM METHOD="GET" ACTION="<%=request.getContextPath()%>/blog.do">
	        <div class="row" style="position: absolute">
	            <div class="col-sm-6 col-sm-offset-3">
	                <div class="input-group" id="search_place">
	                    <input type="text" name="keyword" class="form-control" placeholder="搜尋遊記、行程、景點、餐廳、飯店">
	                    <input type="hidden" name="action" value="searchAll">
	                    <span class="input-group-btn">
	                <button class="btn btn-default submit" type="submit">
	                    <i class="fa fa-search"></i>
	                </button>
	            </span>
	                </div>
	            </div>
	        </div>
        </form>
        <!-- //搜尋 -->
        <!-- Wrapper for Slides 幻燈片 熱門景點 -->
        <div class="carousel-inner" role="listbox">

            <!-- First Slide 第一張幻燈片 -->
            <div class="item active">
                <div class="slider">
                    <a href="#">
                        <div class="carousel-caption kb_caption slider-grid" style="padding-top:0px;">
                            <h3 style="line-height:290px">金門國家公園</h3>
<!--                             <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
                        </div>
                    </a>
                </div>
            </div>

            <!-- Second Slide 第二張幻燈片 -->
            <div class="item">
                <div class="slider slider1">
                    <a href="#">
                        <div class="carousel-caption kb_caption kb_caption_right slider-grid" style="padding-top:0px;">
                            <h3 style="line-height:290px">Taroko National Park</h3>
<!--                             <p>Vivamus vel nulla venenatis, tincidunt mi vel, consequat erat.</p> -->
                        </div>
                    </a>
                </div>
            </div>

            <!-- Third Slide 第三張幻燈片 -->
            <div class="item">
                <div class="slider slider2">
                    <a href="#">
                        <div class="carousel-caption kb_caption kb_caption_center slider-grid" style="padding-top:0px;">
                            <h3 style="line-height:290px">Taipei</h3>
<!--                             <p>Nunc turpis purus, vestibulum at quam ac, feugiat dignissim nunc</p> -->
                        </div>
                    </a>
                </div>
            </div>
            
        </div>
        <!-- //Wrapper for Slides 幻燈片 熱門景點 -->
        <!-- Left Button 切換幻燈片左按鈕 -->
        <a class="left carousel-control kb_control_left kb_icons" href="#kb" role="button" data-slide="prev">
            <span class="fas fa-angle-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <!-- Right Button 切換幻燈片右按鈕 -->
        <a class="right carousel-control kb_control_right kb_icons" href="#kb" role="button" data-slide="next">
            <span class="fas fa-angle-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- 熱門行程 -->
    <div class="about">
        <div class="container">
            <div class="w3l-about-heading">
                <h2>Top Tours</h2>
            </div>

            <div class="about-grids">
                <div class="col-md-3 about-grid">
                    <div class="about-grid-info effect-1">
                        <a href="#">
                            <h4>San Francisco</h4>
                        </a>
                    </div>
                </div>

                <div class="col-md-3 about-grid">
                    <div class="about-grid-info about-grid-info1 effect-1">
                        <a href="#">
                            <h4>Maldives</h4>
                        </a>
                    </div>
                </div>

                <div class="col-md-3 about-grid">
                    <div class="about-grid-info about-grid-info2 effect-1">
                        <a href="#">
                            <h4>Ireland</h4>
                        </a>
                    </div>
                </div>

                <div class="col-md-3 about-grid">
                    <div class="about-grid-info about-grid-info3 effect-1">
                        <a href="#">
                            <h4>New Zealand</h4>
                        </a>
                    </div>
                </div>

                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- //熱門景點 -->

    <!-- 熱門旅遊記 -->
    <div class="news">
        <div class="container">
            <div class="news-heading">
                <h3>Popular Travels</h3>
            </div>
            <div class="news-grids" style="display:flex">
				<c:forEach var="blogVO" items="${blogSvc.allByHotFour}">
	                <div class="col-md-3 news-grid" style="display:flex">
	                    <div class="agile-news-grid-info" style="width:100%">
	                        <div class="news-grid-info-img">
	                            <a href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blogVO.blog_id}">
	                            	<img src="<%=request.getContextPath()%>/blogPicReader?blog_id=${blogVO.blog_id}" alt="${blogVO.blog_title}" />
	                            </a>
	                        </div>
	                        <div class="news-grid-info-bottom">
	                            <div class="date-grid">
	                                <div class="admin" style="line-height: 18px;">
	                                    <a href="#">
	                                    	<i class="fa fa-user" aria-hidden="true"></i> ${memSvc.findByPrimaryKey(blogVO.mem_id).mem_Name}</a>
	                                </div>
	                                <div class="time" style="float:unset">
	                                    <p><i class="fa fa-calendar" aria-hidden="true"></i> ${blogVO.travel_date}</p>
	                                </div>
	                                <div class="clearfix"> </div>
	                            </div>
	                            <div class="news-grid-info-bottom-text">
	                                <a href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blogVO.blog_id}">${blogVO.blog_title}</a>
	                                <c:set var="blog_content" value="${blogVO.blog_content}"/> 
	                                <p class="news-grid-info-bottom-text-content"><%= ((String)pageContext.getAttribute("blog_content")).replaceAll("<[^>]*>","").trim()%></p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
               	<div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- //熱門旅遊記 -->

    <!-- 最新旅遊記 -->
    <div class="news">
        <div class="container">
            <div class="news-heading">
                <h3>Together</h3>
            </div>
            <div class="news-grids" style="display:flex">
				<c:forEach var="grpVO" items="${grpSvc.all}" begin="0" end="3">
	                <div class="col-md-3 news-grid" style="display:flex">
	                    <div class="agile-news-grid-info" style="width:100%">
	                        <div class="news-grid-info-img">
	                            <a href="#">
	                            	<img src="<%=request.getContextPath()%>/grpPicReader?grp_Id=${grpVO.grp_Id}" alt="" style="height:179.250px;"/>
	                            </a>
	                        </div>
	                        <div class="news-grid-info-bottom">
	                            <div class="date-grid">
	                                <div class="admin" style="line-height: 18px;">
	                                    <a href="#"><i class="fa fa-user" aria-hidden="true"></i> 
	                                    	${memSvc.findByPrimaryKey(grpVO.mem_Id).mem_Name}
	                                    </a>
	                                </div>
	                                <div class="time" style="float:unset">
	                                    <p><i class="fa fa-calendar" aria-hidden="true"></i>
	                                    <fmt:formatDate value="${grpVO.grp_Start}" type="date"/>
	                                    </p>
	                                </div>
	                                
	                           		<div class="clearfix"> </div>
	                           	</div>
	                            <div class="date-grid">
	                                <div class="admin" style="line-height: 18px;margin-top: 10px;">
	                                    <a href="#"><i class="fas fa-map-marker-alt"></i>
	                                    	${grpVO.trip_Locale}
	                                    </a>
	                                </div>
	                                <div class="time" style="float:unset;line-height:35px">
	                                    <p><img class="price" src="<%=request.getContextPath()%>/front_end/fonts/all/dollar-coin-money.svg" style="width:18px;height:18px"></i>
	                                    	${grpVO.grp_Price}
	                                    </p>
	                                </div>
	                                
	                                <div class="clearfix"> </div>
	                            </div>
	                            <div class="news-grid-info-bottom-text">
	                                <a href="#">
	                                ${grpVO.grp_Title}
	                                </a>
	                                <c:set var="trip_Details" value="${grpVO.trip_Details}"/>   
	                                <p class="news-grid-info-bottom-text-content"><%= ((String)pageContext.getAttribute("trip_Details")).replaceAll("<[^>]*>","").trim()%></p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>
				
				
               		<div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- //最新旅遊記 -->
    
    
    <!-- 熱門促銷 -->
    <div id="kb2" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
        <ol class="carousel-indicators">
        	<c:forEach var="adList" items="${adSvc.hotAD}" begin="0" end="0">
            	<li data-target="#kb2" class="active"></li>
            </c:forEach>
            <c:forEach var="adList" items="${adSvc.hotAD}" begin="1" end="${adSvc.hotAD.size()-1}">
            	<li data-target="#kb2"></li>
            </c:forEach>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- 投影片 -->
            <c:forEach var="adVO" items="${adSvc.hotAD}" begin="0" end="0">
	            <div class="item active">
	                <div class="offer">
	                    <div class="container">
	                        <a href="${adVO.ad_Link}" target="_blank">
	                            <div class="wthree-offer-grid" style="background:url('<%=request.getContextPath()%>/ADPicReader?AD_ID=${adVO.ad_ID}') no-repeat center center;background-size:cover">
	                            </div>
	                        </a>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
            <!-- //投影片 -->
            
			<!-- 第二張投影片 -->
            <c:forEach var="adVO" items="${adSvc.hotAD}" begin="1" end="${adSvc.hotAD.size()-1}">
	            <div class="item">
	                <div class="offer">
	                    <div class="container">
	                        <a href="${adVO.ad_Link}" target="_blank">
	                            <div class="wthree-offer-grid" style="background:url('<%=request.getContextPath()%>/ADPicReader?AD_ID=${adVO.ad_ID}') no-repeat center center;background-size:cover">
	                            </div>
	                        </a>
	                    </div>
	                </div>
	            </div>
            </c:forEach>
			<!-- //第二張投影片 -->
        </div>
        <!-- Left Button 切換幻燈片左按鈕 -->
        <a class="left carousel-control kb_control_left kb_icons" href="#kb2" role="button" data-slide="prev">
            <span class="fas fa-angle-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <!-- Right Button 切換幻燈片右按鈕 -->
        <a class="right carousel-control kb_control_right kb_icons" href="#kb2" role="button" data-slide="next">
            <span class="fas fa-angle-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- //熱門促銷 -->

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
                            <li><a href="about.html">關於Travel Maker</a></li>
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
                            <li><a href="https://www.facebook.com/InstaBuy.tw/" target="_blank"><i class="fab fa-facebook"></i></a></li>
                            <li><a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a></li>
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
                            <input type="email" id="mc4wp_email" name="EMAIL" placeholder="請輸入您的Email" required="">
                            <input type="submit" value="訂閱">
                        </form>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="copyright">
                <p>Copyright &copy; 2018 All rights reserved
                    <a href="index.html" target="_blank" title="TravelMaker">TravelMaker</a>
                </p>
            </div>
        </div>
    </div>
    <!-- //footer -->
    <script src="<%=request.getContextPath()%>/front_end/js/all/index_SmoothScroll.min.js"></script>
</body>

</html>
