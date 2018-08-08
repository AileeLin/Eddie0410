<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*" %>
<%@ page import="com.photo.model.*" %>
<%@ page import="com.blog.model.*" %>
<%@ page import="java.util.*" %>
<%	
	//因為沒有登入也可以查看他人的個人頁面，但無法顯示加入好友的按鈕
	Object memId = session.getAttribute(session.getId());
	
	//取得送過來查詢某位會員的ID的參數，以便取得他的相關個人資料
	String uId = request.getParameter("uId");

	if(uId == null){
		//如果沒取到某會員的ID，先讓他導向到首頁
		response.sendRedirect(request.getContextPath()+"/front_end/index.jsp");
		return;
	}
	
	//假設登入者跟傳入的uId參數一致時要導向...他自己的個人管理頁面
	if(uId.equals((String)memId)){
		response.sendRedirect(request.getContextPath()+"/front_end/personal_area/personal_area_home.jsp");
		return;
	}
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
	
	
	//取出該uI相關資料
	MemberService memSvc = new MemberService();
	MemberVO otherUser_memVO = memSvc.getOneMember(uId); 
	pageContext.setAttribute("otherUser_memVO",otherUser_memVO);
	
	//取出該uI照片牆的照片 -----可能還要再改!! 因為是JDBC版本
	Photo_wallJDBCDAO photoSvc = new Photo_wallJDBCDAO();
	List<Photo_wallVO> photoList=photoSvc.getAll_ByMemID(uId);
	pageContext.setAttribute("photoList", photoList);
	
	//取出該uId部落格文章
	blogService blogSvc = new blogService();
	List<blogVO> blogList=blogSvc.findByMemId(uId);//動態從session取得會員ID
	pageContext.setAttribute("blogList", blogList);
%>
<!DOCTYPE html>
<html>
    <head>
    <!-- 網頁title -->
    <title>Travel Maker他人個人頁面</title>
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
    <link href="<%=request.getContextPath()%>/front_end/css/personal/semantic.min.css" rel="stylesheet" type="text/css">
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
    <link href="<%=request.getContextPath()%>/front_end/css/ad/ad_page.css" rel="stylesheet" type="text/css"><!--共用頁籤及頁尾style-->
    <link href="<%=request.getContextPath()%>/front_end/css/personal/personal_area_home.css" rel="stylesheet" type="text/css"><!--共用個人首頁上方會員資訊塊style-->
    <link href="<%=request.getContextPath()%>/front_end/css/personal/persion_area_public.css" rel="stylesheet" type="text/css">
    <!-- //AD_Page相關CSS及JS -->
    
    <!-- 聊天相關CSS及JS -->
<%--     <link href="<%=request.getContextPath()%>/front_end/css/chat/chat_style.css" rel="stylesheet" type="text/css"> --%>
<%--     <script src="<%=request.getContextPath()%>/front_end/js/chat/chat.js"></script> --%>
    <!-- //聊天相關CSS及JS -->
    
</head>

    <body>
    
    	<script>
    	
    	$(document).ready(function(){
    		/*若沒登錄，根本不用去確認與該會員是否為好友?*/
    		if(<%=memId != null%>){
	    		$.ajax({
	    			url:"/CA102G4/fri.do",
	    			type:"POST",
	    			data:{action:"checkFri",meId:"<%=(String)memId%>",uId:"<%=uId%>"},
	    			success:function(data){
	    				console.log(data);//得到取得的好友關係狀態碼時，給予對應的btn
	    				
	    				if(data == 0){
	    					$("#mem_ind_name_friBtn").html(
		    						"<a class='ui inverted green button mini' href='<%=request.getContextPath()%>/fri.do?action=insertFri&meId=<%=(String)memId%>&friId=<%=uId%>&local=public_area'>"+
		    							"<i class='icon plus'></i>加入好友"+
		    						"</a>");	
	    				}else if(data == 1){
	    					//我有送好友邀請給他了，但他尚未確認，送出時，按鈕disabled掉，不給退已送的好友邀請
	    					$("#mem_ind_name_friBtn").html(
		    						"<a href='#' class='ui inverted primary button mini' disabled>"+
		    						"<i class='fas fa-user-plus'></i>&nbsp好友邀請確認中</a>");
	    				}else if (data == 2){
	    					//他跟我是好友，按下後，會倒到自己的好友管理頁面
	    					$("#mem_ind_name_friBtn").html(
	    						"<a href='<%=request.getContextPath()%>/front_end/personal_area/personal_area_friend.jsp' class='ui inverted pink button mini'>"+
	    						"<i class='fas fa-check'></i>&nbsp好友</a>");
	    				}else if (data == 3){
	    					//他跟我是好友，但是她被我封鎖了
	    					$("#mem_ind_name_friBtn").html(
		    						"<a class='ui inverted orange button mini' href='<%=request.getContextPath()%>/fri.do?action=unBlockFri&meId=<%=(String)memId%>&friId=<%=uId%>&local=public_area' onclick='return confirm(\"確定要解除封鎖嗎?\");'>"+
		    						"<i class='fas fa-user-slash'></i>&nbsp解除封鎖</a>");
	    				}else if (data == 404){
	    					window.location.href="<%=request.getContextPath()%>/front_end/index.jsp";
	    				}else if(data.trim() == "他加我好友"){
	    					//對方有送給我好友邀請，要顯示確認或刪除邀請
	    					$("#mem_ind_name_friBtn").html(
		    						"&nbsp;&nbsp;<div class='ui buttons mini'>"+
			    						"<a class='ui green button mini' href='<%=request.getContextPath()%>/fri.do?action=becomeFri&meId=<%=(String)memId%>&friId=<%=uId%>&local=public_area' onclick=''>"+
			    						"<i class='fas fa-check-circle'></i>&nbsp確認</a>"+
		    						  "<div class='or'></div>"+
			    						"<a class='ui button mini' href='<%=request.getContextPath()%>/fri.do?action=reject&meId=<%=(String)memId%>&friId=<%=uId%>&local=public_area' onclick=''>"+
			    						"<i class='fas fa-trash-alt'></i>&nbsp刪除邀請</a>"+
		    						"</div>");
	    				}
	    			},
	    			error:function(){
	    				alert("失敗,未呼叫到fri.do");
	    			}
	    			
	    		});/**Ajax end**/
    		}else{
    			
    		}

    	});/**document read end**/
    	
    	</script>
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
                                    <li><a href="blog.jsp">旅遊記</a></li>
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
                    <img src="<%=request.getContextPath()%>/front_end/images/all/person_public_bar.jpg">
                </div>
                <!--會員訊息--> 
                <div class="mem_ind_info"> 
                    <div class="mem_ind_img">
                    	<c:choose>
                    		<c:when test="${otherUser_memVO.mem_Photo == null}">
                    			<img src='<%=request.getContextPath()%>/front_end/images/all/mem_nopic.jpg'>
                    		</c:when>
                    		<c:otherwise>
                    			<img src='<%=request.getContextPath()%>/front_end/readPic?action=member&id=${otherUser_memVO.mem_Id}'>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="mem_ind_name">
                        <p>${otherUser_memVO.mem_Name}
                        	${otherUser_memVO.mem_Sex == 1 ? "<i class='fas fa-male' style='color:#4E9EE2'></i>" : "<i class='fas fa-female' style='color:#EC7555'></i>"}
							<span id='mem_ind_name_friBtn'>
								<!-- 這邊要放關係確認的結果??? -->
							</span>
                        	<span id='mem_report' style='float:right'>
                        		<button type='button' class='ui inverted red button mini'><i class="fas fa-exclamation-triangle"></i>&nbsp;檢舉</button>
                        	</span>	 	
                        </p>
                        <p class="text-truncate" style="font-size:0.9em;padding-top:10px;max-height:110px">
                           ${otherUser_memVO.mem_Profile}
                        </p>
                    </div>
                </div> 
            </div>
            <!--//會員個人頁面標頭-->
            <!--會員個人頁面-首頁內容-->
            <div class="mem_ind_content">
              <!-- 頁籤項目 -->
              <ul class="nav nav-tabs" role="tablist" style="">
                <li class="nav-item active">
                  <a href="<%=request.getContextPath()%>/front_end/personal/personal_area_public.html">
                      <i class="fas fa-home"></i>首頁
                  </a>
                </li>
                <li class="nav-item">
                  <a href="">
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
              </ul>
              <!-- //頁籤項目 -->
              <!-- 頁籤項目-首頁內容 -->
              <div class="tab-content">
                <!--首頁左半邊-個人首頁-->
                <div id="home_left">
                    <div class="s_div">哈哈哈</div>
                    <div class="s_div">哈哈哈</div>
                    <div class="s_div">哈哈哈</div>
                    <div class="s_div">哈哈哈</div>
                </div>
                <!--//首頁左半邊-個人首頁-->
                <!--首頁右半邊-個人首頁-->
                <div id="home_right" class="container tab-pane active">
                   <!--首頁我的照片列表-->
                   <div class="u_ind_item">
                      <div class="u_title">
                          <strong>${otherUser_memVO.mem_Name}的照片</strong>
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
		                     	<img src="<%=request.getContextPath()%>/front_end/images/all/nothing.png" class="nothing">&nbsp; 尚未發表
		                     </c:otherwise>
		                  </c:choose>
                      </div>
					  <!--  <br>  -->
                   </div>
                   <hr>
                   <!--首頁我的旅遊記列表-->
                   <div class="u_ind_item">
                      <div class="u_title">
                          <strong>${otherUser_memVO.mem_Name}的旅遊記</strong>
                          <a href="#"><i class="angle double right icon"></i>更多</a>
                          <div>
                              <span>${blogList.size()}</span>
                              <span>篇遊記</span>
                          </div>
                      </div>
                      <div class="mem_ind_item_blog">
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
			                        <div class="content ">
			                          <div class="text-truncate header">${blogvo.blog_title}</div>
			                          <div class="meta">
			                            <span class="stay">
			                            	<i class="fas fa-calendar-alt"></i>
			                            	${blogvo.travel_date}
			                            </span>
			                          </div>
			                          <div class="description text-truncate">
			                            <span>
			                                <i class="fas fa-map-marker-alt"></i>
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
		                       		<img src="<%=request.getContextPath()%>/front_end/images/all/nothing.png" class="nothing">&nbsp;尚未發表
		                       </c:otherwise>
		                     </c:choose>
                         </div>  
                      </div>
                   </div>
                   <hr>
                   <!--首頁我的行程列表-->
                   <div class="u_ind_item">
                      <div class="u_title">
                          <strong>${otherUser_memVO.mem_Name}的行程</strong>
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
                <!--//首頁右半邊-個人首頁-->
              </div>
              <!--頁籤項目-首頁內容-->
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


    </body>

</html>
