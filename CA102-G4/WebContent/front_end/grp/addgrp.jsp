<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.photo_wall.model.*"%>
<%@ page import="com.photo_tag.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.grp.model.*"%>
<%@ page import="java.util.*"%>

<%	
//清快取
	response.setHeader("Pragma","no-cache"); 
	response.setHeader("Cache-Control","no-store"); 
	response.setDateHeader("Expires", 0);
	
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO"); 
	if(memberVO == null){
		memberVO = (MemberVO)session.getAttribute("memberVO");
	}	
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
			
	//若登入狀態為不是true，紀錄當前頁面並重導到登入畫面。
	if( login_state != true){
		session.setAttribute("location", request.getRequestURI());
		response.sendRedirect(request.getContextPath()+"/front_end/member/mem_login.jsp");
		return;
	}
	
	//從memberVO取會員ID
	
	GrpService grpSvc = new GrpService();
	List<GrpVO> list = grpSvc.getAll();
	pageContext.setAttribute("list", list);
	
	
	
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

<jsp:useBean id="memberSvc" scope="page" class="com.mem.model.MemberService" />
<jsp:useBean id="tripSvc" scope="page" class="com.trip.model.TripService"></jsp:useBean>

<%@ page import="com.fri.model.*" %>
<%@ page import="com.chat.model.*" %>
<jsp:useBean id="chatRoomSvc" scope="page" class="com.chat.model.ChatRoomService"></jsp:useBean>
<jsp:useBean id="chatRoomJoinSvc" scope="page" class="com.chat.model.ChatRoom_JoinService"></jsp:useBean>

<%

	//*****************聊天用：取得登錄者所參與的群組聊天*************/
	List<ChatRoom_JoinVO> myCRList =chatRoomJoinSvc.getMyChatRoom(memberVO.getMem_Id());
	Set<ChatRoom_JoinVO> myCRGroup = new HashSet<>(); //裝著我參與的聊天對話為群組聊天時
	
	for(ChatRoom_JoinVO myRoom : myCRList){
		//查詢我參與的那間聊天對話，初始人數是否大於2?? 因為這樣一定就是群組聊天
		int initJoinCount = chatRoomSvc.getOne_ByChatRoomID(myRoom.getChatRoom_ID()).getChatRoom_InitCNT();
		if(initJoinCount > 2){
			myCRGroup.add(myRoom);
		}
	}
	pageContext.setAttribute("myCRList", myCRGroup);
	
	/***************聊天用：取出會員的好友******************/
	FriendService friSvc = new FriendService();
	List<Friend> myFri = friSvc.findMyFri(memberVO.getMem_Id(),2); //互相為好友的狀態
	pageContext.setAttribute("myFri",myFri);
	
	/**************避免聊天-新增群組重新整理後重複提交********/
	session.setAttribute("addCR_token",new Date().getTime());


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
    <meta name="keywords" content="TravelMaker,Travelmaker,自助旅行,照片牆" />
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
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- //JQUERY -->
    
    <!-- Bootstrap -->
	<link href="<%=request.getContextPath()%>/front_end/css/all/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<script src="<%=request.getContextPath()%>/front_end/js/all/index_bootstrap.js"></script>
    
    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->
   

    <!-- 套首頁herder和footer css -->
    <link href="<%=request.getContextPath()%>/front_end/css/all/index_style_header_footer.css" rel="stylesheet" type="text/css" media="all" />
    <link href="<%=request.getContextPath()%>/front_end/css/blog/blog.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //套首頁herder和footer css -->

    <!-- grp 自定義的css -->
    <link href="<%=request.getContextPath()%>/front_end/css/grp/AD_semantic.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/grp/group.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/grp/group_fix.css" rel="stylesheet" type="text/css">
    <!-- //grp 自定義的css -->

    <!-- font-awesome icons -->
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- //font-awesome icons -->

    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->
    
    <!--  datepicker js  -->
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <!--//datepicker js  -->
    
    

	<style>
	.footer{
		background-color:#1b1c1d; 
	}
	.btn-primary-grp{
	background-color: rgba(0,50,50,0.2);
    border-color: rgba(0,67,50,0.2);
	}	
	.btn-primary-grp:hover{
		color:unset;
		background:none !important;
	}
	.btn-primary-grp:focus{
		color:unset;
	}
	</style>

	<!-- 聊天相關CSS及JS -->
    <link href="<%=request.getContextPath()%>/front_end/css/chat/chat_style.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/front_end/js/chat/vjUI_fileUpload.js"></script>
    <script src="<%=request.getContextPath()%>/front_end/js/chat/chat.js"></script>
    <%@ include file="/front_end/personal_area/chatModal_JS.file" %>
    <!-- //聊天相關CSS及JS -->
	
	
</head>

<body>
   
   	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs_Ailee}">
		<div class="modal fade" id="errorModal_Ailee">
		    <div class="modal-dialog modal-sm" role="dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <i class="fas fa-exclamation-triangle"></i>
		          <span class="modal-title"><h4>請修正以下錯誤:</h4></span>
		        </div>
		        <div class="modal-body">
					<c:forEach var="message" items="${errorMsgs_Ailee}">
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
                    <ul>
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
                        <li><a class="top_banner" href="<%=request.getContextPath()%>/front_end/store/store_cart.jsp"><i class="fa fa-shopping-cart shopping-cart" aria-hidden="true"></i><span class="badge">${total_items}</span></a></li>
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

<!-- 主圖區 -->
    <div>
        <div class="carousel-inner">
            <div class="carousel-images">
                <img src="<%=request.getContextPath()%>/front_end/images/all/aegean_Sea_2.png" style="width:100% ;height:auto;" alt="">
                <div class="">
                    <div class="carousel-caption">
                        <h1>揪個合適的夥伴一起旅行</h1>
                        <p>你揪過了嗎？</p>						
                     <a href="<%=request.getContextPath()%>/front_end/grp/addgrp.jsp">
                     <button class="btn btn-lg btn-primary-grp" type="button" style="border:0;color:white;">
                      	 開始我的揪團</button>
                      </a>						
                    </div>
                </div>
            </div>
        </div>
    </div>  
   
    <div class="container" style="height: 1500px; margin-top:50px">
    	<div class="row" style="width:530px;height:20px;margin:0 auto;">
			<div class="col-offset-6 col-md-10 col-md-offset-6" style="width:530px;height:20px;margin:0 auto;">
				<div class="panel panel-login" style="border: solid 0.5px;border-color:#C8C8C8;">
					<div class="panel-heading">
						<div class="row" >
							<h2 style="text-align:center;">開始計畫新的揪團</h2>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form action="<%=request.getContextPath()%>/grp.do" method="post" role="form" style="">
									<c:if test="${not empty tripSvc.getByMem_id(memberVO.mem_Id)}">
									<select name="trip_no" style="boder:0px">
									   <option>選擇行程標題</option>
									   <c:forEach var="trip" items="${tripSvc.getByMem_id(memberVO.mem_Id)}">
							           <option value="${trip.trip_no}">${trip.trip_name}</option>
							           </c:forEach>
									</select>
									<br>
									<br>
									</c:if>					
									<div class="form-group">
										<p><i class="fas fa-edit" style="color:gray;"></i>&nbsp;幫揪團取個名字吧</p>
										<input type="text" name="grp_Title" class="form-control" placeholder="團名" value="${param.grp_Title}">
										<font style="color:red">&nbsp;${errorMsgs.grp_Title}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-map-marker-alt" style="color:red;"></i>&nbsp;想去哪裡呢</p>
										<input type="text" name="trip_Locale" class="form-control" placeholder="地點" value="${param.trip_Locale}">
										<font style="color:red">&nbsp;${errorMsgs.trip_Locale}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-dollar-sign" style="color:red;"></i>&nbsp;大概預算</p>
										<input type="text" name="grp_Price" class="form-control" placeholder="預算" value="${param.grp_Price}">
										<font style="color:red">&nbsp;${errorMsgs.grp_Price}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-users" style="color:#483D8B;"></i>&nbsp;報名人數</p>
										<input type="number" name="grp_Cnt" value="${param.grp_Cnt}" min="1" max="99" size="5" tabindex="2" class="form-control" placeholder="預計報名人數">
										<font style="color:red">&nbsp;${errorMsgs.grp_Cnt}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-users" style="color:#483D8B;"></i>&nbsp;出團人數</p>
										<input type="number" name="grp_Acpt" value="${param.grp_Acpt}" min="1" max="99" size="5" tabindex="2"  class="form-control" placeholder="成團出發人數">										
										<font style="color:red">&nbsp;${errorMsgs.grp_Acpt}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-calendar-alt" style="color:#778899;"></i>&nbsp;揪團結束的日期</p>
										<input type="text" name="grp_End" value="${param.grp_End}" id="datepicker_grp_end" class="form-control" placeholder="請選擇揪團結束日期">
										<font style="color:red">&nbsp;${errorMsgs.grp_End}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-calendar-alt" style="color:#778899;"></i>&nbsp;啟程日期</p>
										<input type="text" name="trip_Strat" value="${param.trip_Strat}" id="datepicker_trip_start" class="form-control" placeholder="請選擇行程起程日期">
										<font style="color:red">&nbsp;${errorMsgs.trip_Strat}</font>
									</div>
									<div class="form-group">
										<p><i class="fas fa-calendar-alt" style="color:#778899;"></i>&nbsp;回程日期</p>
										<input type="text" name="trip_End" value="${param.trip_End}" id="datepicker_trip_end" class="form-control" placeholder="請選擇行程結束日期">
										<font style="color:red">&nbsp;${errorMsgs.trip_End}</font>
									</div>
									<div class="form-group">
										<p><i style="color:#778899;"></i>&nbsp;行程內容</p>										
										<textarea class="form-control" rows="4" cols="100" name="trip_Details" value="${param.trip_Details}" placeholder="請輸入個吸引大家來參加的內容吧" ></textarea>
										<font style="color:red">&nbsp;${errorMsgs.trip_Details}</font>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="hidden" name="mem_Id" value="${memberVO.mem_Id}"> 
                								<input type="hidden" name="action" value="insert" class="btn btn-primary">
												<input type="submit"  class="form-control btn btn" style="border-color:#C8C8C8;" value="創建揪團">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!--  //search  -->


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
                            <li><a href="https://www.facebook.com/InstaBuy.tw/"><i class="fab fa-facebook"></i></a></li>
                            <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
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
 
<script>
  $(function() {
   $( "#datepicker_grp_end" ).datepicker({
      showAnim: "slideDown",
      dateFormat : "yy-mm-dd"
    });
  });
 </script>
<script>
  $(function() {
   $( "#datepicker_trip_start" ).datepicker({
      showAnim: "slideDown",
      dateFormat : "yy-mm-dd"
    });
  });
 </script>
 <script>
  $(function() {
   $( "#datepicker_trip_end" ).datepicker({
      showAnim: "slideDown",
      dateFormat : "yy-mm-dd"
    });
  });
 </script>
</body>

</html>

