<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.blog.model.*"%>
<%@ page import="com.blog_tag_name.model.*" %>
<%@ page import="com.mem.model.*"%>
<%
	response.setHeader("Pragma","no-cache"); 
	response.setHeader("Cache-Control","no-store"); 
	response.setDateHeader("Expires", 0);
	
	
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
		
	blogVO blogVO = (blogVO) request.getAttribute("blogVO");
	
	blogTagNameService blogTagNameSvc = new blogTagNameService();
	List<blog_tag_nameVO> list = blogTagNameSvc.getAll();
	request.setAttribute("list", list);

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
    <!-- JQUERY-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- //JQUERY -->
    <!-- bootstrap css及 JS檔案 -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="<%=request.getContextPath()%>/front_end/js/all/index_bootstrap.js"></script>
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

    <!-- blog使用到的jQuery Dialog -->
    <link href="<%=request.getContextPath()%>/front_end/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/front_end/jquery-ui-1.12.1/jquery-ui.js"></script>
    <!-- //blog使用到的jQuery Dialog -->

    <!-- blog 自定義的css -->
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_divider.css" rel="stylesheet" type="text/css" media="all">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog.css" rel="stylesheet" type="text/css" media="all">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_icon.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_add_semantic.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_add.css" rel="stylesheet" type="text/css" media="all">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_add_button.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog_semantic.min.css" rel="stylesheet" type="text/css">
    <!-- //blog 自定義的css -->

    <!-- blog 自定義的js-->
    <script src="<%=request.getContextPath()%>/front_end/js/blog/blog_semantic.min.js"></script>
    <script src="<%=request.getContextPath()%>/front_end/js/blog/blog_add.js"></script>
    <script src="<%=request.getContextPath()%>/front_end/blog_ckeditor/ckeditor.js"></script>
    <!-- //blog 自定義的js -->
    <!-- LogoIcon -->
    <link href="<%=request.getContextPath()%>/front_end/images/all/Logo_Black_use.png" rel="icon" type="image/png">
    <!-- //LogoIcon -->
    <script>
		$(function() {
			$( "#datepicker" ).datepicker({
				  showAnim: "slideDown",
				  maxDate: "-1d",
				  dateFormat : "yy-mm-dd"
				});
		});
		
	</script>
</head>

<body>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/blog.do" name="form2" enctype="multipart/form-data">
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
                <input type="hidden" name="action" value="insert">
                <input type="hidden" name="mem_id" value="${memberVO.mem_Id}">
                <button class="circular ui icon basic button submit" data-content="發佈文章" data-variation="inverted">
                    <i class="send icon"></i>
                </button>
                <div class="top-nav">
                    <!-- 當網頁寬度太小時，導覽列會縮成一個按鈕 -->
                    <nav class="navbar navbar-default">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu
                        </button>
                        <!-- //當網頁寬度太小時，導覽列會縮成一個按鈕 -->
                    </nav>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- //banner -->
    <div class="container">
        <!-- 我是隔板 -->
        <div class="ui hidden divider"></div>
        <!-- //我是隔板 -->
		
        <!-- 行程單區塊 -->
        <div class="Travel">
            <div class="itinerary_title">
                <span class="itinerary">行程單</span>
                <span class="fas fa-angle-up" title="展開"></span>
                <span class="fas fa-angle-down" title="收起" style="display: none"></span>
            </div>
            <!-- 載入的行程單區塊 -->
            <div class="contentTableDiv" style="display: none">
                <table class="contentTable">
                    <!-- 暫無行程單、+載入行程區塊 -->
                    <tr>
                        <td colspan="6">
                            <div class="addItinerary">
                                <span><i class="far fa-calendar-alt"></i> 暫無行程單</span>
                                <div class="ui labeled icon button" id="loadItinerary">
                                    <i class="fas fa-plus"></i> 載入行程
                                </div>
                            </div>
                        </td>
                    </tr>
                    <!-- //暫無行程單、+載入行程區塊 -->
                    <!-- 載入的行程 -->
                    <tr class="loadItineraryTitle">
                        <th><span class="far fa-calendar-plus"></span> 日期</th>
                        <th><span class="fas fa-map-marker-alt"></span> 城市</th>
                        <th><span class="fas fa-eye"></span> 景點</th>
                        <th><span class="fas fa-building"></span> 酒店</th>
                    </tr>
                    <tr class="loadItineraryContent">
                        <td>
                            <p>2018/06/30</p>
                        </td>
                        <td>
                            <p>台北</p>
                            <p>新竹</p>
                        </td>
                        <td>
                            <p>1. 士林夜市</p>
                            <p>2. 淡水老街</p>
                            <p>3. 北投溫泉</p>
                            <p>4. 象山</p>
                            <p>5. 內灣</p>
                        </td>
                        <td>
                            <p>施泰根博閣甘達塢伊灣酒店</p>
                        </td>
                    </tr>
                    <tr class="loadItineraryContent">
                        <td>
                            <p>2018/07/01</p>
                        </td>
                        <td>
                            <p>高雄</p>
                            <p>屏東</p>
                        </td>
                        <td>
                            <p>1. 愛河</p>
                            <p>2. 高雄捷運</p>
                            <p>3. 夜市</p>
                            <p>4. 墾丁海邊</p>
                            <p>5. 墾丁大街</p>
                        </td>
                        <td>
                            <p>公園</p>
                        </td>
                    </tr>
                    <!-- 載入的行程 -->
                </table>
                <!-- //載入的行程單區塊 -->
            </div>
        </div>
        <!-- //行程單區塊 -->
        <form METHOD="post" ACTION="<%=request.getContextPath()%>/blog.do" name="form1">
            <!-- 文章標題區塊 -->
            <input type="text" placeholder="請輸入文章標題" name="title" maxlength="30" value="<%= (blogVO==null)? "" : blogVO.getBlog_title()%>"/>
            <!-- //文章標題區塊 -->
            <!-- 封面照片 -->
            <p>封面照片：<input type="file" name="travel_coverimage" accept="image/*" value="<%= (blogVO==null)? "" : blogVO.getBlog_coverimage()%>"></p>
            <!-- //封面照片 -->
           	<!-- 旅遊日期 -->
           	<p>日期：<input type="text" id="datepicker" size="30" readonly name="travel_date" value="<%= (blogVO==null)? "" : blogVO.getTravel_date()%>"></p>
            <!-- //旅遊日期 -->
            <!-- 標籤 -->
			<div class="ui sub header">設定標籤可以增加文章的曝光率唷!</div>
			<select multiple="" name="tag" class="ui multiple selection dropdown">
					<option value="">添加標籤</option>
					<c:forEach var="blogTagNameVO" items="${list}">
					<option value="${blogTagNameVO.btn_id}">${blogTagNameVO.btn_class} - ${blogTagNameVO.btn_name}</option>
					</c:forEach>
			</select>
			<!-- //標籤 -->
            <!-- 編輯器區塊 -->
            <textarea name="editor1">
            <%= (blogVO==null)? "" : blogVO.getBlog_content()%>
            </textarea>
            <!-- //編輯器區塊 -->
        </form>
    </div>
</FORM>
        <!-- 右邊的Go to top Button -->
        <button id="myBtn" title="Go to top">
            <i class="fas fa-chevron-up"></i>
        </button>
        <!-- //右邊的Go to top Button -->
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
                    <a href="<%=request.getContextPath()%>/front_end/index.jsp" target="_blank" title="TravelMaker">TravelMaker</a>
                </p>
            </div>
        </div>
    </div>
    <!-- //footer -->
    <!-- //editorJS -->
    <script>
        CKEDITOR.replace('editor1', {
            extraPlugins: 'base64image',
            removePlugins: 'image',
            removePlugins: 'resize',
            height: 700,
            removeDialogTabs: 'image:advanced;link:advanced',
        });
        //            extraPlugins: 'autogrow',
        //            autoGrow_minHeight: 500,

    </script>
    <!-- //editorJS -->
        <!-- 載入行程Dialog -->
        <div id="loadItineraryList">

            <div class="ItineraryListModalContent">
                <div class="ui selection dropdown">
                    <input type="hidden" name="ItineraryList" class="ItineraryInput" name="trip">
                    <i class="dropdown icon"></i>
                    <div class="default text">選擇您的行程</div>
                    <div class="menu">
                        <div class="item">黃世銘的韓國行程(5天)</div>
                        <div class="item">黃世銘的日本行程(7天)</div>
                        <div class="item">黃世銘的紐約行程(20天)</div>
                        <div class="item">黃世銘的宿霧行程(7天)</div>
                        <div class="item">黃世銘的泰國行程(6天)</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //載入行程Diglog -->  
       <%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
		  <div class="warning" id="warning">
		  	<div class="warning_content">
        	<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
			</div>
       	 </div>
		</c:if>
</body>

</html>
