<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ad.model.*" %>
<%@ page import="com.mem.model.*" %>
<%
	AdService AdSer = new AdService();
    List<AdVO> list = AdSer.getNewAD();
    pageContext.setAttribute("list",list);
    
    
	//若有登入，可以看到登出按鈕
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
	String login,logout;
	if(memberVO != null){		
		login = "display:none;";
		logout = "display:'';";
	}else{
		login = "display:'';";
		logout = "display:none;";
	}
	
	boolean login_state = false ;
	Object login_state_temp = session.getAttribute("login_state");
	
	//確認登錄狀態
	if(login_state_temp != null ){
		login_state= (boolean) login_state_temp ;
	}  
%>
<%
	//取得購物車商品數量
	Object total_items_temp = session.getAttribute("total_items");
	int total_items = 0;
	if(total_items_temp != null ){
		total_items= (Integer) total_items_temp;
	}
	pageContext.setAttribute("total_items",total_items);
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
        <meta name="keywords" content="TravelMaker,travelmaker,自助旅行,部落格,旅遊記" />
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
        <!-- //AD_Page相關CSS及JS -->

        <!-- 聊天相關CSS及JS -->
        <link href="<%=request.getContextPath()%>/front_end/css/chat/chat_style.css" rel="stylesheet" type="text/css">
        <script src="<%=request.getContextPath()%>/front_end/js/chat/chat.js"></script>
        <!-- //聊天相關CSS及JS -->    
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
                            <li>
								<a class="top_banner" href="<%=request.getContextPath()%>/front_end/store/store_cart.jsp">
									<i class="fa fa-shopping-cart shopping-cart" aria-hidden="true"></i><span class="badge">${total_items}</span>
								</a>
							</li>
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
                                <li><a href="<%=request.getContextPath()%>/front_end/news/news.jsp">最新消息</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/attractions/att.jsp">景點介紹</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/trip/trip.jsp">行程規劃</a></li>
                                <li><a href="<%=request.getContextPath()%>/blog.index">旅遊記</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/question/question.jsp">問答區</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/photowall/photo_wall.jsp">照片牆</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/grp/grpIndex.jsp">揪團</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/store/store.jsp">交易平台</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/ad/ad.jsp">專欄</a></li>

                                    <div class="clearfix"> </div>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!-- //banner -->
    
        <!-- AD  -->
        <div class="ui container">
            <!-- 我是隔板 -->
            <div class="ui hidden divider"></div>
            <!-- //我是隔板 -->
            <h1 class="ui header">
                <span style="margin-right: 1rem">旅遊專欄</span>
            </h1>
            <!-- 我是隔板 -->
            <div class="ui hidden divider"></div>
            <!-- //我是隔板 -->
            <!-- 我是頁籤區Strart -->
            <div class="bs-example-tabs">
                <!-- 定義頁籤名稱Strart -->
                <ul id="myTab" class="nav nav-tabs">
                    <li class="">
                        <a href="<%=request.getContextPath()%>/front_end/ad/ad.jsp">
                        	<i class="fab fa-hotjar"></i>熱門 Hot
                        </a>
                    </li>
                    <li role="presentation" class="active">
                        <a href="<%=request.getContextPath()%>/front_end/ad/adAllByNew.jsp">
                        	<i class="fas fa-bullhorn"></i>最新 New
                        </a>
                    </li>
                </ul>
                <!-- 定義頁籤名稱End -->
                <!-- 定義頁籤內容Strart -->
                <div id="myTabContent" class="tab-content  ui piled segment">
					<!-- 定義2st頁籤內容Strart -->
					<div role="tabpanel" class="tab-pane fade active in">
					 	<%@ include file="ad_page1.file" %>
						<% int count_new = 0 ; %>
						<c:forEach var="advo" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowPerPage-1%>">
							<!-- 廣告row start -->
							<div class="row adrow">
							<% count_new++; %>
							<% if ( count_new % 2 != 0){ %>
								<!-- 每一則廣告圖片start -->
								<div class="col-lg-8">
									<a onclick="location.href='<%=request.getContextPath()%>/ad.do?action=updateClick&AD_ID=${advo.ad_ID}';window.open('${advo.ad_Link}')">
								    	<img src="<%=request.getContextPath()%>/ADPicReader?AD_ID=${advo.ad_ID}" alt="${advo.ad_Title}">
									</a>
								</div>
					            <!-- 每一則廣告圖片End -->
					            <!-- 每一則廣告內容start -->
								<div class="col-lg-4">
					              	<!-- 廣告標題 -->
									<h3 class="adTitle"><strong>${advo.ad_Title}</strong></h3>
									<!-- 廣告內容 -->
									<p>${advo.ad_Text}</p>
									<!-- 廣告連結 -->
									<a class="btn btn-success" onclick="location.href='<%=request.getContextPath()%>/ad.do?action=updateClick&AD_ID=${advo.ad_ID}';window.open('${advo.ad_Link}')">
										了解更多
									</a>
								</div>
								<!-- 每一則廣告內容End  -->
							<% } else {%>
								<!-- 每一則廣告內容start -->
								<div class="col-lg-4">
								    <!-- 廣告標題 -->
									<h3 class="adTitle"><strong>${advo.ad_Title}</strong></h3>
									<!-- 廣告內容 -->
									<p>${advo.ad_Text}</p>
									<!-- 廣告連結 -->
									<a class="btn btn-success" onclick="location.href='<%=request.getContextPath()%>/ad.do?action=updateClick&AD_ID=${advo.ad_ID}';window.open('${advo.ad_Link}')">
										了解更多
									</a>
								</div>
								<!-- 每一則廣告內容End  -->
								<!-- 每一則廣告圖片Start -->
								<div class="col-lg-8">
									<a onclick="location.href='<%=request.getContextPath()%>/ad.do?action=updateClick&AD_ID=${advo.ad_ID}';window.open('${advo.ad_Link}')">
								    	<img src="<%=request.getContextPath()%>/ADPicReader?AD_ID=${advo.ad_ID}" alt="${advo.ad_Title}">
									</a>
								</div>
								<!-- 每一則廣告圖片End -->
							<% }%>
							</div>
						<!-- 廣告row end -->
						</c:forEach>
						
					     <!-- 換頁bar -->
					     <div class="ui page grid padded page_bar" style="text-align: center">
							 <%@ include file="ad_page2.file" %>
					         <!-- 頁數資訊 -->
					         <div class="page_info">顯示第<%=whichPage%>頁，共<%=pageNumber%>頁</div>
					         <!-- //頁數資訊 -->
					     </div>
					     <!-- //換頁bar -->
					</div>
					<!-- 定義2st頁籤內容END -->
                </div>
                <!-- //定義頁籤內容End -->
            </div>   
            <!-- 我是頁籤區End -->    
            <!-- 我是隔板 -->
            <div class="ui hidden divider"></div>
            <!-- 我是隔板 -->
        </div>
        <!-- //AD -->
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
                                <li><a href="<%=request.getContextPath()%>/front_end/about_us/about_us.jsp">關於Travel Maker</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/content/content.jsp">聯絡我們</a></li>
                                <li><a href="<%=request.getContextPath()%>/front_end/faq/faq.jsp">常見問題</a></li>
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
                        <a href="index.jsp" target="_blank" title="TravelMaker">TravelMaker</a>
                    </p>
                </div>
            </div>
        </div>
        <!-- //footer -->

    </body>
</html>
