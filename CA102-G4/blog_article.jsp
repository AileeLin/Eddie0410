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
    <link rel="stylesheet" href="css/blog_self/blog_grid.css">
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
    <link href="css/blog_self/blog_divider.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_button.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_icon.css" rel="stylesheet" type="text/css">
    <link href="css/blog_self/blog_atricle.css" rel="stylesheet">
    <!-- //blog 自定義的css -->

    <!-- blog 自定義的js -->
    <script src="js/blog_self/blog.js"></script>
    <script src="js/blog_self/blog_semantic.min.js"></script>
    <script src="js/blog_self/blog_article.js"></script>
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
                    日本★不自駕也能暢遊北海道~GOGO!★札幌~小樽~支笏湖~青池~旭山動物園~T38展望台夜景☆
                </h1>
                <!-- //左邊文章標題 -->
                <!-- 左邊文章標題下方統計數字 -->
                <div class="article_brief_info">
                    <ul class="helper-clear">
                        <li class="brief_info author far fa-user"><a href="#">&nbsp;黃世銘</a></li>
                        <li class="brief_info_divider"></li>
                        <li class="brief_info date_icon release_date far fa-calendar-alt">
                            <label>&nbsp;發表日期：</label>2018/07/03</li>
                        <li class="brief_info_divider"></li>
                        <li class="brief_info view_cnt far fa-eye">&nbsp;298&nbsp;次瀏覽</li>
                        <li class="brief_info_gap"></li>
                        <li class="brief_info reply_cnt far fa-comment">&nbsp;3&nbsp;個留言</li>
                        <li class="brief_info_gap"></li>
                        <li class="brief_info like_cnt far fa-heart" data-like_cnt="0">&nbsp;5&nbsp;人收藏</li>
                    </ul>
                </div>
                <!-- //左邊文章標題下方統計數字 -->
                <!-- 我是隔板 -->
                <div class="ui hidden divider"></div>
                <!-- //我是隔板 -->
                <!-- 遊記內容 -->
                <div class="article_content">
                    <h1>Wiki</h1>

                    <p>維基百科，自由的百科全書</p>

                    <p><a href="https://zh.wikipedia.org/wiki/Wiki#mw-head">跳至導覽</a><a href="https://zh.wikipedia.org/wiki/Wiki#p-search">跳至搜尋</a></p>

                    <p><img alt="Confusion grey.svg" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Confusion_grey.svg/26px-Confusion_grey.svg.png" style="height:20px; width:26px" /></p>

                    <p><strong>提示</strong>：本條目的主題不是<strong><a href="https://zh.wikipedia.org/wiki/Wikia">Wikia</a></strong>、<strong><a href="https://zh.wikipedia.org/wiki/%E7%B6%AD%E5%9F%BA">維基</a></strong>、<strong><a href="https://zh.wikipedia.org/wiki/%E7%BB%B4%E5%9F%BA%E5%AA%92%E4%BD%93%E5%9F%BA%E9%87%91%E4%BC%9A">維基媒體基金會</a></strong>或<strong><a href="https://zh.wikipedia.org/wiki/%E7%B6%AD%E5%9F%BA%E7%99%BE%E7%A7%91">維基百科</a></strong>。
                        <a href="https://zh.wikipedia.org/wiki/File:Ward_Cunningham_-_Commons-1.jpg"><img alt="" border="0" hspace="0" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Ward_Cunningham_-_Commons-1.jpg/220px-Ward_Cunningham_-_Commons-1.jpg" style="border:0px solid black; float:right; height:236px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:220px" vspace="0" /></a>
                    </p>

                    <p><a href="https://zh.wikipedia.org/wiki/%E6%B2%83%E5%BE%B7%C2%B7%E5%9D%8E%E5%AE%81%E5%AE%89">沃德&middot;坎寧安</a>，wiki技術的發明者。</p>

                    <p><strong>Wiki</strong>（
                        <a href="https://upload.wikimedia.org/wikipedia/commons/4/46/En-us-wiki.ogg"><img alt="聆聽" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Speakerlink-new.svg/11px-Speakerlink-new.svg.png" style="height:11px; width:11px" /></a><sup><a href="https://zh.wikipedia.org/wiki/File:En-us-wiki.ogg">i</a></sup><a href="https://zh.wikipedia.org/wiki/Help:%E8%8B%B1%E8%AA%9E%E5%9C%8B%E9%9A%9B%E9%9F%B3%E6%A8%99">/ˈwɪkiː/</a>）是一種在<a href="https://zh.wikipedia.org/wiki/%E5%85%A8%E7%90%83%E8%B3%87%E8%A8%8A%E7%B6%B2">全球資訊網</a>上開放且可供多人協同創作的<a href="https://zh.wikipedia.org/wiki/%E8%B6%85%E6%96%87%E6%9C%AC%E7%B3%BB%E7%B5%B1">超文字系統</a>，由<a href="https://zh.wikipedia.org/wiki/%E6%B2%83%E5%BE%B7%C2%B7%E5%9D%8E%E5%AE%81%E5%AE%89">沃德&middot;坎寧安</a>於1995年首先開發。沃德&middot;坎寧安將wiki定義為「一種允許一群用戶用簡單的描述來建立和連線一組<a href="https://zh.wikipedia.org/wiki/%E7%BD%91%E9%A1%B5">網頁</a>的社會計算系統」<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-1">[1]</a></sup>。</p>

                    <p>有些人認為<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-%E9%99%88%E7%AB%8B%E5%8D%8E-2">[2]</a></sup>，Wiki系統屬於一種人類知識的網路系統，讓人們可以在web的基礎上對Wiki<a href="https://zh.wikipedia.org/wiki/%E6%96%87%E6%9C%AC">文字</a>進行瀏覽、創建和更改，而且這種創建、更改及發布的代價遠比HTML文字小。與此同時，Wiki系統還支援那些面向社群的協作式寫作，為協作式寫作提供了必要的幫助。最後Wiki的寫作者自然構成了一個社群，Wiki系統為這個社群提供了簡單的交流工具。與其它超文字系統相比，Wiki有使用簡便且開放的特點，有助於在一個社群內共享某個領域的知識。</p>

                    <p>&nbsp;</p>

                    <h2>目錄</h2>

                    <p>&nbsp;&nbsp;[隱藏]&nbsp;</p>

                    <ul>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E8%AF%8D%E6%BA%90">1詞源</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E6%AD%B7%E5%8F%B2">2歷史</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E7%89%B9%E5%BE%81">3特徵</a>
                            <ul>
                                <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E7%BC%96%E8%BE%91Wiki%E9%A1%B5%E9%9D%A2">3.1編輯Wiki頁面</a></li>
                            </ul>
                        </li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E6%87%89%E7%94%A8">4應用</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E5%AE%9E%E6%96%BD">5實施</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E5%AF%BC%E8%88%AA">6導航</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E8%AE%A4%E5%8F%AF%E4%B8%8E%E5%AE%89%E5%85%A8">7認可與安全</a>
                            <ul>
                                <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E6%8E%A7%E5%88%B6%E6%9B%B4%E6%94%B9">7.1控制更改</a></li>
                                <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E6%90%9C%E7%B4%A2">7.2搜尋</a></li>
                            </ul>
                        </li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E8%A7%84%E5%88%99">8規則</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E7%A4%BE%E5%8C%BA">9社群</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E5%8F%82%E8%A7%81">10參見</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E5%8F%82%E8%80%83%E6%96%87%E7%8C%AE">11參考文獻</a></li>
                        <li><a href="https://zh.wikipedia.org/wiki/Wiki#%E5%A4%96%E9%83%A8%E9%80%A3%E7%B5%90">12外部連結</a></li>
                    </ul>

                    <p>&nbsp;</p>

                    <h2>詞源</h2>

                    <p><strong>wiki</strong>（<a href="https://zh.wikipedia.org/wiki/IPA">IPA</a>：[ˈwɪ.kiː]&nbsp;&lt;WICK-ee&gt; 或&nbsp;[ˈwiː.kiː]&nbsp;&lt;WEE-kee&gt;）源自<a href="https://zh.wikipedia.org/wiki/%E5%A4%8F%E5%A8%81%E5%A4%B7%E8%AF%AD">夏威夷語</a>的「WikiWiki」，本是「快點快點」之意<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-3">[3]</a></sup>。wiki的<a href="https://zh.wikipedia.org/wiki/%E4%B8%AD%E6%96%87">中文</a>翻譯有<strong>維客</strong>、<strong>圍紀</strong>、<strong>快紀</strong>、<strong>共筆</strong>或<strong>維基</strong>等等，其中「<a href="https://zh.wikipedia.org/wiki/%E7%B6%AD%E5%9F%BA">維基</a>」一詞是中文維基百科人特別為維基百科而創，屬於<a href="https://zh.wikipedia.org/wiki/%E7%BB%B4%E5%9F%BA%E5%AA%92%E4%BD%93">維基媒體</a>的專用術語。隨著「維基」一詞能見度增加，常被泛用為wiki的主要音譯名<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-%E9%99%88%E7%AB%8B%E5%8D%8E-2">[2]</a></sup></p>

                    <h2>歷史</h2>

                    <p>
                        <a href="https://zh.wikipedia.org/wiki/File:WikiWiki.jpg"><img alt="" border="0" hspace="0" src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/WikiWiki.jpg/250px-WikiWiki.jpg" style="border:0px solid black; float:right; height:263px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:250px" vspace="0" /></a>
                    </p>

                    <p><a href="https://zh.wikipedia.org/wiki/%E6%AA%80%E9%A6%99%E5%B1%B1">檀香山</a>的Wiki Wiki站牌</p>

                    <p>Wiki軟體由<a href="https://zh.wikipedia.org/wiki/%E8%BD%AF%E4%BB%B6%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F">軟體設計模式</a>社群開發，用來書寫與討論模式語言。<a href="https://zh.wikipedia.org/wiki/%E6%B2%83%E5%BE%B7%C2%B7%E5%9D%8E%E5%AE%81%E5%AE%89">沃德&middot;坎寧安</a>於1995年3月25日成立了第一個Wiki網站：<a href="https://zh.wikipedia.org/w/index.php?title=WikiWikiWeb&amp;action=edit&amp;redlink=1">WikiWikiWeb</a>，用來補充他自己經營的軟體設計模式網站。他發明了Wiki這個名字以及相關概念，並且實作了第一個<a href="https://zh.wikipedia.org/wiki/Wiki%E5%BC%95%E6%93%8E">Wiki引擎</a>。坎寧安說自己是根據<a href="https://zh.wikipedia.org/wiki/%E6%AA%80%E9%A6%99%E5%B1%B1">檀香山</a>的Weekee Weekee（意為「快點快點」）公車取名的。這是他到檀香山學會的第一個<a href="https://zh.wikipedia.org/wiki/%E5%A4%8F%E5%A8%81%E5%A4%B7%E8%AF%AD">夏威夷語</a>句子。</p>

                    <p>坎寧安說，Wiki的構想來自他自己在1980年代晚期利用<a href="https://zh.wikipedia.org/wiki/%E8%98%8B%E6%9E%9C%E9%9B%BB%E8%85%A6">蘋果電腦</a><a href="https://zh.wikipedia.org/wiki/HyperCard">HyperCard</a>程式作出的一個小功能<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-4">[4]</a></sup>。HyperCard類似<a href="https://zh.wikipedia.org/wiki/%E5%90%8D%E7%89%87">名片</a>整理程式，可用來紀錄人物與相關事物。HyperCard管理許多稱為「卡片」的資料，每張卡片上都可劃分欄位、加上圖片、有樣式的文字或按鈕等等，而且這些內容都可在查閱卡片的同時修改編輯。HyperCard類似於後來的網頁，但是缺乏一些重要特徵。</p>

                    <p>坎寧安認為原來的HyperCard程式十分有用，但創造卡片與卡片之間的連結卻很困難。於是他不用HyperCard程式原本的創造連結功能，而改用「隨選搜尋」的方式自己增添了一個新的連結功能。使用者只要將連結輸入卡片上的一個特殊欄位，而這個欄位每一行都有一個按鈕。按下按鈕時如果卡片已經存在，按鈕就會帶使用者去那張卡片，否則就發出嗶聲，而繼續壓著按鈕不放，程式就會為使用者產生一張卡片。</p>

                    <p>坎寧安向他的朋友展示了這個程式和他自己寫的人事卡片，往往會有人指出卡片之中的內容不太對，他們就可當場利用HyperCard初始的功能修正內容，並利用坎寧安加入的新功能補充連結。</p>

                    <p>坎寧安後來在別處又寫了這樣的功能，而且這次他還增加了多使用者寫作功能。新功能之一是程式會在每一次任何一張卡片被更改時，自動在「最近更改」卡片上增加一個連往被更改卡片的連結。坎寧安自己常常看「最近更改」卡片，而且還會注意到空白的說明欄位會讓他想要描述一下更改的摘要<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-5">[5]</a></sup>。</p>

                    <h2>特徵</h2>

                    <p>奧德&middot;坎寧安和波&middot;路夫（Bo Leuf）在《<a href="https://zh.wikipedia.org/wiki/The_Wiki_Way">Wiki之道&mdash;&mdash;網上快捷合作</a>》一書中描述了Wiki概念的幾個本質特徵：</p>

                    <ul>
                        <li>Wiki允許任何用戶在Wiki網站內剪輯任何頁面或新建頁面，不需要任何額外的附加元件，只需通過普通的網頁瀏覽器即可。</li>
                    </ul>

                    <h3>編輯Wiki頁面</h3>

                    <p>Wiki中用戶使用很多方式來編輯。通常需要通過文字標記式語言。</p>

                    <h2>應用</h2>

                    <p>
                        <a href="https://zh.wikipedia.org/wiki/File:HNL_Wiki_Wiki_Bus.jpg"><img alt="" border="0" hspace="0" src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/HNL_Wiki_Wiki_Bus.jpg/300px-HNL_Wiki_Wiki_Bus.jpg" style="border:0px solid black; float:right; height:225px; margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; width:300px" vspace="0" /></a>
                    </p>

                    <p>WIKI-WIKI<a href="https://zh.wikipedia.org/wiki/%E5%B7%B4%E5%A3%AB">巴士</a></p>

                    <p>Wiki在一些需要<a href="https://zh.wikipedia.org/wiki/%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F">內容管理系統</a>的企業中得到了廣泛應用<sup><a href="https://zh.wikipedia.org/wiki/Wiki#cite_note-6">[6]</a></sup>、<a href="https://zh.wikipedia.org/wiki/JotSpot">JotSpot</a>和<a href="https://zh.wikipedia.org/w/index.php?title=SocialText&amp;action=edit&amp;redlink=1">SocialText</a>是創Wiki企業應用的先河。Wiki可以在高校教育環境中發揮積極的作用，但是直到2006年，Wiki應用於教育的案例在全球都比較少。Wiki除了被用來建立網站外，也被用作編寫<a href="https://zh.wikipedia.org/wiki/%E7%B6%B2%E8%AA%8C">部落格</a>。Wiki在中小學教育方面，可以作為學生協助學習的平台。</p>

                    <h2>實施</h2>

                    <p>Wiki軟體是一款執行Wiki的<a href="https://zh.wikipedia.org/wiki/%E7%BE%A4%E4%BB%B6">群件</a>，允許使用常見的Web瀏覽器建立和修改網頁，被作為<a href="https://zh.wikipedia.org/wiki/%E6%87%89%E7%94%A8%E7%A8%8B%E5%BC%8F%E4%BC%BA%E6%9C%8D%E5%99%A8">應用程式伺服器</a>在多個<a href="https://zh.wikipedia.org/wiki/%E7%BD%91%E9%A1%B5%E6%9C%8D%E5%8A%A1%E5%99%A8">網頁伺服器</a>上運作。</p>

                    <h2>導航</h2>

                    <p>在大多數頁面的文字，通常有大量的超文字連結到其他網頁。大多數Wiki有一個反向的功能，它顯示所有連結到一個給定頁面的頁面。</p>
                </div>
                <!-- //遊記內容 -->
                <!-- 我是隔板 -->
                <div class="ui hidden divider"></div>
                <!-- //我是隔板 -->
                <!-- 留言區 -->
                <div class="ui threaded comments">

                    <h3 class="ui dividing header">
                        <font style="vertical-align: inherit;">
                            <font style="vertical-align: inherit;">4則留言</font>
                        </font>
                    </h3>

                    <div class="comment">
                        <a class="avatar"><img src="/images/ailee.jpg"></a>
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
                        <a class="avatar"><img src="/images/ga.jpg"></a>
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
                            <a class="avatar"><img src="/images/yuan.jpg"></a>
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
            <!-- 右邊內容 -->
            <div class="col-4">
                <!-- 檢舉、收藏、留言按鈕 -->
                <div class="ui basic buttons">
                    <button class="ui button"><i class="fas fa-ban"></i> 檢舉</button>
                    <button class="ui button"><i class="collection far fa-heart"></i> 收藏</button>
                    <button class="ui button" onclick="location.href='#textareaField'"><i class="far fa-comment-dots"></i> 留言</button>
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
                                <a href="#">黃世銘的文章遊記</a>
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
                                        <span class="count">0</span>
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
                <div class="widgetcontainerheader">
                    黃世銘的最近文章
                </div>
                <div class="widgetcontainer">
                    <ul class="helper-clear sidebar_list">

                        <li class="article journal">
                            <div class="cover_border">
                                <a href="#">
                                    <div class="article_cover" style="background-image:url(https://img.travel98.com/m/5631_6663a396d719b81e5470e84b1977d79f_o.jpg);"></div>
                                </a>
                            </div>
                            <div class="article_body">
                                <div class="article_title right">
                                    <a href="#" title="2015春夏。東京自由行二回目～和服逛淺草、老東京散策、富士芝櫻祭與海濱公園賞花">2015春夏。東京自由行二回目～和服逛淺草、老東京散策、富士芝櫻祭與海濱公園賞花</a>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info author">
                                        <a href="#">&nbsp;黃世銘</a>
                                    </div>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info view_cnt">298&nbsp;次瀏覽</div>
                                    <div class="brief_info_divider_right"></div>
                                    <div class="brief_info like_cnt">5&nbsp;人收藏</div>
                                </div>
                            </div>
                        </li>

                        <li class="article journal">
                            <div class="cover_border">
                                <a href="#">
                                    <div class="article_cover" style="background-image: url(https://img.travel98.com/m/5071_59f3fabf022a6422a36a589e69400bd3_o.JPG)"></div>
                                </a>
                            </div>
                            <div class="article_body">
                                <div class="article_title right">
                                    <a href="#" title="曼谷3日遊">曼谷3日遊</a>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info author">
                                        <a href="#">&nbsp;黃世銘</a>
                                    </div>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info view_cnt">2000&nbsp;次瀏覽</div>
                                    <div class="brief_info_divider_right"></div>
                                    <div class="brief_info like_cnt">1000&nbsp;人收藏</div>
                                </div>
                            </div>
                        </li>

                        <li class="article journal">
                            <div class="cover_border">
                                <a href="#">
                                    <div class="article_cover" style="background-image: url()"></div>
                                </a>
                            </div>
                            <div class="article_body">
                                <div class="article_title right">
                                    <a href="#" title="2015 東京賞櫻">2015 東京賞櫻</a>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info author">
                                        <a href="#">&nbsp;黃世銘</a>
                                    </div>
                                </div>
                                <div class="article_info_container helper-clear">
                                    <div class="brief_info view_cnt">99999&nbsp;次瀏覽</div>
                                    <div class="brief_info_divider_right"></div>
                                    <div class="brief_info like_cnt">8888&nbsp;人收藏</div>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
                <!-- //作者的最近文章 -->
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
                    <a href="index.html" target="_blank" title="TravelMaker">TravelMaker</a>
                </p>
            </div>
        </div>
    </div>
    <!-- //footer -->
</body>

</html>
