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

    <!-- blog 自定義的js -->
    <script src="js/blog_self/blog.js"></script>
    <script src="js/blog_self/blog_semantic.min.js"></script>
    <!-- //blog 自定義的js -->
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
    <div class="ui container">
        <!-- 我是隔板 -->
        <div class="ui hidden divider"></div>
        <!-- //我是隔板 -->
        <h1 class="ui header">
            <span style="margin-right: 1rem">最新文章列表</span>
            <p style="display: inline-block;font-size: 1rem">
                共 <span>87</span> 篇
            </p>
        </h1>
        <!-- 我是隔板 -->
        <div class="ui hidden divider"></div>
        <!-- //我是隔板 -->
        <!-- Menu -->
        <div class="ui tabular menu">
            <a class="item active itemRight">
                最新分享
              </a>
            <a class="item itemRight">
                最多瀏覽
              </a>
            <!-- 搜尋BAR -->
            <div class="ui massive right action left icon input">
                <i class="search icon"></i>
                <input type="text" placeholder="請輸入關鍵字...">
                <div class="ui basic floating dropdown button">
                    <div class="text">請選擇</div>
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <div class="item">標題</div>
                        <div class="item">內容</div>
                        <div class="item">國家</div>
                    </div>
                </div>
            </div>
            <!-- 搜尋BAR -->
        </div>
        <!-- //Menu -->
        <!-- 我是隔板 -->
        <div class="ui hidden divider"></div>
        <!-- //我是隔板 -->
        <!-- 卡片放置區 -->
        <div class="ui four stackable cards">

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_12282_403c4565af99062ac6db33e5fd7c8c4a_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
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
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://img.travel98.com/avatar/n/19676_8c205e1c94929d8cbed3a0e748dd67f3_n.jpg"> 紅貴賓
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_19676_ff50407c49758662d64db4993acbac58_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        洛杉磯９８✈️ＬＡ-ＬＶ拉斯維加斯醉後大丈夫自駕+加州迪士尼＋大峽谷＋羚羊峽谷
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/24
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">2個留言</span>
                    <i class="far fa-eye"></i> 100次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="http://acg.ms/photo/35336_0_620.jpeg"> 浩克
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_49817_342ced6e49207eb070c595d0b2693f30_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        日本秘境賞楓【紅葉林＊古參道＊肉蓋飯】
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/30
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">8個留言</span>
                    <i class="far fa-eye"></i> 250次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://pgw.udn.com.tw/gw/photo.php?u=https://uc.udn.com.tw/photo/2017/09/18/99/4013509.jpg&x=0&y=0&sw=0&sh=0&sl=W&fw=1050&exp=3600"> 館長
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_74486_e1a6f8036fe0c0ad2bf274b23fb62a41_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        法國史特拉斯堡一日漫遊
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/07/28
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">14個留言</span>
                    <i class="far fa-eye"></i> 360次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="http://img.ltn.com.tw/Upload/ent/page/800/2017/07/03/phpdDrMJG.jpg"> 鋼鐵人
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_81414_06acd7e8dcf1504e4080ef3ff963fa8b_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        法國史特拉斯堡一日漫遊
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/07/28
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">18個留言</span>
                    <i class="far fa-eye"></i> 680次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://s3.beautimode.com/upload/media/0031c0c38fafe1a1d91ee9ff9db3027e.jpg"> 美國隊長
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_53372_0bffcbe26e7077bf893e5e1eceddfc04_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        法國史特拉斯堡一日漫遊
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/07/28
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">18個留言</span>
                    <i class="far fa-eye"></i> 680次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://s3.beautimode.com/upload/media/0031c0c38fafe1a1d91ee9ff9db3027e.jpg"> 美國隊長
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_6981_c022cbaec215cbb82beda9fb1a447392_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        法國史特拉斯堡一日漫遊
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/07/28
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">18個留言</span>
                    <i class="far fa-eye"></i> 680次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://s3.beautimode.com/upload/media/0031c0c38fafe1a1d91ee9ff9db3027e.jpg"> 美國隊長
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_98999_e720bb9f6f3898174252d4567338b364_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        法國史特拉斯堡一日漫遊
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/07/28
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">18個留言</span>
                    <i class="far fa-eye"></i> 680次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://s3.beautimode.com/upload/media/0031c0c38fafe1a1d91ee9ff9db3027e.jpg"> 美國隊長
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_15416_c321e45385be4ddadc5acb86e26b8e30_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        法國史特拉斯堡一日漫遊
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/07/28
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">18個留言</span>
                    <i class="far fa-eye"></i> 680次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="https://s3.beautimode.com/upload/media/0031c0c38fafe1a1d91ee9ff9db3027e.jpg"> 美國隊長
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_81414_79be378a3407210145c68addb7b80bc2_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        洛杉磯９８✈️ＬＡ-ＬＶ拉斯維加斯醉後大丈夫自駕+加州迪士尼＋大峽谷＋羚羊峽谷
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/24
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">2個留言</span>
                    <i class="far fa-eye"></i> 100次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="http://acg.ms/photo/35336_0_620.jpeg"> 浩克
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_10366_ea4717903c2694a65ef0ab659be0a02d_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        洛杉磯９８✈️ＬＡ-ＬＶ拉斯維加斯醉後大丈夫自駕+加州迪士尼＋大峽谷＋羚羊峽谷
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/24
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">2個留言</span>
                    <i class="far fa-eye"></i> 100次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="http://acg.ms/photo/35336_0_620.jpeg"> 浩克
                    </div>
                </div>
            </a>

            <a class="fluid card" href="#">
                <div class="image">
                    <div class="ui image pic">
                        <img src="https://img.travel98.com/r/P_14734_eb5972cfe0e07388e0afb973947bc60c_o.jpg" alt="">
                        <div class="ui teal ribbon label">
                            遊記
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="header">
                        洛杉磯９８✈️ＬＡ-ＬＶ拉斯維加斯醉後大丈夫自駕+加州迪士尼＋大峽谷＋羚羊峽谷
                    </div>
                    <div class="meta">
                        <i class="far fa-calendar-alt"></i> 旅行日期:2018/06/24
                    </div>
                </div>
                <div class="extra content">
                    <span class="right floated">2個留言</span>
                    <i class="far fa-eye"></i> 100次瀏覽
                </div>
                <div class="extra content">
                    <div class="right floated author nowrap">
                        <img class="ui avatar image" src="http://acg.ms/photo/35336_0_620.jpeg"> 浩克
                    </div>
                </div>
            </a>

            <!-- 新增遊記按鈕 -->
            <div class="fab_wrapper">
                <a href="blog_Add.html" class="ui huge circular red icon button" data-content="建立文章遊記" data-variation="basic inverted" data-position="left center">
                    <i class="plus icon"></i>
                </a>
            </div>
            <!-- //新增遊記按鈕 -->
        </div>
        <!-- //卡片放置區 -->
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
