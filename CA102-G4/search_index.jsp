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

    <!-- bootstrap css、JS檔案 -->
    <link href="css/index_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/index_bootstrap.js"></script>
    <!-- //bootstrap-css -->

    <!-- 套首頁herder和footer css -->
    <link href="css/index_style_header_footer.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //套首頁herder和footer css -->

    <!-- font-awesome icons -->
    <link href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" rel="stylesheet" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <!-- //font-awesome icons -->

    <!-- font字體 -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <!-- //font字體 -->

    <!-- blog 自定義的css -->
    <link href="css/blog_self/blog_semantic.min.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/blog_self/blog_label.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_divider.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_button.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_icon.css" rel="stylesheet" type="text/css">
    <!-- //blog 自定義的css -->
    <!-- search 自定義的css -->
    <link rel="stylesheet" href="css/search/search.css">
    <link rel="stylesheet" href="css/search/search_blog.css">
    <!-- //search 自定義的css -->
    <!-- blog 自定義的js -->
    <script src="js/blog_self/blog_semantic.min.js"></script>
    <script src="js/search/search.js"></script>
    <!-- //blog 自定義的js -->

    <!-- 景點幻燈片 -->
    <link href="swiper-4.3.3/dist/css/swiper.min.css" rel="stylesheet">
    <script src="swiper-4.3.3/dist/js/swiper.min.js"></script>
    <!-- 景點幻燈片 -->
    
    <!-- LogoIcon -->
    <link href="images/Logo_Black_use.png" rel="icon" type="image/png">
    <!--    <link rel="icon" href="images/Logo_Black_use.ico" type="image/x-icon">-->
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
                                <li><a href="advertisement.html">專欄</a></li>

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
    <!-- 內容 -->
    <div class="ui container" id="container">
        <!-- 我是隔板 -->
        <div class="ui hidden divider"></div>
        <!-- //我是隔板 -->
        <!-- 搜尋BAR -->
        <div class="ui fluid action input">
            <input type="text" placeholder="搜索行程、旅遊記、會員、問答、揪團、景點">
            <div class="ui button">搜尋</div>
        </div>
        <!-- 搜尋BAR -->
        <!-- 我是隔板 -->
        <div class="ui hidden divider"></div>
        <!-- //我是隔板 -->
        <!-- Menu -->
        <div class="ui tabular menu">
            <a class="item active" href="search_index.html">
                最佳
            </a>
            <a class="item" href="search_blog.html">
                旅遊記
            </a>
            <a class="item" href="search_member.html">
                會員
            </a>
            <a class="item" href="search_ask.html">
                問答
            </a>
            <a class="item" href="search_together.html">
                揪團
            </a>
            <a class="item" href="search_tour.html">
                景點
            </a>
        </div>
        <!-- //Menu -->
        <!-- 搜尋的結果 -->
        <div class="row mob-col-rev">
            <!-- 搜尋的結果左邊 -->
            <div class="column results">
                <!-- 景點 -->
                <div class="poi_results swiper-container swiper-container-horizontal swiper-container-free-mode">
                    <!-- 方向按鈕 -->
                    <div class="fas fa-chevron-right fa-3x"></div>
                    <div class="fas fa-chevron-left fa-3x"></div>
                    <!-- //方向按鈕 -->
                    <!-- 卡片*10張 -->
                    <div class="swiper-wrapper ui cards">

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/1203_2992d27b1f6bff0bcd5f9b54176ad409_o.JPG)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    JR西日本宮島渡輪
                                </div>
                            </div>
                            <div class="meta"></div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/P_34018_9e87276a7e22558d59eaf0f49e16a018_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋電電街（日本橋電器街／動漫街）
                                </div>
                            </div>
                            <div class="meta">大阪</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋4
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋5
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋6
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋7
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋8
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋9
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                        <a class="raised card swiper-slide swiper-slide-active" href="#" target="_blank">
                            <div class="image" style="background: url(https://img.travel98.com/n/333/1333_S_104_4430_o.jpg)">
                                <div class="ui top right attached  green  label">景點</div>
                            </div>
                            <div class="name content">
                                <div class="ui header">
                                    日本橋10
                                </div>
                            </div>
                            <div class="meta">東京車站・銀座・日本橋</div>
                        </a>

                    </div>
                    <!-- //卡片*10張 -->
                </div>
                <!-- //景點 -->
                <!-- 旅遊記 -->
                <div class="ui left aligned search_results">
                    <div class="ui divided items segment article_result">

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title searchContent" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="content searchContent">
                                <a class="ui header title" target="_blank" href="#">
                                    [大阪]大阪城
                                </a>
                                <div class="description text-truncate">
                                    如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，如果要我在日本選一個城市生活，我一定會選擇大阪，雖然京都的古色香讓人癡迷，但在城市生活慣的飄兒，還是習慣充滿活力、娛樂與美食的大阪，
                                </div>
                                <div class="extra">
                                    <a href="#" target="_blank">
                                        <i class="fas fa-user user"></i>黃世銘
                                    </a>
                                    <i class="far fa-calendar-alt calendar"></i>2016-12-08 11:56:02
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- //旅遊記 -->
            </div>
            <!-- //搜尋的結果左邊 -->
            <!-- 搜尋的結果右邊 -->
            <div class="column area_result center aligned">
                <div class="swiper-container2">
                    <div class="swiper-wrapper userSwiper-wrapper">
                        <a class="swiper-slide swiperCard" href="#" target="_blank">
                            <div class="userImage" style="background-image:url(images/yuan.jpg)">
                            </div>
                            <div class="userInfo">
                                <div class="userInfoHeader">
                                    李浩源
                                </div>
                                <div class="userInfoJoindate">
                                    Joined in 2018/07/09
                                </div>
                                <div class="userInfoDescription">
                                    安安，我是浩源，住在台北市。
                                </div>
                            </div>
                            <div class="userExtra">
                                <i class="fas fa-user userIcon"></i>30 Friends
                            </div>
                        </a>
                        <a class="swiper-slide swiperCard" href="#" target="_blank">
                            <div class="userImage" style="background-image:url(images/ailee.jpg)">
                            </div>
                            <div class="userInfo">
                                <div class="userInfoHeader">
                                    Ailee Lin
                                </div>
                                <div class="userInfoJoindate">Joined in 2018/07/09</div>
                                <div class="userInfoDescription">安安，我是萱萱，新竹人。
                                </div>
                            </div>
                            <div class="userExtra">
                                <i class="fas fa-user userIcon"></i>20 Friends
                            </div>
                        </a>
                        <a class="swiper-slide swiperCard" href="#" target="_blank">
                            <div class="userImage" style="background-image:url(images/ga.jpg)">
                            </div>
                            <div class="userInfo">
                                <div class="userInfoHeader">
                                    阿嘎
                                </div>
                                <div class="userInfoJoindate">Joined in 2018/07/09</div>
                                <div class="userInfoDescription">安安，我是阿嘎。
                                </div>
                            </div>
                            <div class="userExtra">
                                <i class="fas fa-user userIcon"></i>50 Friends
                            </div>
                        </a>
                        <a class="swiper-slide swiperCard" href="#" target="_blank">
                            <div class="userImage" style="background-image:url(images/eddie.jpg)">
                            </div>
                            <div class="userInfo">
                                <div class="userInfoHeader">
                                    黃世銘
                                </div>
                                <div class="userInfoJoindate">Joined in 2018/07/09</div>
                                <div class="userInfoDescription">安安，我是黃世銘，hihi。
                                </div>
                            </div>
                            <div class="userExtra">
                                <i class="fas fa-user userIcon"></i>30 Friends
                            </div>
                        </a>
                        <a class="swiper-slide swiperCard" href="#" target="_blank">
                            <div class="userImage" style="background-image:url(images/smallWu.jpg)">
                            </div>
                            <div class="userInfo">
                                <div class="userInfoHeader">
                                    小吳
                                </div>
                                <div class="userInfoJoindate">Joined in 2018/07/09</div>
                                <div class="userInfoDescription">安安，我是小吳，今天天氣真好。
                                </div>
                            </div>
                            <div class="userExtra">
                                <i class="fas fa-user userIcon"></i>80 Friends
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- //搜尋的結果右邊 -->
        </div>
        <!-- //搜尋的結果 -->
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
    <!-- //內容 -->

    <!-- //blog -->
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
