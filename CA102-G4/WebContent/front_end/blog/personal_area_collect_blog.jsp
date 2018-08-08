<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.blog.model.*"%>
<%@ page import="com.blog_message.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
	response.setHeader("Pragma","no-cache"); 
	response.setHeader("Cache-Control","no-store"); 
	response.setDateHeader("Expires", 0);
	// 取得controller轉交查詢的list資料
	List list = (List)request.getAttribute("list");
	//
// 	blogVO blogVO = blogSvc.findByPrimaryKey(request.getParameter("blogID"));
	//這裡的會員ID，應該要從session拿，取得登入者的ID
// 	List<blogVO> list = blogSvc.findByMemId(blogVO.getMem_id());
// 	List<blogVO> blogVOList = blogSvc.findByMemId("M000009");
// 	pageContext.setAttribute("list", list);
	String action = request.getParameter("action");
// 	String action = "myBlog";

	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); 
	if(memberVO == null){
		memberVO = (MemberVO)session.getAttribute("memberVO");
	}
	

	boolean login_state = false;   
		Object login_state_temp = session.getAttribute("login_state");
		if(login_state_temp!=null){
		login_state=(boolean)login_state_temp;
		}
	
		if(login_state!=true){
		session.setAttribute("location", request.getRequestURI());
	 	response.sendRedirect("/CA102G4/front_end/member/mem_login.jsp");
	 	return;
	 	}
%>
<jsp:useBean id="blogSvc" scope="page" class="com.blog.model.blogService" />
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
    
    <!-- bootstrap css及JS檔案 -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="<%=request.getContextPath()%>/front_end/js/all/index_bootstrap.js"></script>
    <!-- //bootstrap-css -->

    <!-- semantic css -->
    <link href="<%=request.getContextPath()%>/front_end/css/ad/ad_semantic.min.css" rel="stylesheet" type="text/css">
    <!-- //semantic css -->

    <!-- 套首頁herder和footer css -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //套首頁herder和footer css -->

    <!-- font-awesome icons -->
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!-- //font-awesome icons -->

    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->

    <!-- AD_Page相關CSS及JS -->
    <link href="<%=request.getContextPath()%>/front_end/css/ad/ad_page.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/personal/personal_area_home.css" rel="stylesheet" type="text/css">
    <!-- //AD_Page相關CSS及JS -->

    <!-- 自定義css -->
    <link href="<%=request.getContextPath()%>/front_end/css/personal/personal_area_blog.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_divider.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_button.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- //自定義css -->
    <!-- 自定義js -->
    <script src="<%=request.getContextPath()%>/front_end/js/blog/personal_area_blog.js"></script>
    <!-- 自定義js -->
    <!-- LogoIcon -->
    <link href="<%=request.getContextPath()%>/front_end/images/all/Logo_Black_use.png" rel="icon" type="image/png">
    <!-- //LogoIcon -->
    <script>
    $(document).ready(function () {
        $(".btn.mx-2.editBlog").click(function(event){
        	event.preventDefault();
        });
        
       $(".btn.mx-2.delBlog").click(function(e){
        	event.preventDefault();
       });
       
    });
    </script>
    
        
    <!-- blog使用到的jQuery Dialog -->
    <link href="<%=request.getContextPath()%>/front_end/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/front_end/jquery-ui-1.12.1/jquery-ui.js"></script>
    <!-- //blog使用到的jQuery Dialog -->
    
</head>

<body>
    <!-- banner -->
    <div class="banner about-bg">
        <div class="top-banner about-top-banner">
            <div class="container">
                <div class="top-banner-left">
                    <ul>
                        <li><i class="fa fa-phone" aria-hidden="true"></i>
                            <a href="tel:034257387"> 03-4257387</a></li>
                        <li><a href="mailto:TravelMaker@gmail.com"><i class="fa fa-envelope" aria-hidden="true"></i> TravelMaker@gmail.com</a></li>
                    </ul>
                </div>
                <div class="top-banner-right">
                     <ul>
                          <li> <a href="<%= request.getContextPath()%>/front_end/member/member.do?action=logout"><span class=" top_banner"><i class=" fas fa-sign-out-alt" aria-hidden="true"></i></span></a></li>
                          <li> <a href="<%= request.getContextPath()%>/front_end/member/mem_login.jsp"><span class="top_banner"><i class=" fa fa-user" aria-hidden="true"></i></span></a></li>
						  <li><a class="top_banner" href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                       	  <li><a class="top_banner" href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
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
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu
                        </button>
                        <!-- //當網頁寬度太小時，導覽列會縮成一個按鈕 -->
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
								<li><a href="<%=request.getContextPath()%>/front_end/news.jsp">最新消息</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/tour.jsp">景點介紹</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/plan.jsp">行程規劃</a></li>
								<li><a href="<%=request.getContextPath()%>/blog.index">旅遊記</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/ask.jsp">問答區</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/galley.jsp">照片牆</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/together.jsp">揪團</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/buy.jsp">交易平台</a></li>
								<li><a href="<%=request.getContextPath()%>/front_end/advertisement.jsp">專欄</a></li>
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

  <!--container-->
    <div class="ui container">
        <!--會員個人頁面標頭-->
        <div class="mem_ind_topbar">
            <!--會員封面-->
            <div class="mem_ind_banner">
                <img src="<%=request.getContextPath()%>/front_end/images/all/person_bar.jpg">
            </div>
            <!--會員訊息--> 
            <div class="mem_ind_info"> 
                <div class="mem_ind_img">
                    <img src="<%=request.getContextPath()%>/front_end/readPic?action=member&id=${memberVO.mem_Id}">
                </div>
                <div class="mem_ind_name">
                    <p>${memberVO.mem_Name}</p>
                    <p class="text-truncate" style="font-size:0.9em;padding-top:10px;max-height:110px">
					   ${memberVO.mem_Profile}
                    </p>
                </div>
            </div> 
        </div>
        <!--//會員個人頁面標頭-->
        <div class="mem_ind_content">
            <!-- 頁籤項目 -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a href="personal_area_home.html">
                        <i class="fas fa-home"></i>首頁
                    </a>
                </li>
                <li class="nav-item">
                    <a href="personal_area_friend.html">
                        <i class="fas fa-user-friends"></i>好友
                    </a>
                </li>
                <li class="nav-item active">
                    <a>
                        <i class="fab fa-blogger"></i>旅遊記
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#trip">
                        <i class="fas fa-map"></i>行程
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#together">
                        <i class="fas fa-bullhorn"></i>揪團
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#question">
                        <i class="question circle icon"></i>問答
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#gallery">
                        <i class="image icon"></i>相片
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#gallery">
                        <i class="shopping bag icon"></i>交易
                    </a>
                </li>

                <li class="nav-item" style="float: right">
                    <a href="#setting">
                        <i class="cog icon"></i>設置
                    </a>
                </li>
            </ul>
            <!-- //頁籤項目 -->
            
		<!-- Menu -->
		<div id="all_fri_search">
                   <div style="width: 100%;float: left">
                       <ul class="nav nav-tabs" id="friCate">
                          <li class="<%= (action.equals("myBlog"))? "active" : "" %>"><a href="<%=request.getContextPath()%>/blog.do?action=myBlog&mem_id=${memberVO.mem_Id}"><i class="fab fa-blogger"></i>我的</a></li>
                          <li class="<%= (action.equals("myCollect"))? "active" : "" %>"><a href="<%=request.getContextPath()%>/blog.do?action=myCollect&mem_id=${memberVO.mem_Id}"><i class="fas fa-heart"></i>收藏</a></li>
                        </ul>
                   </div>
        </div>
        <!-- //Menu -->
            <c:if test="${empty list}">
            	<div>你還沒有收藏文章哦!!</div>
            </c:if>
            <!-- 卡片 -->
            <c:if test="${not empty list}">
            <%@ include file="page1.file"%>
            <div class="ui four stackable cards">
			<c:forEach var="blog_collectVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<c:set var="bid" value="${blog_collectVO.blog_id}"/>
			<%
				blogMessageService blogMessageSvc = new blogMessageService();
				String bid = (String)pageContext.getAttribute("bid");
				List<blog_messageVO> blogMessageList = blogMessageSvc.findByBlogId(bid);
				pageContext.setAttribute("blogMessageList",blogMessageList);
			%>
			<c:forEach var="blogVO" items="${blogSvc.allByNew}">
			<c:if test="${blogVO.blog_id==blog_collectVO.blog_id}">
                <a class="ui fluid card" href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blog_collectVO.blog_id}">
                    <div class="image">
                        <div class="ui image pic">
                            <img src="<%=request.getContextPath()%>/blogPicReader?blog_id=${blog_collectVO.blog_id}">
                        </div>
                    </div>
                    <div class="content">
                        <div class="header">
                            ${blogVO.blog_title}
                        </div>
                        <div class="meta">
                            <i class="far fa-calendar-alt"></i> 旅行日期:${blogVO.travel_date}
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">${blogMessageList.size()}個留言</span>
                        <i class="far fa-eye"></i> ${blogVO.blog_views}次瀏覽
                    </div>
                    
                    <div class="extra content edit_Del">
                        <div class="right floated author nowrap">
                        <form name="delete" class="delete form" METHOD="POST" ACTION="<%=request.getContextPath()%>/blog.do?">
                            <div class="btn mx-2 delBlog">
                                <i class="far fa-trash-alt"></i> 刪除收藏
                                <input type="hidden" name="action" value="delCollect">
                                <input type="hidden" name="blog_id" value="${blogVO.blog_id}">
                                <input type="hidden" name="whichPage" value="${param.whichPage}">
                            </div>
                        </form>
                        </div>
                    </div>
                </a>
                </c:if>
                </c:forEach>
			</c:forEach>
            </div>

            <!-- //卡片 -->
            <!-- 我是隔板 -->
            <div class="ui hidden divider"></div>
            <!-- //我是隔板 -->
		<!-- 換頁bar -->
		<div class="ui page grid padded page_bar">
			<!-- 上一頁button -->
			<%@ include file="page6.file"%>
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
    </div>
    <!--//container-->




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

	<div id="delete">
	<div>你確定要刪除收藏嗎?</div>
	</div>
</body>

</html>