<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.blog.model.*"%>

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
    <link href="css/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/index_bootstrap.js"></script>
    <!-- //bootstrap-css -->

    <!-- semantic css -->
    <link href="./css/AD/AD_semantic.min.css" rel="stylesheet" type="text/css">
    <!-- //semantic css -->

    <!-- 套首頁herder和footer css -->
    <link href="css/index_style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //套首頁herder和footer css -->

    <!-- font-awesome icons -->
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!-- //font-awesome icons -->

    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->

    <!-- AD_Page相關CSS及JS -->
    <link href="./css/AD/AD_page.css" rel="stylesheet" type="text/css">
    <link href="./css/Personal/personal_area_home.css" rel="stylesheet" type="text/css">
    <!-- //AD_Page相關CSS及JS -->

    <!-- 聊天相關CSS及JS -->
    <link href="./css/Chat/chat_style.css" rel="stylesheet" type="text/css">
    <script src="./js/Chat/chat.js"></script>
    <!-- //聊天相關CSS及JS -->
    <!-- 自定義css -->
    <link rel="stylesheet" href="/css/Personal/personal_area_blog.css">
    <link href="css/blog_self/blog_divider.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_button.css" rel="stylesheet" type="text/css">
    <!-- //自定義css -->
    <!-- LogoIcon -->
    <link href="images/Logo_Black_use.png" rel="icon" type="image/png">
    <!-- //LogoIcon -->
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
                        <li><a class="top_banner" href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
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
                        <a href="index.html">Travel Maker</a>
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
                                <li><a href="AD.html">專欄</a></li>

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
                <img src="images/person_bar.jpg">
            </div>
            <!--會員訊息-->
            <div class="mem_ind_info">
                <div class="mem_ind_img">
                    <img src="images/p7.jpg">
                </div>
                <div class="mem_ind_name">
                    <p>Ailee Lin &nbsp;
                    </p>
                    <p class="text-truncate" style="font-size:0.9em;padding-top:10px;max-height:110px">
                        我是小番茄，7年級尾端，一個沒有很多錢，但是卻想要環遊世界，也想要結婚生兒育女的平凡人! 我是小番茄，7年級尾端，一個沒有很多錢，但是卻想要環遊世界，也想要結婚生兒育女的平凡人! 我是小番茄，7年級尾端，一個沒有很多錢，但是卻想要環遊世界，也想要結婚生兒育女的平凡人!
                    </p>
                </div>
            </div>
        </div>
        <!--//會員個人頁面標頭-->
        <div class="mem_ind_content">
            <!-- 頁籤項目 -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item active">
                    <a href="persional_area_home.html">
                        <i class="fas fa-home"></i>首頁
                    </a>
                </li>
                <li class="nav-item">
                    <a href="personal_area_friend.html">
                        <i class="fas fa-user-friends"></i>好友
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#blog">
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
            <!-- 卡片 -->
            <div class="ui four stackable cards">

                <a class="fluid card" href="#">
                    <div class="image">
                        <div class="ui image pic">
                            <img src="https://img.travel98.com/r/P_12282_403c4565af99062ac6db33e5fd7c8c4a_o.jpg" alt="">
                        </div>
                    </div>
                    <div class="content">
                        <div class="header">
                            動漫聖地巡旅in京都
                        </div>
                        <div class="meta">
                            <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/26
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">10個留言</span>
                        <i class="far fa-eye"></i> 300次瀏覽
                    </div>
                    <div class="extra content edit_Del">
                        <div class="right floated author nowrap">
                            <div class="btn mx-2 editBlog">
                                <i class="fas fa-edit"></i> 修改
                            </div>
                            <div class="btn mx-2 delBlog">
                                <i class="far fa-trash-alt"></i> 刪除
                            </div>
                        </div>
                    </div>
                </a>

                <a class="fluid card" href="#">
                    <div class="image">
                        <div class="ui image pic">
                            <img src="https://img.travel98.com/r/P_12282_403c4565af99062ac6db33e5fd7c8c4a_o.jpg" alt="">
                        </div>
                    </div>
                    <div class="content">
                        <div class="header">
                            動漫聖地巡旅in京都
                        </div>
                        <div class="meta">
                            <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/26
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">10個留言</span>
                        <i class="far fa-eye"></i> 300次瀏覽
                    </div>
                    <div class="extra content edit_Del">
                        <div class="right floated author nowrap">
                            <div class="btn mx-2 editBlog">
                                <i class="fas fa-edit"></i> 修改
                            </div>
                            <div class="btn mx-2 delBlog">
                                <i class="far fa-trash-alt"></i> 刪除
                            </div>
                        </div>
                    </div>
                </a>

                <a class="fluid card" href="#">
                    <div class="image">
                        <div class="ui image pic">
                            <img src="https://img.travel98.com/r/P_12282_403c4565af99062ac6db33e5fd7c8c4a_o.jpg" alt="">
                        </div>
                    </div>
                    <div class="content">
                        <div class="header">
                            動漫聖地巡旅in京都
                        </div>
                        <div class="meta">
                            <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/26
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">10個留言</span>
                        <i class="far fa-eye"></i> 300次瀏覽
                    </div>
                    <div class="extra content edit_Del">
                        <div class="right floated author nowrap">
                            <div class="btn mx-2 editBlog">
                                <i class="fas fa-edit"></i> 修改
                            </div>
                            <div class="btn mx-2 delBlog">
                                <i class="far fa-trash-alt"></i> 刪除
                            </div>
                        </div>
                    </div>
                </a>

                <a class="fluid card" href="#">
                    <div class="image">
                        <div class="ui image pic">
                            <img src="https://img.travel98.com/r/P_12282_403c4565af99062ac6db33e5fd7c8c4a_o.jpg" alt="">
                        </div>
                    </div>
                    <div class="content">
                        <div class="header">
                            動漫聖地巡旅in京都
                        </div>
                        <div class="meta">
                            <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/26
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">10個留言</span>
                        <i class="far fa-eye"></i> 300次瀏覽
                    </div>
                    <div class="extra content edit_Del">
                        <div class="right floated author nowrap">
                            <div class="btn mx-2 editBlog">
                                <i class="fas fa-edit"></i> 修改
                            </div>
                            <div class="btn mx-2 delBlog">
                                <i class="far fa-trash-alt"></i> 刪除
                            </div>
                        </div>
                    </div>
                </a>

                <a class="fluid card" href="#">
                    <div class="image">
                        <div class="ui image pic">
                            <img src="https://img.travel98.com/r/P_12282_403c4565af99062ac6db33e5fd7c8c4a_o.jpg" alt="">
                        </div>
                    </div>
                    <div class="content">
                        <div class="header">
                            動漫聖地巡旅in京都
                        </div>
                        <div class="meta">
                            <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/26
                        </div>
                    </div>
                    <div class="extra content">
                        <span class="right floated">10個留言</span>
                        <i class="far fa-eye"></i> 300次瀏覽
                    </div>
                    <div class="extra content edit_Del">
                        <div class="right floated author nowrap">
                            <div class="btn mx-2 editBlog">
                                <i class="fas fa-edit"></i> 修改
                            </div>
                            <div class="btn mx-2 delBlog">
                                <i class="far fa-trash-alt"></i> 刪除
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <!-- //卡片 -->
            <!-- 我是隔板 -->
            <div class="ui hidden divider"></div>
            <!-- //我是隔板 -->
            <!-- 換頁bar -->
            <div class="ui page grid padded page_bar">
                <!-- 上一頁button -->
                <div class="ui buttons">
                    <button class="ui labeled icon button">
                        <i class="left chevron icon"></i> 上一頁
                    </button>
                </div>
                <!-- //上一頁button -->
                <!-- 下一頁button -->
                <div class="ui buttons">
                    <button class="ui right labeled icon button">
                        下一頁
                        <i class="right chevron icon"></i>
                    </button>
                </div>
                <!-- //下一頁button -->
                <!-- 頁數資訊 -->
                <div class="page_info">
                    顯示第1頁，共4頁
                </div>
                <!-- //頁數資訊 -->
            </div>
            <!-- //換頁bar -->
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

    <!-- 小的聊天列表 start-->
    <div class="chatContainer">
        <div class="chatHeader">

            &nbsp;<i class="fas fa-comment"></i>&nbsp;聊天室
            <span style="float: right;padding-right: 10px" id="chat_addFri_span">
                    <span data-toggle="tooltip" title="建立新對話" data-placement="top" >
                        <i class="fas fa-user-plus"></i>
                    </span>
            </span>

        </div>
        <div class="chatContext">
            <ul class="list-group">
                <li class="list-group-item"><img class="avatar" src="./images/p1.jpg">凱文</li>
                <li class="list-group-item"><img class="avatar" src="./images/p2.jpg">大眼怪</li>
                <li class="list-group-item"><img class="avatar" src="./images/p3.png">卡納赫拉</li>
                <li class="list-group-item"><img class="avatar" src="./images/p4.png">臭跩貓</li>
                <li class="list-group-item"><img class="avatar" src="./images/p5.jpg">好想兔</li>
                <li class="list-group-item"><img class="avatar" src="./images/p6.png">茶包</li>
            </ul>
        </div>
        <div class="chatFooter">
            <div class="input-group">
                <span class="input-group-addon" id="basic-addon1"><i class="fas fa-search"></i></span>
                <input type="text" class="form-control" placeholder="搜尋" aria-describedby="basic-addon1" id="search_Fri">
            </div>
        </div>
    </div>
    <!-- 小的聊天列表 END -->

    <!-- Modal 建立聊天視窗 start-->
    <div class="modal fade" id="chat_AddFri_Modal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal 建立聊天視窗content start-->
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">建立聊天</h4>
                </div>

                <div class="modal-body">
                    <!--輸入盒聊天對話-->
                    <div class="ui left icon input fluid">
                        <input type="text" placeholder="為聊天命名" id="chatName" required>
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

                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri01">
                                    <label for="fri01" style="width:80%">
                                        <img class="ui avatar image" src="./images/p1.jpg">
                                        <span class="content">小小兵small</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri02">
                                    <label for="fri02" style="width:80%">
                                        <img class="ui avatar image" src="./images/p2.jpg">
                                        <span class="content">大眼怪eye</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri03">
                                    <label for="fri03" style="width:80%">
                                        <img class="ui avatar image" src="./images/p3.png">
                                        <span class="content">卡納赫拉kanihei</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri04">
                                    <label for="fri04" style="width:80%">
                                        <img class="ui avatar image" src="./images/p4.png">
                                        <span class="content">北爛貓cat</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri05">
                                    <label for="fri05" style="width:80%">
                                        <img class="ui avatar image" src="./images/p5.jpg">
                                        <span class="content">好想兔rabbit</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri06">
                                    <label for="fri06" style="width:80%">
                                        <img class="ui avatar image" src="./images/p6.png">
                                        <span class="content">豆卡頻道dog</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri07">
                                    <label for="fri07" style="width:80%">
                                        <img class="ui avatar image" src="./images/author1.jpg">
                                        <span class="content">美女women</span>
                                    </label>
                                </div>
                                <div class="item">
                                    <input type="checkbox" class="ui checkbox" id="fri08">
                                    <label for="fri08" style="width:80%">
                                        <img class="ui avatar image" src="./images/t4.jpg">
                                        <span class="content">帥哥man</span>
                                    </label>
                                </div>

                            </div>
                        </div>
                        <!--已選擇加入聊天對話列表-->
                        <div style="float:left;width:40%;height:inherit;border-left: 1px" id="select_Fri">
                            <div style="padding-left: 20px;height: 10%">
                                已選擇<i class="check circle icon"></i>
                            </div>
                            <div class="ui middle aligned selection list" style="height:89%;overflow:auto" id="select_FriList">
                                <!--這裡我要塞被選到的好友；動態顯示-->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-success">確認</button>
                </div>

            </div>
            <!-- Modal 建立聊天視窗content END-->
        </div>
    </div>
    <!-- Modal 建立聊天視窗 END -->



</body>

</html>
