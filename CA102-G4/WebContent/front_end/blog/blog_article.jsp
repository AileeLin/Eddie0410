<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.blog.model.*"%>
<%@ page import="com.blog_message.model.*"%>
<%@ page import="com.blog_collect.model.*"%>
<%
blogService blogSvc = new blogService();
blogVO blogVO = blogSvc.findByPrimaryKey(request.getParameter("blogID"));

List<blogVO> list = blogSvc.getThreeByMem_id(blogVO.getMem_id(), blogVO.getBlog_id());
pageContext.setAttribute("list", list);

List<blogVO> memBlogList = blogSvc.findByMemId(blogVO.getMem_id());
pageContext.setAttribute("memBlogList", memBlogList);

blogMessageService blogMessageSvc = new blogMessageService();
List<blog_messageVO> blogMessageList = blogMessageSvc.findByBlogId(blogVO.getBlog_id());
pageContext.setAttribute("blogMessageList",blogMessageList);

blogCollectService blogCollectSvc = new blogCollectService();
List<blog_collectVO> blogCOllectList = blogCollectSvc.getAllByBlogId(blogVO.getBlog_id());
pageContext.setAttribute("blogCOllectList", blogCOllectList);

int cnt = blogCollectSvc.findByPrimaryKey(blogVO.getMem_id(), blogVO.getBlog_id());
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
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="<%=request.getContextPath()%>/front_end/js/all/index_bootstrap.js"></script>
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_grid.css" rel="stylesheet">
    <!-- //bootstrap-css -->

    <!-- 套首頁herder和footer css -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_style_header_footer.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //套首頁herder和footer css -->

    <!-- font-awesome icons -->
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!-- //font-awesome icons -->

    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->

    <!-- blog 自定義的css -->
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_semantic.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog.css" rel="stylesheet" type="text/css" media="all">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_divider.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_button.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_icon.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_atricle.css" rel="stylesheet">
    <!-- //blog 自定義的css -->

    <!-- blog 自定義的js -->
    <script src="<%=request.getContextPath()%>/front_end/js/blog/blog.js"></script>
    <script src="<%=request.getContextPath()%>/front_end/js/blog/blog_semantic.min.js"></script>
    <script src="<%=request.getContextPath()%>/front_end/js/blog/blog_article.js"></script>
    <!-- //blog 自定義的js -->
    <!-- LogoIcon -->
    <link href="<%=request.getContextPath()%>/front_end/images/all/Logo_Black_use.png" rel="icon" type="image/png">
    <!-- //LogoIcon -->
    <script src="<%=request.getContextPath()%>/front_end/blog_ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
    $(".ui.button.collect").click(function(){
    	var action = "collect";
    	var blog_id = "<%= blogVO.getBlog_id() %>";
    	var mem_id = "<%= blogVO.getMem_id() %>";
		var collectMessage = document.getElementById("collectMessage");
    	$.ajax({
    		url:"<%=request.getContextPath()%>/blog.do",
    		method:"POST",
    		data:{action:action,blog_id:blog_id,mem_id:mem_id},
    		async: false, 
    		success:function(msg){
    			collectMessage.innerHTML=msg;

    		},
    		error:function(msg){
    			collectMessage.innerHTML=msg;
    		}
    	});
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
                        <li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area_home.html"><i class="fa fa-user" aria-hidden="true"></i></a></li>
                        <li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area_home.html"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
                        <li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area_home.html"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
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
								<li><a href="<%=request.getContextPath()%>/front_end/chat.jsp">聊天室</a></li>
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
    <!-- 我是隔板 -->
    <div class="ui hidden divider"></div>
    <!-- //我是隔板 -->
    <!-- 內容 -->
    <div class="container" id="container">

        <div class="row">
            <!-- 左邊內容 -->
            <div class="col-8">
                <!-- 左邊文章標題 -->
                <h1 class="article_title">
                   <%= blogVO.getBlog_title() %>
                </h1>
                <!-- //左邊文章標題 -->
                <!-- 左邊文章標題下方統計數字 -->
                <div class="article_brief_info">
                    <ul class="helper-clear">
                        <li class="brief_info author far fa-user"><a href="#">&nbsp;<%= blogVO.getBlog_id() %></a></li>
                        <li class="brief_info_divider"></li>
                        <li class="brief_info date_icon release_date far fa-calendar-alt">
                            <label>&nbsp;發表日期：</label><%= blogVO.getTravel_date() %></li>
                        <li class="brief_info_divider"></li>
                        <li class="brief_info view_cnt far fa-eye">&nbsp;<%= blogVO.getBlog_views() %>&nbsp;次瀏覽</li>
                        <li class="brief_info_gap"></li>
                        <li class="brief_info reply_cnt far fa-comment">&nbsp;<%= blogMessageList.size() %>&nbsp;個留言</li>
                        <li class="brief_info_gap"></li>
                        <li class="brief_info like_cnt far fa-heart" data-like_cnt="0">&nbsp;<%= blogCOllectList.size() %>&nbsp;人收藏</li>
                    </ul>
                </div>
                <!-- //左邊文章標題下方統計數字 -->
                <!-- 我是隔板 -->
                <div class="ui hidden divider"></div>
                <!-- //我是隔板 -->
                <!-- 遊記內容 -->
                <div class="article_content">
                    <%= blogVO.getBlog_content() %>
                </div>
                <!-- //遊記內容 -->
                <!-- 我是隔板 -->
                <div class="ui hidden divider"></div>
                <!-- //我是隔板 -->
                <!-- 留言區 -->
                <div class="ui threaded comments">

                    <h3 class="ui dividing header">
                        <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;"><%= blogMessageList.size() %>則留言</font>
                        </font>
                    </h3>

                    <div class="comment">
                        <a class="avatar"><img src="<%=request.getContextPath()%>/front_end/images/all/ailee.jpg"></a>
                        <div class="content">
                            <a class="author">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">林育萱</font>
                                </font>
                            </a>
                            <div class="metadata">
                                <span class="date">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">
                                            今天下午5:42
                                        </font>
                                    </font>
                                </span>
                            </div>
                            <div class="text">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">
                                        測試測試~哈囉哈囉
                                    </font>
                                </font>
                            </div>
                            <div class="actions">
                                <a class="reply">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">回覆</font>
                                    </font>
                                </a>
                                <a class="report">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">檢舉</font>
                                    </font>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="comment">
                        <a class="avatar"><img src="<%=request.getContextPath()%>/front_end/images/all/ga.jpg"></a>
                        <div class="content">
                            <a class="author">
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;">蔡秉嘉</font>
                                </font>
                            </a>
                            <div class="metadata">
                                <span class="date">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">
                                            昨天上午12:30
                                        </font>
                                    </font>
                                </span>
                            </div>
                            <div class="text">
                                <p>
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">
                                            第二個測試
                                        </font>
                                    <font style="vertical-align: inherit;">
                                            安安
                                        </font>
                                    </font>
                                </p>
                            </div>
                            <div class="actions">
                                <a class="reply">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">回覆</font>
                                    </font>
                                </a>
                                <a class="report">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">檢舉</font>
                                    </font>
                                </a>
                            </div>
                        </div>

                        <!--留言的回覆，到時候有要做再做
                        <div class="comments">
                            <div class="comment">
                                <a class="avatar">
          <img src="C:\Users\Java\Pictures\eddie.jpg">
        </a>
                                <div class="content">
                                    <a class="author">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">黃世銘</font>
                                        </font>
                                    </a>
                                    <div class="metadata">
                                        <span class="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">現在</font></font></span>
                                    </div>
                                    <div class="text">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">
                                                好哦!!測試!!!!!!!
                                            </font>
                                        </font>
                                    </div>
                                    <div class="actions">
                                        <a class="reply">
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">回覆</font>
                                            </font>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    留言的回覆，到時候有要做再做-->

                        <div class="comment">
                            <a class="avatar"><img src="<%=request.getContextPath()%>/front_end/images/all/yuan.jpg"></a>
                            <div class="content">
                                <a class="author">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">李浩源</font>
                                    </font>
                                </a>
                                <div class="metadata">
                                    <span class="date">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">
                                                5天前
                                            </font>
                                        </font>
                                    </span>
                                </div>
                                <div class="text">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">
                                            好餓好餓~~
                                        </font>
                                    <font style="vertical-align: inherit;">
                                            要不要吃飯
                                        </font>
                                    </font>
                                </div>
                                <div class="actions">
                                    <a class="reply">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">回覆</font>
                                        </font>
                                    </a>
                                    <a class="report">
                                        <font style="vertical-align: inherit;">
                                            <font style="vertical-align: inherit;">檢舉</font>
                                        </font>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- 留言區-看更多 -->
                        <li class="comment_next_page_btn" data-next_page="1">
                            <i class="loader"></i>看更多
                        </li>
                        <!-- //留言區-看更多 -->
                        <!-- 留言區輸入內容的地方 -->
                        <form class="ui reply form">
                            <div class="field">
                                <a name="textareaField">
                                    <textarea style="margin-top: 0px; margin-bottom: 0px; height: 160px;"></textarea>
                                </a>
                            </div>
                            <div class="ui blue labeled submit icon button">
                                <i class="icon edit"></i>
                                <font style="vertical-align: inherit;">
                                    <font style="vertical-align: inherit;"> 留言
                                    </font>
                                </font>
                            </div>
                        </form>
                        <!-- //留言區輸入內容的地方 -->
                    </div>
                    <!-- //留言區 -->
                    <!-- 我是隔板 -->
                    <div class="ui hidden divider"></div>
                    <!-- //我是隔板 -->
                </div>
            </div>
            <!-- //左邊內容 -->
<!--              onclick="location.href='#textareaField'" -->
            <!-- 右邊內容 -->
            <div class="col-4">
                <!-- 檢舉、收藏、留言按鈕 -->
                <div class="ui basic buttons">
                    <button class="ui button"><i class="fas fa-ban"></i> 檢舉</button>
                    <button class="ui button collect" id="collect"><i class="collection far fa-heart" style="font-weight:<%=(cnt==0)?"400":"900"%>;color:<%=(cnt==0)?"black":"red"%>"></i> 收藏</button>
                    <button class="ui button reply"><i class="far fa-comment-dots"></i> 留言</button>
                </div>
                <!-- //檢舉、收藏、留言按鈕 -->
                <!-- 我是隔板 -->
                <div class="ui hidden divider"></div>
                <!-- //我是隔板 -->
                <!-- 作者區 -->
                <!-- 作者區如果沒有設定背景的話，預設在css裡設定 -->
                <div class="article_author_block">
                    <!-- //作者區如果沒有設定背景的話，預設在css裡設定 -->
                    <!-- 作者區 -->
                    <!-- 作者區自行設定的背景 -->
                    <div class="article_cover" style="background-image:url();">
                        <!-- //作者區自行設定的背景 -->
                        <!-- 作者區的大頭貼 -->
                        <a href="#">
                            <div class="article_author_avatar" style="background-image:url(https://avatars2.githubusercontent.com/u/40755159?s=460&v=4);"></div>
                        </a>
                        <!-- //作者區的大頭貼 -->
                        <!-- 作者區下半部 -->
                        <div class="article_author_info">
                            <div class="article_author">
                                <a href="#"><%= blogVO.getBlog_id() %>的文章遊記</a>
                            </div>
                            <ul class="article_author_count">
                                <a href="#">
                                    <li>
                                        <span class="count">0</span>
                                        <label class="cntlabel">行程</label>
                                    </li>
                                </a>
                                <li class="list_divider"></li>
                                <a href="#">
                                    <li>
                                        <span class="count"><%= memBlogList.size() %></span>
                                        <label class="cntlabel">文章</label>
                                    </li>
                                </a>
                                <li class="list_divider"></li>
                                <a href="#">
                                    <li>
                                        <span class="count">0</span>
                                        <label class="cntlabel">照片</label>
                                    </li>
                                </a>
                            </ul>
                        </div>
                        <!-- //作者區下半部 -->
                    </div>
                </div>
                <!-- 作者區 -->
                <!-- 我是隔板 -->
                <div class="ui hidden divider"></div>
                <!-- //我是隔板 -->
                <!-- 作者的最近文章 -->
                <c:if test="${not empty list}">
                
                <div class="widgetcontainerheader">
                    <%= blogVO.getBlog_id() %>的最近文章
                </div>
                
                <div class="widgetcontainer">
                    <ul class="helper-clear sidebar_list">
                    
					<c:forEach var="blogVO" items="${list}">
					
                        <li class="article journal">
                            <div class="cover_border">
                                <a href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blogVO.blog_id}">
                                    <div class="article_cover" style="background-image:url(<%=request.getContextPath()%>/blogPicReader?blog_id=${blogVO.blog_id});"></div>
                                </a>
                            </div>
                            <div class="article_body">
                                <div class="article_title right">
                                    <a href="#" title="${blogVO.blog_title}">${blogVO.blog_title}</a>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info author">
                                        <a href="#">&nbsp;<%= blogVO.getBlog_id() %></a>
                                    </div>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info view_cnt">${blogVO.blog_views}&nbsp;次瀏覽</div>
                                    <div class="brief_info_divider_right"></div>
                                    <div class="brief_info like_cnt">5&nbsp;人收藏</div>
                                </div>
                            </div>
                        </li>
                        
					</c:forEach>

                    </ul>
                </div>
                <!-- //作者的最近文章 -->
                </c:if>
            </div>
            <!-- //右邊內容 -->
        </div>
        <!-- 右邊的Go to top Button -->
        <button id="myBtn" title="Go to top">
            <i class="fas fa-chevron-up"></i>
        </button>
        <!-- //右邊的Go to top Button -->
    </div>

    <!-- //內容 -->
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
                <div class="clearfix"></div>
            </div>
            <div class="copyright">
                <p>Copyright &copy; 2018 All rights reserved
                    <a href="<%=request.getContextPath()%>/front_end/index.jsp" target="_blank" title="TravelMaker">TravelMaker</a>
                </p>
            </div>
        </div>
    </div>
    <!-- //footer -->
    	<div id="collectMessage"></div>
</body>

</html>
