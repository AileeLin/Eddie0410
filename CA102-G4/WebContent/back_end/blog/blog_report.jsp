<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import="java.util.*"%>
<%@ page import="com.blog_report.model.*" %>
<%@ page import="com.blog.model.*" %>
<%@ page import="com.blog_message_report.model.*" %>
<%@ page import="com.admin.model.*"%>
<%
	response.setHeader("Pragma","no-cache"); 
	response.setHeader("Cache-Control","no-store"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("UTF-8");
	
	List<blog_reportVO> blogReportList = (List)request.getAttribute("blogReportList");
	request.setAttribute("blogReportList",blogReportList);

	List<blog_message_reportVO> blogMessageReportList = (List)request.getAttribute("blogMessageReportList");
	request.setAttribute("blogMessageReportList",blogMessageReportList);
	
	AdminVO adminVO = (AdminVO)session.getAttribute("adminVO");
	if(adminVO == null){
		adminVO = (AdminVO)session.getAttribute("adminVO");
	}
	
	boolean login_state = false;
	Object login_state_temp = session.getAttribute("login_state");
	if(login_state_temp!=null){
		login_state=(boolean)login_state_temp;
	}
	
	if(login_state!=true){
		session.setAttribute("location","/CA102G4/back_end/back_index.jsp");
		response.sendRedirect("/CA102G4/back_end/back_login.jsp");
	}
%>
<jsp:useBean id="blogSvc" scope="page" class="com.blog.model.blogService"/>
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemberService"/>
<jsp:useBean id="blogMessageSvc" scope="page" class="com.blog_message.model.blogMessageService"/>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Travel Maker 後台   - 旅遊記檢舉管理</title>
        <meta charset="UTF-8">
                
        <!-- Bootstrap CSS v3.3.4 -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/css/all/bootstrap.css">

        <!-- 自定義的CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/css/all/back_all.css">

        <!-- Font Awesome JS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">


        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <!-- Bootstrap JS v3.3.4-->
        <script src="<%=request.getContextPath()%>/back_end/js/all/bootstrap.js"></script>
        
        <!-- 自己定義的JS檔案-->
        <script src="<%=request.getContextPath()%>/back_end/js/all/back_all.js"></script>
        
        <!-- font字體 -->
        <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <!-- //font字體 -->
		       
        <!-- blog使用到的jQuery Dialog -->
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/front_end/jquery-ui-1.12.1/jquery-ui.css">
    	<script src="<%=request.getContextPath()%>/front_end/jquery-ui-1.12.1/jquery-ui.js"></script>
    	<!-- //blog使用到的jQuery Dialog -->        

        <!-- semantic-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/js/blog/UI-Dropdown-master/dropdown.min.css">
    	<script src="<%=request.getContextPath()%>/back_end/js/blog/UI-Dropdown-master/dropdown.min.js"></script>
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/js/blog/UI-Menu-master/menu.min.css">
        <script src="<%=request.getContextPath()%>/back_end/js/blog/UI-Transition-master/transition.min.js"></script>
    	    	<link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/js/blog/UI-Transition-master/transition.min.css">
        <!-- //semantic-->
        
		<!-- blogTag頁面自己定義的CSS-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/css/blog/blog_tag.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/back_end/css/blog/blog_report.css">
        <!-- //blogTag頁面自己定義的CSS-->
        
        <!-- blogTag自己定義的JS檔案-->
        <script src="<%=request.getContextPath()%>/back_end/js/blog/blog_report.js"></script>
        <!-- //blogTag自己定義的JS檔案-->
                
    </head>
    <body>
        <div class="wrapper">
                <!-- Sidebar  -->
            <nav id="sidebar" class="navbar-fixed-left">
                <div class="sidebar-header">
                    <h3>Travel Maker</h3>
                    <strong>TM</strong>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="<%=request.getContextPath()%>/back_end/back_index.jsp">
                            <i class="fas fa-home"></i>
                            回首頁
                        </a>
                    </li>
                    
                    <li>
                        <li class="dropdown">
                            <a href="#auth_Submenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                                <i class="fas fa-users"></i>
                                權限管理
                            </a>

                            <ul class="dropdown-menu" id="auth_Submenu">
                                <li>
                                    <a href="#">管理員</a>
                                </li>
                                <li>
                                    <a href="#">會員</a>
                                </li>
                            </ul>

                        </li>
                        
                        <li>
                            <a href="#">
                                <i class="fas fa-newspaper"></i>
                                最新消息管理
                            </a>
                        </li>
                        
                        <li>
                            <a href="#">
                                <i class="fas fa-image"></i>
                                景點管理
                            </a>
                        </li>
                       
                        <li class="dropdown">
                            <a href="#category_Submenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                                <i class="fas fa-tag"></i>
                                標籤管理
                            </a>
                            <ul class="dropdown-menu" id="category_Submenu">
                                <li>
                                    <a href="<%=request.getContextPath()%>/back_end/blog/blog_tag.jsp">旅遊記</a>
                                </li>
                                <li>
                                    <a href="#">問答區</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#report_Submenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" aria-haspopup="true" >
                                <i class="fas fa-comment-dots"></i>
                                檢舉管理
                            </a>
                            <ul class="dropdown-menu" id="report_Submenu">
                                <li>
                                    <a href="#">會員檢舉</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/blog.do?action=blogReportManage">旅遊記檢舉</a>
                                </li>
                                <li>
                                    <a href="#">問答區檢舉</a>
                                </li>
                                <li>
                                    <a href="#">照片牆檢舉</a>
                                </li>
                                <li>
                                    <a href="#">揪團檢舉</a>
                                </li>
                                <li>
                                    <a href="#">商品檢舉</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="#">
                                <i class="fas fa-shopping-cart"></i>
                                交易款項管理
                            </a>
                        </li>
                        
                        <li>
                            <a href="<%=request.getContextPath()%>/back_end/ad/back_ad.jsp">
                                <i class="fas fa-audio-description"></i>
                                專欄廣告管理
                            </a>
                        </li>
                        
                        <li class="dropdown">
                            <a href="#aboutUS_Submenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                                <i class="fas fa-briefcase"></i>
                                關於我們管理
                                </a>
                            <ul class="dropdown-menu" id="aboutUS_Submenu">
                                <li>
                                    <a href="#">關於我們</a>
                                </li>
                                <li>
                                    <a href="#">FAQ</a>
                                </li>
                            </ul>
                        </li>

                </ul>

            </nav>

            <!-- Page Content  -->
            <div id="content">

                <nav class="navbar"> <!--navbar-expand-lg navbar-light bg-light-->
                    <div class="container-fluid">
                        <!--側邊欄按鈕-->
                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="fas fa-align-left"></i>
                        </button>
                        <span style="float: right">
                        <button type="button" class="btn btn-info" onclick="location.href='<%=request.getContextPath()%>/back_end/back_login.jsp'">
                            登出
                            <i class="fas fa-sign-out-alt"></i>
                        </button>
                        </span>
                    </div>
                </nav>
                
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                        	旅遊記檢舉管理
                        </h1>
                        
                    </div>
                </div>
       
                <div class="row">
                    <div class="col-lg-12">
                    		<div id="adTabContent" class="tab-content  ui piled segment">
                    			<div id="offContent" class="tab-pane fade active in">
			                   		<br>
                    		<ul id="adTab" class="nav nav-tabs">
                    			<li class='${param.action eq "blogReportManage" ? "active" : ""}'>
                        			<a href="<%=request.getContextPath()%>/blog.do?action=blogReportManage">
                        				<i class='fas fa-arrow-down'></i>旅遊記檢舉
                        			</a>
                   			 	</li>
                   			 	<li class='${param.action eq "blogMessageReportManage" ? "active" : ""}'>
                        			<a href="<%=request.getContextPath()%>/blog.do?action=blogMessageReportManage">
                        				<i class='fas fa-bell'></i>留言檢舉
                        			</a>
                   			 	</li>
                    		</ul>
				</div>
			</div>
				<c:if test="${not empty blogReportList.size()}">
                <div class="row">
                    <div class="col-lg-12">
                    		
                    		<div id="adTabContent" class="tab-content  ui piled segment">
                    			<div id="offContent" class="tab-pane fade active in">
			                   		<br>
			                        <table class="table">
			                        	<thead>
			                        		<th>旅遊記編號</th>
			                        		<th>檢舉者會員編號</th>
			                        		<th>檢舉者會員名字</th>
			                        		<th>檢舉原因</th>
			                        		<th>檢舉時間</th>
			                        		<th>狀態</th>
			                        		<th>審核</th>
			                        	</thead>
			                        	
			                        	<%@ include file="page3.file"%>
			                        	<c:forEach var="blogReportVO" items="${blogReportList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                    	
                                    
                                    	<tbody>
                                            <tr>
												<td><a class="blogHref" href="<%=request.getContextPath()%>/blog.do?action=article&blogID=${blogReportVO.blog_id}" target="_blank"><p class="blog_id">${blogReportVO.blog_id}</p></a></td>
                                                <td><p class="mem_id">${blogReportVO.mem_id}</p></td>
                                                <c:forEach var="MemberVO" items="${memSvc.all}">
                                                	<c:if test="${MemberVO.mem_Id==blogReportVO.mem_id}">
                                             	  	 <td><p class="mem_name">${MemberVO.mem_Name}</p></td>
                                             	   	</c:if>
                                                </c:forEach>
                                                <td><p class="br_reason">${blogReportVO.br_reason}</p></td>
                                                <input type="hidden" name="hidden_blogOwner" value="${blogReportVO.mem_id}">
                                                <input type="hidden" name="hidden_blog_reason" value="${blogReportVO.br_reason}">
                                                <td><p class="br_time">
                                                		<fmt:formatDate value="${blogReportVO.br_time}" type="both"/>
                                        		</p></td>
                                                <td><p class="br_status">${blogReportVO.br_status eq "0"?"未處理":"已處理"}</p></td>	
                                                <td>
                                                    <FORM action="<%=request.getContextPath()%>/blog.do" method="post">
                                                        <input type="hidden" name="br_status" value="${blogReportVO.br_status}">
                                                        <input type="hidden" name="blog_id" value="${blogReportVO.blog_id}">
                                                        <input type="hidden" name="mem_id" value="${blogReportVO.mem_id}">
                                                        <input type="hidden" name="action" value="updateTagName">
                                                        <input type="hidden" name="whichPage" value="${param.whichPage}">                                                        
                                                        <button type='button' class='btn btn-primary updateReportStatusBtn' value='updateReportStatus'>審核</button>
                                                    </FORM>
                                                </td>
                                            </tr>	

                                        </tbody>
                                    
                                    
										</c:forEach>
                                	
			                        </table> 
                    			</div>
							</div>

						</div>
					</div>
					
						<!-- 上一頁button -->
						<%@ include file="page4.file"%>
						<!-- //下一頁button -->
						<!-- 頁數資訊 -->
						<div class="page_info">
							顯示第<%= whichPage %>頁，共<%= pageNumber %>頁
						</div>
						<!-- //頁數資訊 -->
 				</c:if>
 				
 				
 				<c:if test="${not empty blogMessageReportList.size()}">
                <div class="row">
                    <div class="col-lg-12">
                    		
                    		<div id="adTabContent" class="tab-content  ui piled segment">
                    			<div id="offContent" class="tab-pane fade active in">
			                   		<br>
			                        <table class="table">
			                        	<thead>
			                        		<th>留言編號</th>
			                        		<th>留言內容</th>
			                        		<th>檢舉者會員編號</th>
			                        		<th>檢舉者會員名字</th>
			                        		<th>檢舉原因</th>
			                        		<th>檢舉時間</th>
			                        		<th>狀態</th>
			                        		<th>審核</th>
			                        	</thead>
			                        	
			                        	<%@ include file="page5.file"%>
			                        	<c:forEach var="blogMessageReportVO" items="${blogMessageReportList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                    	
                                    	<tbody>
                                            <tr>
												<td><p class="message_id">${blogMessageReportVO.message_id}</p></td>
												<c:forEach var="blogMessageVO" items="${blogMessageSvc.all}">
													<c:if test="${blogMessageVO.message_id==blogMessageReportVO.message_id}">
                                                		<td><p class="blog_message">${blogMessageVO.blog_message}</p></td>
                                                		<input type="hidden" name="hidden_mem_id" value="${blogMessageVO.mem_id}">
                                                		<input type="hidden" name="hidden_message" value="${blogMessageVO.blog_message}">
                                                	</c:if>
                                                </c:forEach>
                                                <td><p class="mem_id">${blogMessageReportVO.mem_id}</p></td>
                                                <c:forEach var="MemberVO" items="${memSvc.all}">
                                                	<c:if test="${MemberVO.mem_Id==blogMessageReportVO.mem_id}">
                                                <td><p class="mem_name">${MemberVO.mem_Name}</p></td>
                                                	</c:if>
                                                </c:forEach>
                                                <td><p class="bmr_reason">${blogMessageReportVO.bmr_reason}</p></td>
                                                <input type="hidden" name="hidden_reason" value="${blogMessageReportVO.bmr_reason}">
                                                <td><p class="bmr_time">
                                                		<fmt:formatDate value="${blogMessageReportVO.bmr_time}" type="both"/>
                                        		</p></td>
                                                <td><p class="bmr_status">${blogMessageReportVO.bmr_status eq "0"?"未處理":"已處理"}</p></td>	
                                                <td>
                                                    <FORM action="<%=request.getContextPath()%>/blog.do" method="post">
                                                        <input type="hidden" name="br_status" value="${blogMessageReportVO.bmr_status}">
                                                        <input type="hidden" name="message_id" value="${blogMessageReportVO.message_id}">
                                                        <input type="hidden" name="mem_id" value="${blogMessageReportVO.mem_id}">
                                                        <input type="hidden" name="action" value="updateReportMessageStatus">
                                                        <input type="hidden" name="whichPage" value="${param.whichPage}">                                                        
                                                        <button type='button' class='btn btn-primary updateReportMessageStatusBtn' value='updateReportMessageStatus'>審核</button>
                                                    </FORM>
                                                </td>
                                            </tr>	

                                        </tbody>
                                    	
                                    
                                    
										</c:forEach>
                                	
			                        </table> 
                    			</div>
							</div>

						</div>
					</div>
					
						<!-- 上一頁button -->
						<%@ include file="page4.file"%>
						<!-- //下一頁button -->
						<!-- 頁數資訊 -->
						<div class="page_info">
							顯示第<%= whichPage %>頁，共<%= pageNumber %>頁
						</div>
						<!-- //頁數資訊 -->
 				</c:if>
 				
 				
            </div>
        </div>

        <div id="blogReportManageDialog">
        	<FORM action="<%=request.getContextPath()%>/blog.do" method="post" class="blogReportManageDialogForm">
        		<input type="hidden" id="blogReportDialogMemID" name="mem_id" value="">		<!-- 抓287行的值用JS傳值過來 -->
	            <input type="hidden" id="blogReportDialogBlogID" name="blog_id" value="">	<!-- 抓286行的值用JS傳值過來 -->
	            <input type="hidden" name="action" value="updateBlogReportStatus">
	            <input type="hidden" name="whichPage" value="${param.whichPage}">
	            <input type="hidden" id="blogReportDialogBrStatus" name="br_status" value=""> <!-- 抓424行的值用JS傳DIV值過來 -->
           		<input type="hidden" id="blogOwner" name="blogOwner" value="">
           		<div class="blogReportManageContent">
           		<div class="blogReportManageTitle">被檢舉旅遊記編號 :<span class="blogReportDialogContentBlogID"></span></div>
           		<div class="blogReportManageTitle">檢舉原因 :<span class="blogReportDialogContentBrReason"></span></div>
            	    <div class="ui selection dropdown">
	                    <i class="dropdown icon"></i>
	                    <div class="default text">請審核該檢舉是否成功</div>
	                    <div class="menu">
	                        <div class="item" name="br_status" value="2">檢舉失敗</div>
	                        <div class="item" name="br_status" value="1">檢舉成功</div>
	                    </div>
                	</div>
                <div class="blogReportManageTitle">狀態 :<span class="blogReportDialogContentBrStatus"></span></div>
            	</div>
            </form>
        </div>

        <div id="blogMessageReportManageDialog">
        	<FORM action="<%=request.getContextPath()%>/blog.do" method="post" class="blogMessageReportManageDialogForm">
        		<input type="hidden" id="blogMessageReportDialogMemID" name="mem_id" value="">
	            <input type="hidden" id="blogMessageReportDialogMessage_id" name="message_id" value="">
	            <input type="hidden" name="action" value="updateBlogMessageReportStatus">
	            <input type="hidden" name="whichPage" value="${param.whichPage}">
	            <input type="hidden" id="blogMessageReportDialogBmrStatus" name="bmr_status" value="">
           		<input type="hidden" id="messageOwner" name="messageOwner" value="">
           		<div class="blogReportManageContent">
           		<div class="blogReportManageTitle">被檢舉留言編號 :<span class="blogMessageReportDialogContentMessageID"></span></div>
           		<div class="blogReportManageTitle">留言內容 :<span class="blogMessageReportDialogContentBlogMessage"></span></div>
           		<div class="blogReportManageTitle">檢舉原因 :<span class="blogMessageReportDialogContentBmrReason"></span></div>
            	    <div class="ui selection dropdown">
	                    <i class="dropdown icon"></i>
	                    <div class="default text">請審核該檢舉是否成功</div>
	                    <div class="menu">
	                        <div class="item" name="bmr_status" value="2">檢舉失敗</div>
	                        <div class="item" name="bmr_status" value="1">檢舉成功</div>
	                    </div>
                	</div>
                <div class="blogReportManageTitle">狀態:<span class="blogMessageReportDialogContentBmrStatus"></span></div>
            	</div>
            </form>
        </div>

    </body>
</html>