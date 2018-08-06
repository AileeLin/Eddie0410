<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="javax.servlet.http.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.photo.model.*" %>
<%@ page import="com.blog.model.*" %>
<%@ page import="com.chat.model.*" %>
<%@ page import="com.fri.model.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="memberSvc" scope="page" class="com.mem.model.MemberService"></jsp:useBean>
<jsp:useBean id="chatRoomSvc" scope="page" class="com.chat.model.ChatRoomService"></jsp:useBean>
<jsp:useBean id="chatRoomJoinSvc" scope="page" class="com.chat.model.ChatRoom_JoinService"></jsp:useBean>
<%
	
	boolean login_state = false ;
	Object login_state_temp = session.getAttribute("login_state");
	
	//確認登錄狀態
	if(login_state_temp != null ){
		login_state= (boolean) login_state_temp ;
	}
	
	//若登入狀態為不是true，紀錄當前頁面並重導到登入畫面。
	if( login_state != true){
		session.setAttribute("location", request.getRequestURI());
		response.sendRedirect(request.getContextPath()+"/front_end/member/mem_login.jsp");
		return;
	}
		
	//取得登錄者的照片牆
	Photo_wallJDBCDAO photoSvc = new Photo_wallJDBCDAO(); 
	List<Photo_wallVO> photoList=photoSvc.getAll_ByMemID(((MemberVO)session.getAttribute("memberVO")).getMem_Id());
	pageContext.setAttribute("photoList", photoList);
	
	//取得登錄者的部落格
	blogService blogSvc = new blogService();
	List<blogVO> blogList=blogSvc.findByMemId(((MemberVO)session.getAttribute("memberVO")).getMem_Id());
	pageContext.setAttribute("blogList", blogList);
	
	//取得登錄者所參與的聊天對話***********可能要存成session
	List<ChatRoom_JoinVO> myCRList =chatRoomJoinSvc.getMyChatRoom(((MemberVO)session.getAttribute("memberVO")).getMem_Id());
	Set<ChatRoom_JoinVO> myCRGroup = new HashSet<>(); //裝著我參與的聊天對話為群組聊天時
	for(ChatRoom_JoinVO myRoom : myCRList){
		//查詢我參與的那間聊天對話，人數為??
		List<ChatRoom_JoinVO> joinPeople = chatRoomJoinSvc.getJoinMem_ByChatRoom(myRoom.getChatRoom_ID());
		if(joinPeople.size() > 2){
			myCRGroup.add(myRoom);
		}
	}
	pageContext.setAttribute("myCRList", myCRGroup);
	
	/***************取出會員的好友******************/
	FriendService friSvc = new FriendService();
	List<Friend> myFri = friSvc.findMyFri(((MemberVO)session.getAttribute("memberVO")).getMem_Id(),2); //互相為好友的狀態
	pageContext.setAttribute("myFri",myFri);

	
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
    <link href="<%=request.getContextPath()%>/front_end/css/personal/personal_area_home.css" rel="stylesheet" type="text/css">
    <!-- //AD_Page相關CSS及JS -->
    
    <!-- 聊天相關CSS及JS -->
    <link href="<%=request.getContextPath()%>/front_end/css/chat/chat_style.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/front_end/js/chat/chat.js"></script>
    <!-- //聊天相關CSS及JS -->
    
    

    

</head>

<body onload="connect();">
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<div class="modal fade" id="errorModal">
		    <div class="modal-dialog modal-sm" role="dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <i class="fas fa-exclamation-triangle"></i>
		          <span class="modal-title"><h4>&nbsp;注意：</h4></span>
		        </div>
		        <div class="modal-body">
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red" type="square">${message}</li>
					</c:forEach>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
		        </div>
		      </div>
		    </div>
		 </div>
	</c:if>
	<%-- 錯誤表列 --%>


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
                        <li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/personal_area/personal_area_home.jsp"><i class="fa fa-user" aria-hidden="true"></i></a></li>
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
                                <li><a href="news.html">最新消息</a></li>
                                <li><a href="tour.html">景點介紹</a></li>
                                <li><a href="plan.html">行程規劃</a></li>
                                <li><a href="blog.html">旅遊記</a></li>
                                <li><a href="ask.html">問答區</a></li>
                                <li><a href="galley.html">照片牆</a></li>
                                <li><a href="chat.html">聊天室</a></li>
                                <li><a href="together.html">揪團</a></li>
                                <li><a href="buy.html">交易平台</a></li>
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
                   	<c:choose>
                  		<c:when test="${memberVO.mem_Photo == null}">
                  			<img src='<%=request.getContextPath()%>/front_end/images/all/mem_nopic.jpg'>
                  		</c:when>
                  		<c:otherwise>
                  			<img src='<%=request.getContextPath()%>/front_end/readPic?action=member&id=${memberVO.mem_Id}'>
                  		</c:otherwise>
                  	</c:choose>
                </div>
                <div class="mem_ind_name">
                    <p>${memberVO.mem_Name}
                    	${memberVO.mem_Sex == 1 ? "<i class='fas fa-male' style='color:#4E9EE2'></i>" : "<i class='fas fa-female' style='color:#EC7555'></i>"}	
                    </p> 
                    <p class="text-truncate" style="font-size:0.9em;padding-top:10px;max-height:110px">
					   ${memberVO.mem_Profile}
                    </p>
                </div>
            </div> 
        </div>
        <!--//會員個人頁面標頭-->
        <!--會員個人頁面-首頁內容-->
        <div class="mem_ind_content">
          <!-- 頁籤項目 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item active">
              <a href="<%=request.getContextPath()%>/front_end/personal_area/personal_area_home.jsp">
                  <i class="fas fa-home"></i>首頁
              </a>
            </li>
            <li class="nav-item">
              <a href="<%=request.getContextPath()%>/front_end/personal_area/personal_area_friend.jsp">
                  <i class="fas fa-user-friends"></i>好友
              </a>
            </li>
            <li class="nav-item">
              <a href="personal_area_blog.html">
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
                  <i class="money bill alternate icon"></i>銷售
              </a>
            </li>

             <li class="nav-item">
              <a href="#gallery">
                  <i class="shopping cart icon"></i>購買
              </a>
            </li>
            <li class="nav-item" style="float: right">
              <a href="<%=request.getContextPath()%>/front_end/member/member.do?action=getOne_For_Display&mem_Id=${memberVO.mem_Id}">
                  <i class="cog icon"></i>設置
              </a>
            </li>
          </ul>
          <!-- //頁籤項目 -->
          <!-- 頁籤項目-首頁內容 -->
          <div class="tab-content" style="float:left;width:75%">
            <!--首頁左半邊-個人首頁-->
            <div id="home" class="container tab-pane active">
               <!--首頁我的照片列表-->
               <div class="u_ind_item">
                  <div class="u_title">
                      <strong>我的照片</strong>
                      <a href="#"><i class="angle double right icon"></i>更多</a>
                      <div>
                          <span>${photoList.size()}</span>
                          <span>張照片</span>
                      </div>
                  </div>
                  <div class="mem_ind_item_photo">
                  <c:choose>
                  	<c:when test="${not empty photoList}">
                      <div class="flex">
						<c:forEach var="photovo" items="${photoList}" begin="0" end="4">
							<div class="item">
						    	<a href="">
						        	<img src="<%=request.getContextPath()%>/front_end/readPic?action=photowall&id=${photovo.photo_No}">
						    	</a>
							</div>
						</c:forEach>
                      </div>
                     </c:when>
                     <c:otherwise>
                     	<img src="<%=request.getContextPath()%>/front_end/images/all/nothing.png" class="nothing">尚未發表
                     </c:otherwise>
                  </c:choose>
                  </div>
               </div>
               <!--首頁我的照片列表-->
               <hr>
               <!--首頁我的旅遊記列表-->
               <div class="u_ind_item">
                  <div class="u_title">
                      <strong>我的旅遊記</strong>
                      <a href="#"><i class="angle double right icon"></i>更多</a>
                      <div>
                          <span>${blogList.size()}</span>
                          <span>篇遊記</span>
                      </div>
                  </div>
                  <div class="mem_ind_item_blog">
                  	<!--我的旅遊記列表 start  -->
                     <div class="ui items">
                        <c:choose>
                     	  <c:when test="${not empty blogList}">
                     		<c:forEach var="blogvo" items="${blogList}" begin="0" end="2">
	                      	  <!-- 部落格區塊 -->
		                      <div class="item col-12">
		                        <div class="ui small image ">
		                          <a href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blogvo.blog_id}">
		                              <img src="<%=request.getContextPath()%>/blogPicReader?blog_id=${blogvo.blog_id}"/>
		                          </a>
		                        </div>
		                        <div class="content">
		                          <div class="text-truncate header">${blogvo.blog_title}</div>
		                          <div class="meta">
		                            <span class="stay">
		                            	<i class="fas fa-calendar-alt"></i>
		                            	${blogvo.travel_date}
		                            </span>
		                          </div>
		                          <div class="description">
		                          	<i class="fas fa-align-justify"></i>
		                            <span class="_shortText">
		                                
		                                <c:set var="blog_content" value="${blogvo.blog_content}"/>
										<%= ((String)pageContext.getAttribute("blog_content")).replaceAll("<[^>]*>","").trim()%>
		                            </span>
		                          </div>
		                        </div>
		                      </div>
		                    </c:forEach>
	                      	  <!-- 部落格區塊 -->
	                       </c:when>
	                       <c:otherwise>
	                       		<img src="<%=request.getContextPath()%>/front_end/images/all/nothing.png" class="nothing">尚未發表
	                       </c:otherwise>
	                     </c:choose>
                     </div>  
                     <!--我的旅遊記列表 end  -->
                  </div>
               </div>
               <hr>
               <!--首頁我的行程列表-->
               <div class="u_ind_item">
                  <div class="u_title">
                      <strong>我的行程</strong>
                      <a href="#"><i class="angle double right icon"></i>更多</a>
                      <div>
                          <span>11</span>
                          <span>篇行程</span>
                      </div>
                  </div>
                  <div class="mem_ind_item_plan">
                     <div class="ui items">
                      <div class="item">
                        <div class="ui small image">
                         <a href="">
                          <img src="<%=request.getContextPath()%>/front_end/images/all/2.jpg">
                         </a>
                        </div>
                        <div class="content">
                          <div class="header">水宝小慢的澳大利亚行程</div>
                          <div class="meta">
                            <span class="stay"><i class="fas fa-calendar-alt"></i> 13天</span>
                          </div>
                          <div class="description">
                            <p>
                                <i class="fas fa-map-marker-alt"></i> 
                                北京>悉尼>澳大利亚蓝山>霍巴特>阿德莱德>悉尼>北京京>悉尼>澳大利亚蓝山>霍巴特>阿德莱德>悉尼>北
                            </p>
                          </div>
                        </div>
                      </div>
                      <div class="item">
                        <div class="ui small image">
                         <a href="">
                          <img src="<%=request.getContextPath()%>/front_end/images/all/2.jpg">
                         </a>
                        </div>
                        <div class="content">
                          <div class="header">水宝小慢的澳大利亚行程</div>
                          <div class="meta">
                            <span class="stay"><i class="fas fa-calendar-alt"></i> 13天</span>
                          </div>
                          <div class="description">
                            <p>
                                <i class="fas fa-map-marker-alt"></i> 
                                北京>悉尼>澳大利亚蓝山>霍巴特>阿德莱德>悉尼>北京京>悉尼>澳大利亚蓝山>霍巴特>阿德莱德>悉尼>北
                            </p>
                          </div>
                        </div>
                      </div>
                      <div class="item">
                        <div class="ui small image">
                         <a href="">
                          <img src="<%=request.getContextPath()%>/front_end/images/all/2.jpg">
                         </a>
                        </div>
                        <div class="content">
                          <div class="header">水宝小慢的澳大利亚行程</div>
                          <div class="meta">
                            <span class="stay"><i class="fas fa-calendar-alt"></i> 13天</span>
                          </div>
                          <div class="description">
                            <p>
                                <i class="fas fa-map-marker-alt"></i> 
                                北京>悉尼>澳大利亚蓝山>霍巴特>阿德莱德>悉尼>北京京>悉尼>澳大利亚蓝山>霍巴特>阿德莱德>悉尼>北
                            </p>
                          </div>
                        </div>
                      </div>
                     </div>  
                  </div>
               </div>
               <br>
            </div>
            <!--//首頁左半邊-個人首頁-->
          </div>
          <!--頁籤項目-首頁內容-->
          <!--首頁右半邊-->                
          <div style="width:25%;float:left" class="add_Div">
                <div>
                    <a href="blog_add.jsp" class="adddiv_a">
                        <div style="color:rgb(93,187,133)">
                            <i class="fas fa-edit"></i><br>
                            寫旅遊記
                        </div>        
                    </a>
                    <a href="" class="adddiv_a">
                        <div style="color:rgb(245,177,0)">
                            <i class="far fa-calendar-check"></i><br>
                            規劃行程
                        </div>  
                    </a>
                    <a href="" class="adddiv_a">
                        <div style="color:rgb(242,102,34)">
                        <i class="fas fa-bullhorn"></i><br>
                        揪旅伴去
                        </div>  
                    </a>
                    <a href="" class="adddiv_a">
                        <div style="color:rgb(81,167,219)">
                            <i class="fas fa-comment-dots"></i><br>
                            提問題去
                        </div> 
                    </a>

                </div>
            </div>
          <!--//首頁右半邊--> 
        </div>
        <!-- //會員個人頁面內容 -->
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
    
	<!--小的聊天列表 startOK -->
    <div class="chatContainer">
        <div class="chatHeader">
            
                &nbsp;聊天室
                <span style="float: right;padding-right: 10px" id="chat_addFri_span">
                    <span data-toggle="tooltip" title="建立新對話" data-placement="top" >
                        <i class="fas fa-user-plus"></i>
                    </span>
                </span> 

        </div>
        <div class="chatContext">
            <ul class="list-group">
            	<li style="color: #4a4a4a;font-weight: bold;">好友</li>
            	<!-- 這邊是列出我的朋友-->
            	<c:forEach var="friVO" items="${myFri}">
 					<li class="list-group-item" id="${friVO.memID_Fri}status" onclick="checkOneByOneCR('${memberVO.mem_Id}','${friVO.memID_Fri}');">
             			<img class='avatar' src='<%=request.getContextPath()%>/front_end/readPic?action=member&id=${friVO.memID_Fri}'>
               			<!--//顯示好友名-->
	                	${memberSvc.getOneMember(friVO.memID_Fri).mem_Name}
	                	<span class="online_status">
	                		<i class='fas fa-circle' style='color:#ADB5BD'></i>
	                	</span>
	                </li>
	                </span>
                </c:forEach>
                <li style="color: #4a4a4a;font-weight: bold;">群組對話</li>
             	<!-- 這邊是列出我參加的群組聊天-->
            	<c:forEach var="crjVO" items="${myCRList}">
 					<li class="list-group-item" id="${crjVO.chatRoom_ID}item" onclick="openChatRoom('${crjVO.chatRoom_ID}','${chatRoomSvc.getOne_ByChatRoomID(crjVO.chatRoom_ID).chatRoom_Name}');">
	                	<c:choose>
		                	<c:when test="${chatRoomJoinSvc.getJoinMem_ByChatRoom(crjVO.chatRoom_ID).size() == 2}">
		                		<c:forEach var="kk" items="${chatRoomJoinSvc.getJoinMem_ByChatRoom(crjVO.chatRoom_ID)}">
		                			<c:if test="${kk.join_MemID != memberVO.mem_Id}">
		                				<img class='avatar' src='<%=request.getContextPath()%>/front_end/readPic?action=member&id=${kk.join_MemID}'>
		                			</c:if>
		                		</c:forEach>
		                	</c:when>
		                	<c:otherwise>
		                		<!-- 若為群組的時候，顯示群組的小圖片 -->		
               					<img class='avatar' src='<%=request.getContextPath()%>/front_end/images/all/team.png'>
		                	</c:otherwise>
	                	</c:choose>
               			<!--//顯示對應的聊天對話_名稱-->
	                	${chatRoomSvc.getOne_ByChatRoomID(crjVO.chatRoom_ID).chatRoom_Name}
	                	<!-- 選單 -->
	                	<span class="caret"></span>
					  	<ul class="dropdown-menu">
					    	<li><a href="#">Action</a></li>
					  	</ul>
	                </li>
	                </span>
                </c:forEach>
            </ul>
        </div>
        <div class="chatFooter">
            <div class="input-group">
              <span class="input-group-addon" id="basic-addon1"><i class="fas fa-search"></i></span>
              <input type="text" class="form-control" placeholder="搜尋" aria-describedby="basic-addon1" id="search_Fri">
            </div>
        </div>
    </div>
	<!--小的聊天列表 END -->
    
	<!-- Modal 建立群組聊天對話 start-->
    <div class="modal fade" id="chat_AddFri_Modal" role="dialog">
        <div class="modal-dialog">
		<!-- Form開頭:新增群組聊天對話 OK-->   
		<form action="<%=request.getContextPath()%>/chatRoom.do" method="post" onsubmit="return checkAddNewCR(this);">	
          <!-- Modal 建立聊天視窗content start-->
          <div class="modal-content" >
            
            <div class="modal-header">
              <h4 class="modal-title">建立群組</h4>
            </div>
       
            <div class="modal-body"> 
                <!--輸入盒聊天對話-->
                <div class="ui left icon input fluid">
                  <input type="text" placeholder="為群組命名" id="chatName" name="input_newChatName" required>
                  <i class="users icon"></i>
                </div>
                <!--分隔線-->
                <hr>
                <!--搜尋要加入聊天對話的好友-->
                <div style="height:400px;margin-top:10px">
                      <div style="float:left;width:60%;height:inherit">
                          <div class="ui icon input fluid">
                              <input type="text" placeholder="搜尋要加入的用戶" id="search_Fri_modal">
                              <i class="search icon"></i>
                          </div>
                          <div class="ui middle aligned selection list" style="height:89%;overflow:auto">
                           <!-- 列出所有我的朋友 -->
                           <c:forEach var="frivo" items="${myFri}">
	                           <div class="item">
	                               <input type="checkbox" class="ui checkbox" id="${frivo.memID_Fri}" name="select_fri" value="${frivo.memID_Fri}">
	                               <label for="${frivo.memID_Fri}" style="width:80%">
	                                  <img class="ui avatar image" src='<%=request.getContextPath()%>/front_end/readPic?action=member&id=${frivo.memID_Fri}'>
	                                  <span class="content">${memberSvc.getOneMember(frivo.memID_Fri).mem_Name}</span>  
	                               </label>
	                           </div>
                           </c:forEach>              
                          </div>
                      </div>
                      <!--顯示已選擇加入聊天對話列表-->
                      <div style="float:left;width:40%;height:inherit;border-left: 1px" id="select_Fri">
                          <div style="padding-left: 20px;height: 10%">已選擇<i class="check circle icon"></i>
                          </div>
                          <div class="ui middle aligned selection list" style="height:89%;overflow:auto" id="select_FriList">
                                <!--這裡我要塞被選到的好友；動態顯示--> 
                          </div>
                      </div>         
                </div>    
            </div>
            
            <div class="modal-footer"> 
              <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
              <input  type="hidden" name="action" value="addNewCR"/>
              <input  type="hidden" name="myMemId" value="${memberVO.mem_Id}"/>
              <input  type="hidden" name="requestURL" value="<%=request.getServletPath()%>"/>
              <button type="submit" class="btn btn-success">確認</button>
            </div>
        
          </div>
          <!-- Modal 建立群組聊天對話content END-->
         </form>
		<!-- Form結尾 -->  
        </div>
      </div>
    <!-- Modal 建立群組聊天對話END -->
 
	<!-- Modal 加入更多人的Modal start-->
    <div class="modal fade" id="chat_AddMoreFri_Modal" role="dialog">
        <div class="modal-dialog">
        <!-- Form開頭:加入更多人聊天對話 -->   
		<form method="post">
          <!-- Modal 加入更多人聊天對話 content start-->
          <div class="modal-content" > 
            <div class="modal-header">
              <h4 class="modal-title">
              	<!-- 這邊要放哪間聊天對話要加入更多人的標題 -->
              </h4>
            </div>
            <div class="modal-body"> 
                <!--搜尋要加入聊天對話的好友-->
                <div style="margin-top:10px">
                      <div style="height:inherit">
                          <div class="ui icon input fluid">
                              <input type="text" placeholder="搜尋要加入的用戶" id="search_addMoreFri">
                              <i class="search icon"></i>
                          </div>
                          <div class="ui middle aligned selection list" style="height:89%;overflow:auto">
                           <!-- 列出所有我的朋友 -->
                           <c:forEach var="frivo" items="${myFri}">
	                           <div class="item">
	                               <input type="checkbox" class="ui checkbox" id="${frivo.memID_Fri}" name="select_fri_more" value="${frivo.memID_Fri}">
	                               <label for="${frivo.memID_Fri}" style="width:80%">
	                                  <img class="ui avatar image" src='<%=request.getContextPath()%>/front_end/readPic?action=member&id=${frivo.memID_Fri}'>
	                                  <span class="content">${memberSvc.getOneMember(frivo.memID_Fri).mem_Name}</span>  
	                               </label>
	                           </div>
                           </c:forEach>              
                          </div>
                      </div>       
                </div>    
            </div>

            <div class="modal-footer"> 
              <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
              <input  type="hidden" name="action" value="AddMoreFri"/>
              <input  type="hidden" name="addMoreFri_CRId" value=""/>
              <button type="button" class="btn btn-success" name="AddMoreMem_btn">確認</button>
            </div>
          </div>
          <!-- Modal 加入更多人聊天對話 content END-->
         </form>
		<!-- Form 加入更多人聊天對話  結尾 -->  
        </div>
    </div>
    <!-- Modal 加入更多人聊天對話 END -->

    <!-- 顯示聊天名單的Modal Start -->   
    <div class="modal fade " id="chatRoomJoin_Modal" role="dialog">
        <div class="modal-dialog">
          <!-- Modal 建立聊天視窗content start-->
          <div class="modal-content" >
          	    <div class="modal-header">
	              <h4 class="modal-title">
	              	<!-- 這邊要放哪間聊天對話要加入更多人的標題 -->
	              </h4>
	            </div>
	            <div class="modal-body">
	                <!--每個item要放...目前已參加聊天對話的名單-->              
	            </div>
	            
	            <div class="modal-footer"> 
	              <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
	            </div>
          </div>
          <!-- Modal 建立聊天視窗content END-->
        </div>
      </div> 
	<!-- 顯示聊天名單的Modal END -->
    
 
    <script>
    
	/***********************若有錯誤訊息時，就會跳出視窗***********************/
   	$('#errorModal').modal();
	
   	/***********************聊天會用到的變數********************************/
	var openChatRoomID;     //要開啟的聊天對話編號
	var openChatRoomName;	//要開啟的聊天對話名稱
	var marginRight = 350;
	var webSocketState = 0 ;//放ws常數
	var requestURLForJS = "<%=request.getContextPath()%><%=request.getServletPath()%>";
	var loginMemId_Now = "${memberVO.mem_Id}"; //現在登入者的會員ID
	
	//動態監聽視窗大小
    $(window).resize(function() {
        var wdth=$(window).width();
    });
	
    /*********************透過聊天室列表，點選開啟聊天對話的視窗******************/
	function openChatRoom(chatRoom_id,chatRoom_Name){
		//透websocket就緒狀態常數，讓斷線時，使用者不能click CRList 聊天
    	if(webSocketState != 3){
			openChatRoomID = chatRoom_id;
			openChatRoomName = chatRoom_Name;
			if($("#"+openChatRoomID+"").length === 0){
				
				//要求歷史訊息
				var jsonObj_hist ={
						"TYPE":"history",
						"TO_CHATROOMID":openChatRoomID,
						"MEM_ID":loginMemId_Now
					};
				webSocket.send(JSON.stringify(jsonObj_hist));
				
				$('body').append(<%@ include file="chat_div.file"%>);
				$("#"+openChatRoomID+"").css("right",marginRight);
				marginRight += 290;
			}else{
				//alert("已經存在了啦");
			}

    	}

    	sessionStorage.setItem(chatRoom_id,$("div.input_chatContainer_select[value='"+chatRoom_id+"']").html());
		openChatRoomName = null;
		openChatRoomID = null;
    }



	/******************************WebSocket開始**************************/
	var MyPoint = "/chat/${memberVO.mem_Id}";
	var host = window.location.host;
	var endPointURL = "ws://localhost:8081<%=request.getContextPath()%>"+MyPoint;
	var webSocket;
	
	function connect(){
		//建立一個websocket,這行會觸發伺服器的onopen,待有回應後，會回來觸發JS的onopen
		webSocket = new WebSocket(endPointURL);

		
		webSocket.onopen = function(event){
			webSocketState = event.target.readyState;
			$(".chatContainer>.chatHeader").prepend("&nbsp;<i class='fas fa-signal' style='color: #39ff14;'></i>");
		};
		
		//收到訊息的時候
		webSocket.onmessage = function(event){
			var jsonObj = JSON.parse(event.data);
			var msgType = jsonObj.TYPE; //有兩種可能：chat及history及status
			var messageArea;            //聊天內容區塊
			var msgTime;				//收到訊息:時間
			var msgContent;				//收到訊息:內容
			var senderMemId;			//收到訊息:發送者
			
			if(msgType.trim() == "chat"){
				openChatRoomID = jsonObj.TO_CHATROOMID;
				msgTime = jsonObj.TIME;
				msgContent = jsonObj.MSG;
				senderMemId = jsonObj.MEM_ID;
					
				//若找不到對應聊天室的DIV時
				if($("#" + openChatRoomID + "").length === 0){	
					//要求歷史訊息
					var jsonObj_hist_revd={
							"TYPE":"history",
							"TO_CHATROOMID":openChatRoomID,
							"MEM_ID":loginMemId_Now
						};
					webSocket.send(JSON.stringify(jsonObj_hist_revd));
	
					//找到聊天對話名稱
					openChatRoomName =jsonObj.TO_CRNAME;
					//動態新增DOM
					$('body').append(<%@ include file="chat_div.file" %>);
					//設定對話視窗產生的位置
					$("#"+openChatRoomID+"").css("right",marginRight);
					marginRight += 290;
					return;
				}
				//會把收到的訊息，append到聊天對話內容
				<%@ include file="chatContent_div.file" %>
					
			}else if(msgType.trim() == "history"){

				var history_jsonObject = JSON.parse(jsonObj.HISTORYMSG);

				for (i in history_jsonObject) {	
					openChatRoomID = history_jsonObject[i].TO_CHATROOMID;
					msgTime = history_jsonObject[i].TIME;
					msgContent = history_jsonObject[i].MSG;
					senderMemId = history_jsonObject[i].MEM_ID;
					//會把收到的訊息，append到聊天對話內容
					<%@ include file="chatContent_div.file" %>
				}
					
			}else if(msgType.trim() == "open"){
				if(jsonObj.openMemId.trim() != loginMemId_Now){
					$("#"+jsonObj.openMemId+"status .online_status").html("<i class='fas fa-circle'></i>");
					return;
				}else{
					var onlineArray = jsonObj.online;
					for(var i = 0 ;i<onlineArray.length ; i++){
						$("#"+onlineArray[i]+"status .online_status").html("<i class='fas fa-circle'></i>");
					}
				}
				
			}else if(msgType.trim() == "close"){
				$("#"+jsonObj.closeMemId+"status .online_status").html("<i class='fas fa-circle' style='color:#ADB5BD'></i>");
				return;
			}

			$(".input_chatContext").scrollTop(99999999); //讓聊天內容的捲軸都是在最下面
			console.log(openChatRoomID);
			//聊天內容
			//console.log($("div.input_chatContainer_select[value='"+openChatRoomID+"']").html());
			sessionStorage.setItem(openChatRoomID,$("div.input_chatContainer_select[value='"+openChatRoomID+"']").html());
			openChatRoomID = null;
		};

		
		webSocket.onclose = function(event){
			webSocketState = event.target.readyState; 
			//當連線關閉的時候，禁用聊天輸入盒及送出按鈕、更改斷線小圖示
			$("i.fas.fa-signal").remove();
			$(".chatContainer>.chatHeader").prepend("&nbsp;<i class='fas fa-ban' style='color:#ff1a1a;'></i>");
			$(".input_chatContainer input[name='message']").attr("disabled","true");
			$(".input_chatContainer span.input-group-addon.btn").attr("disabled","true");
		};
		
	}


	/******************************WebSocket結束**************************/
	


	
// 	 setInterval(function() {
// 		  $("div.chatContext").load(function(){alert("有做")});
// 	  }, 1000); 
	
	//引入個人的部落格資訊，內容太多冗長
	$(function(){
	    var len = 90; // 超過100個字以"..."取代
	    $("._shortText").each(function(i){
	   	 var temptext=$(this).text().trim().replace('  ', '');
	        if(temptext.length>len){
	            $(this).attr("title",temptext);
	            var text=temptext.substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});
	
	
	 
	
    </script>
    

    
</body>

</html>