<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content="">
<meta name="description" content="">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:type" content="website">
<!--<meta property="og:type" content="article">-->
<meta property="og:url" content="">
<meta property="og:site_name" content="">
<meta property="og:image" content="/fb.jpg">
<meta property="og:locale" content="ja_JP">

<title><?php echo C('WEB_SITE_TITLE');?></title>
<link rel="icon" href="/Public/static/yasin/new_imgs/logo_icon.png" type="image/x-icon"/>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/Public/static/bootstrap/js/html5shiv.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<!--<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>/-->
<![endif]-->
<!--[if gte IE 9]><!-->
<!--<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>-->
<!--<![endif]-->

<link rel="stylesheet" href="/Public/static/yasin/css/reset.css">
<link rel="stylesheet" href="/Public/static/yasin/css/common.css">
<link rel="stylesheet" href="/Public/static/yasin/css/hmk_cv.css">
<link rel="stylesheet" href="/Public/static/yasin/css/video.css" type="text/css"/>
<link rel="stylesheet" href="/Public/static/yasin/css/amazeui.min.css" type="text/css"/>
<link rel="stylesheet" href="/Public/static/yasin/css/owl.carousel.min.css" type="text/css"/>
<link rel="stylesheet" href="/Public/static/yasin/css/owl.theme.default.min.css" type="text/css"/>
<link rel='stylesheet' id='contact-form-7-css' href="/Public/static/yasin/css/styles.css" type='text/css' media='all'/>
<link rel='stylesheet' href="/Public/static/yasin/css/new_styles.css" type='text/css'/>
<link rel="stylesheet" href="/Public/static/yasin/css/iconfont.css">
<script src="/Public/static/yasin/js/jquery-3.1.0.min.js"></script>
<style type="text/css">
    img.wp-smiley,
    img.emoji {
        display: inline !important;
        border: none !important;
        box-shadow: none !important;
        height: 1em !important;
        width: 1em !important;
        margin: 0 .07em !important;
        vertical-align: -0.1em !important;
        background: none !important;
        padding: 0 !important;
    }
    *{margin: 0; padding: 0;}
    .loading{position: relative;}
    .clock{position: relative; width: 150px; height: 150px; display: inline-block;}
    .loading .progress{position: absolute; width: 140px; height:140px; background-color: white; border-radius: 50%; left: 5px; top: 5px; line-height:150px; text-align: center;
    }
    .progress span{ font: 50px/2em Arial;}
    .left,.right{width: 75px;height: 150px;overflow: hidden; position: relative; float: left;}
    .left{ border-radius: 150px 0 0 150px;}
    .right{ border-radius: 0 150px 150px 0;}
    .left div,.right div{content:"";  position:absolute; display:block; width: 75px;height: 150px; background-color: white;border-radius: 150px 0 0 150px; transition:all .3s; transform-origin:right center; transform:rotateZ(-180deg);}
    .right div{content:"";  position:absolute; display:block;   border-radius:  0 150px 150px 0;transform-origin:left center; }
    .clock:nth-child(1) .left div,.clock:nth-child(1) .right div{
        background-color: #5E9EBF;
    }
    .clock:nth-child(2) .left div,.clock:nth-child(2) .right div{
        background-color: green;
    }
    .clock:nth-child(3) .left div,.clock:nth-child(3) .right div{
        background-color: blue;
    }




</style>
<link rel='stylesheet' href="/Public/static/yasin/css/styles.css-ver=4.5.css" type='text/css' media='all'/>
<link rel='stylesheet'  href="/Public/static/yasin/css/new_styles.css" type='text/css'/>

<!--<script type='text/javascript' src="/Public/static/yasin/js/jquery.js"></script>
<script type='text/javascript' src="/Public/static/yasin/js/jquery-migrate.min.js"></script>-->
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>

</head>
<body class="toppage">
	<!-- 头部 -->
	<!-- /头部 -->
	
	<!-- 主体 -->
	

<!-- 左侧 nav
================================================== -->

    <header class="header" id="home_header">
        <div class="headerBox mobile_menus">
            <ul class="topNav">

            </ul>
        </div>
        <div class="headerBox">
            <p class="headerLogo"><a href="http://yaxin.xinjmc.com" tppabs=""><img src="/Public/static/yasin/new_imgs/logo.png"></a></p>
            <ul class="globalNav">
                <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li <?php if($nav["title"] == '亚信集团'): ?>class="current"<?php endif; ?>>
                            <a href="<?php echo (get_nav_url($nav["url"])); ?>" target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>">
                                <p><?php echo ($nav["title"]); ?></p>
                                <span><?php echo ($nav["en_title"]); ?></span>
                            </a>
                            <em></em>
                            <i></i>
                        </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <div class="right_icons">
                <a href="javascript:void(0);" class="show_code"><img src="/Public/static/yasin/new_imgs/wechat.png" alt=""></a>
                <a href=""><img src="/Public/static/yasin/new_imgs/sina.png" alt=""></a>
            </div>
        </div>
        <div class="top_items" id="hospital_menu">
            <div class="center_menu clearfix">
                <ul class="breadcrumbed float_left">
                    <li><a href="<?php echo U('Index/index');?>">TOP</a></li>
                    <li><a href="javascript:void(0)">医疗布局</a></li>
                    <li class="add_text"></li>
                </ul>
                <div class="right_menus float_right clearfix">
                    <ul class="small_menus float_right">
                        <li><a href="<?php echo U('Article/hospital_lists?category=colligate_list&id=18&pjax=container');?>">综合医院</a><i class="icons_line"></i></li>
                        <li><a href="<?php echo U('Article/hospital_lists?category=specialty_list&id=23&pjax=container');?>">专科医院</a><i class="icons_line"></i></li>
                        <li><a href="<?php echo U('Article/hospital_lists?category=high_list&id=24&pjax=container');?>">高端医疗</a><i class="icons_line"></i></li>
                        <li><a href="<?php echo U('Article/hospital_lists?category=accelerator_list&id=25&pjax=container');?>">医疗创新加速器</a><i class="icons_line"></i></li>
                    </ul>
                    <i class="box_line"></i>
                </div>
            </div>
        </div>
        <div class="top_items" id="resou_menu">
            <div class="center_menu clearfix">
                <ul class="breadcrumbed float_left">
                    <li><a href="<?php echo U('Index/index');?>">TOP</a></li>
                    <li><a href="javascript:void(0)">产业资源</a></li>
                    <li class="add_text"></li>
                </ul>
                <div class="right_menus float_right clearfix">
                    <ul class="small_menus float_right">
                        <li><a href="<?php echo U('Article/company?id=17&detail_type=1');?>">院企合作</a><i class="icons_line"></i></li>
                        <li><a href="<?php echo U('Article/company?id=32&detail_type=1');?>">医教研融合</a><i class="icons_line"></i></li>
                        <li><a href="<?php echo U('Article/company?id=33&detail_type=1');?>">全球伙伴</a><i class="icons_line"></i></li>
                    </ul>
                    <i class="box_line"></i>
                </div>
            </div>
        </div>
    </header>
    <!-------------首页Banner------------->
    <?php if(is_array($first)): $i = 0; $__LIST__ = $first;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$fi): $mod = ($i % 2 );++$i;?><div id="bgVideoContainer">
            <video src="<?php echo ($fi["banner_video"]); ?>" width="1280" height="720" style="width: auto; height: 927px;" autoplay poster="<?php echo ($fi['banner_img']); ?>" muted></video>
        </div>
        <div class="top_items breadcrumbs hide">

        </div>
        <section id="stage1" class="stageContainer">
            <div class="topMainvisual">
                <div class="topMainvisualInner">
                    <h1 class="topMainvisualText set_font_fmly"><?php echo ($fi["list_title"]); ?></h1>
                    <p class="topMainvisualText_p set_font_fmly"><?php echo ($fi["sub_title"]); ?></p>
                    <div class="topMainvisualButton">
                        <p class="borderButton"><a href="javascript:void(0)"><?php echo ($fi["button"]); ?></a></p>
                        <p class="doubleCircleButton"><a class="pageDown" href="#stage2"></a></p>
                    </div>
                </div>
                <ul id="topMainvisualImage">
                    <?php foreach($fi['mobile_img'] as $li):?>
                        <li class=""><img src="<?php echo ($li['path']); ?>" alt=""></li>
                    <?php endforeach;?>
                </ul>
            </div>
        </section><?php endforeach; endif; else: echo "" ;endif; ?>

    <!-- Contents
    ================================================== -->

    <!------------亚信集团-------------->
    <section id="stage2" class="stageContainer topInstagram">
        <?php if(is_array($second)): $i = 0; $__LIST__ = $second;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sec): $mod = ($i % 2 );++$i;?><div class="head">
            <div class="sort_numbers">
                <h1>01</h1>
                <span>/</span>
                <p>05</p>
            </div>
            <div class="section_head_text">
                <h2><?php echo ($sec["list_title"]); ?></h2>
                <p>·<?php echo ($sec["sub_title"]); ?></p>
                <span><?php echo ($sec["en_title"]); ?></span>
            </div>

            <p class="upButton"><a class="pageUp" href="#stage1"></a></p>
            <p class="downButton"><a class="pageDown" href="#stage3"></a></p>
        </div>
        <div class="body list_body_02" style="background: url(<?php echo ($sec['banner_img']); ?>) no-repeat;height: 100%;background-size: cover;background-position: center center;">
            <ul>
                <?php foreach($sec['list'] as $li):?>
                <li>
                    <div class="lightboxs">
                        <img src="<?php echo ($li["list_images"]); ?>" alt=""></a>
                        <a href="<?php echo U('Article/company_info?id='.$li['id'].'&next_title='.$sec['main_title'].'&detail_type=1');?>" class="inner_links">
                            <span><?php echo ($li["list_title"]); ?></span>
                            <em><?php echo ($li["sub_title"]); ?></em>
                            <div class="txt"></div>
                        </a>
                    </div>
                </li>
                <?php endforeach;?>
                <li>
                    <div class="lightboxs">
                        <img src="/Public/static/yasin/new_imgs/sheng.jpg" alt=""></a>
                        <!--<a href="" class="inner_links">-->
                            <!--<span>投管历程</span>-->
                            <!--<em>的九分裤更合适的反馈给红烧豆腐感觉和电风扇呢</em>-->
                            <!--<div class="txt"></div>-->
                        <!--</a>-->
                    </div>
                </li>

            </ul>
        </div>
        <div class="skewedBgLeft new_lefts"></div><?php endforeach; endif; else: echo "" ;endif; ?>
    </section>

    <!------------医疗布局-------------->
    <?php if(is_array($third)): $i = 0; $__LIST__ = $third;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$th): $mod = ($i % 2 );++$i;?><section id="stage3" class="stageContainer topLineup topPickup" data-src="<?php echo ($th['banner_img']); ?>">
            <div class="head">
                <div class="sort_numbers">
                    <h1>02</h1>
                    <span>/</span>
                    <p>05</p>
                </div>
                <div class="section_head_text">
                    <h2><?php echo ($th["list_title"]); ?></h2>
                    <p>·<?php echo ($th["sub_title"]); ?></p>
                    <span><?php echo ($th["en_title"]); ?></span>
                </div>
                <p class="upButton"><a class="pageUp" href="#stage2"></a></p>
                <p class="downButton"><a class="pageDown" href="#stage4"></a></p>
            </div>

            <div class="body list_body_03" style="background: url(<?php echo ($th['banner_img']); ?>) no-repeat;height: 100%;background-size: 100% auto;" data-type="3">
                <?php foreach($th['list'] as $li):?>
                <a href="<?php echo U('Article/hospital_lists?category='.$li['name'].'&id='.$li['id'].'&pjax=container');?>" class="pjax" data-type="<?php echo ($li["list_title"]); ?>">
                <!--<a href="<?php echo U('Article/hospital_lists?category=colligate_list&id=18');?>" class="pjax">-->
                    <div class="banner">
                        <div class="img"><img src="<?php echo ($li["list_images"]); ?>" class="fit" alt=""></div>
                        <div class="txt left_link_text">
                            <p><?php echo ($li["list_title"]); ?></p>
                            <span><?php echo ($li["en_title"]); ?></span>
                        </div>
                    </div>
                </a>
                <?php endforeach;?>
            </div>
            <div class="skewedBgRight skewedBgRight_new_02"></div>
        </section><?php endforeach; endif; else: echo "" ;endif; ?>

    <!------------产业资源-------------->
    <?php if(is_array($fourth)): $i = 0; $__LIST__ = $fourth;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$fou): $mod = ($i % 2 );++$i;?><section id="stage4" class="stageContainer topLineup toplinksShow" data-src="<?php echo ($fou['banner_img']); ?>">
        <div class="head">
            <div class="sort_numbers">
                <h1>03</h1>
                <span>/</span>
                <p>05</p>
            </div>
            <div class="section_head_text">
                <h2><?php echo ($fou["list_title"]); ?></h2>
                <p>·<?php echo ($fou["sub_title"]); ?></p>
                <span><?php echo ($fou["en_title"]); ?></span>
            </div>
            <p class="upButton"><a class="pageUp" href="#stage3"></a></p>
            <p class="downButton"><a class="pageDown" href="#stage5"></a></p>
        </div>

        <div class="body list_body_04" style="background: url(<?php echo ($fou['banner_img']); ?>) no-repeat;height: 100%;background-size: 100% auto;" data-type="4">
            <?php foreach($fou['list'] as $li):?>
            <a href="<?php echo U('Article/company?id='.$li['id'].'&detail_type=1&pjax=container');?>" class="pjax"  data-type="<?php echo ($li["list_title"]); ?>">
            <!--<a href="<?php echo U('Article/article_lists?category='.$li['name'].'&first_title='.$fou['main_title'].'&second_title='.$li['list_title']);?>" class="pjax">-->
                <div class="banner">
                    <div class="img"><img src="<?php echo ($li["list_images"]); ?>" class="fit" alt=""></div>
                    <div class="txt left_link_text">
                        <p><?php echo ($li["list_title"]); ?></p>
                        <span><?php echo ($li["en_title"]); ?></span>
                    </div>
                </div>
            </a>
            <?php endforeach;?>
        </div>

        <div class="skewedBgLeft new_lefts"></div>
    </section><?php endforeach; endif; else: echo "" ;endif; ?>

    <!------------最新资讯-------------->
    <?php if(is_array($fifth)): $i = 0; $__LIST__ = $fifth;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$fif): $mod = ($i % 2 );++$i;?><section id="stage5" class="topNews" style="background: url(<?php echo ($fif['banner_img']); ?>) no-repeat;height: 100%;background-size: cover;background-position: center center;">
        <div class="head news_head">
            <div class="sort_numbers">
                <h1>04</h1>
                <span>/</span>
                <p>05</p>
            </div>
            <h1><?php echo ($fif["list_title"]); ?></h1>
        </div>
        <div class="inner">
            <h2>·医院动态 <span>/Hospital dynamics</span></h2>
            <p class="borderButton"><a href="<?php echo U('Article/article_lists?category=dynamic_list');?>">发现更多</a></p>
            <ul>
                <?php foreach($fif['dynamic'] as $dyn):?>
                <li>
                    <a href="<?php echo U('Article/list_detail?id='.$dyn['id'].'&next_title='.$fif['main_title'].'&detail_type=1');?>" class="link">
                        <time class="news_times" datetime="2017-09-29"><?php echo (date("Y.m.d",$dyn["create_time"])); ?></time>
                        <p><?php echo ($dyn["list_title"]); ?></p>
                    </a>
                </li>
                <?php endforeach;?>
            </ul>
        </div>

        <div class="inner">
            <h2>·集团新闻<span>/Group news</span></h2>
            <p class="borderButton"><a href="<?php echo U('Article/article_lists?category=news_list&list_row=6');?>">发现更多</a></p>
            <ul>
                <?php foreach($fif['news'] as $ne):?>
                <li>
                    <a href="<?php echo U('Article/list_detail?id='.$ne['id'].'&next_title='.$fif['main_title'].'&detail_type=1');?>" class="link">
                        <time class="news_times" datetime="2017-11-02"><?php echo (date("Y.m.d",$ne["create_time"])); ?></time>
                        <p><?php echo ($ne["list_title"]); ?></p>
                    </a>
                </li>
                <?php endforeach;?>
            </ul>
        </div>
    </section><?php endforeach; endif; else: echo "" ;endif; ?>

    <!------------关于我们-------------->
    <?php if(is_array($sixth)): $i = 0; $__LIST__ = $sixth;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$six): $mod = ($i % 2 );++$i;?><section id="stage6" class="topAbouts" style="background: url(<?php echo ($six['banner_img']); ?>) no-repeat;height: 100%;background-size: cover;background-position: center center;">
        <div class="head">
            <div class="sort_numbers">
                <h1>05</h1>
                <span>/</span>
                <p>05</p>
            </div>
            <div class="section_head_text">
                <h2><?php echo ($six["list_title"]); ?></h2>
                <p>·<?php echo ($six["sub_title"]); ?></p>
                <span><?php echo ($six["en_title"]); ?></span>
            </div>
            <p class="upButton"><a class="pageUp" href="#stage5"></a></p>
        </div>

        <div class="body">
            <ul class="about_lists clearfix">
                <li>
                    <div class="list_box">
                        <div class="hd_imgs"><a href="<?php echo U('Article/contact?id='.$six['contact'][0]['id'].'&next_title='.$sec['main_title'].'&detail_type=1');?>"><img src="<?php echo ($six['contact']["0"]["path"]); ?>" alt=""></a></div>
                        <div class="about_box">
                            <h1><?php echo ($six['contact']["0"]["list_title"]); ?> <span>/ <em><?php echo ($six['contact']["0"]["en_title"]); ?></em></span></h1>
                            <p class="phone_play clearfix"><img src="/Public/static/yasin/new_imgs/phone.png" alt=""><span><?php echo ($six['contact']["0"]["tel"]); ?></span></p>
                        </div>
                        <a href="<?php echo U('Article/contact?id='.$six['contact'][0]['id'].'&next_title='.$sec['main_title'].'&detail_type=1');?>" class="about_btn"><img src="/Public/static/yasin/new_imgs/next.png" alt=""></a>
                    </div>
                </li>
                <li>
                    <div class="list_box">
                        <div class="hd_imgs"><a href="<?php echo U('Article/recruit?category=recruit_list');?>"><img src="<?php echo ($six['list']["1"]["list_images"]); ?>" alt=""></a></div>
                        <div class="about_box">
                            <h1><?php echo ($six['list']["1"]["list_title"]); ?> <span>/ <em><?php echo ($six['list']["1"]["en_title"]); ?></em></span></h1>
                            <p class="phone_play clearfix"><img src="/Public/static/yasin/new_imgs/phone.png" alt=""><span><?php echo ($six['list']["1"]["tel"]); ?></span></p>
                        </div>
                        <a href="<?php echo U('Article/recruit?category=recruit_list');?>" class="about_btn"><img src="/Public/static/yasin/new_imgs/next.png" alt=""></a>
                    </div>
                </li>
                <li>
                    <div class="list_box">
                        <div class="hd_imgs">
                            <img src="<?php echo ($six['video']["path"]); ?>" alt="">
                            <div class="m-video" data-src="<?php echo ($six['video']["video_path"]); ?>" style="text-align: center;cursor: pointer;" onclick="video_time_add()"><img src="/Public/static/yasin/new_imgs/palys.png" alt=""></div>
                            <input id="video" type="hidden" value="<?php echo ($six['video']["0"]["id"]); ?>">
                        </div>
                        <div class="about_box">
                            <h1><?php echo ($six['video']["list_title"]); ?> <span>/ <em><?php echo ($six['video']["en_title"]); ?></em></span></h1>
                            <p class="phone_play clearfix"><img src="/Public/static/yasin/new_imgs/play.png" alt=""><span>播放次数：<em><?php echo ($six['video']["view"]); ?></em>次</span></p>
                        </div>
                        <a href=" " onclick="video_time_add()" class="about_btn"><img src="/Public/static/yasin/new_imgs/next.png" alt=""></a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="skewedBgRight skewedBgRight_about"></div>
    </section><?php endforeach; endif; else: echo "" ;endif; ?>


    <ul id="topStageNav">
        <li><a href="#stage1" class="current"><span>01</span></a></li>
        <li><a href="#stage2"><span>02</span></a></li>
        <li><a href="#stage3"><span>03</span></a></li>
        <li><a href="#stage4"><span>04</span></a></li>
        <li><a href="#stage5"><span>05</span></a></li>
        <li><a href="#stage6"><span>06</span></a></li>
    </ul>


    <footer class="footer">
        <div class="footerBox">
            <div class="footerPagetop" id="footerPagetop"><a href="#top"></a></div>
            <ul class="footerNav">
                <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li>
                            <a href="<?php echo (get_nav_url($nav["url"])); ?>" target="<?php if(($nav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>">
                                <p><?php echo ($nav["title"]); ?></p>
                            </a>
                        </li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <div class="footerLogo"><img src="/Public/static/yasin/new_imgs/logo.png" alt=""></div>
            <div class="footerCopyright"><?php echo C(WEB_SITE_ADDRESS);?>  ICP备案：<?php echo C(WEB_SITE_ICP);?><span><?php echo C(WEB_SITE_COPYRIGHT);?></span></div>
        </div>
    </footer>



    <div class="loading_box">
        <div>
            <div>
                <div>
                    <div class="contents-loading">
                        <div class="loader_box">
                            <div class="loading">
                                <div class="clock seconds">
                                    <div class="left"><div></div></div>
                                    <div class="right"><div></div></div>
                                    <div class="progress"><span></span></div>
                                    <div class="loading_text">
                                        <div class="load_text1">
                                            <i></i>
                                            <span><img src="/Public/static/yasin/new_imgs/text1.png" alt=""></span>
                                            <p><img src="/Public/static/yasin/new_imgs/img1.png" alt=""></p>
                                        </div>
                                        <div class="load_text2">
                                            <i></i>
                                            <span><img src="/Public/static/yasin/new_imgs/text2.png" alt=""></span>
                                            <p><img src="/Public/static/yasin/new_imgs/img2.png" alt=""></p>
                                        </div>
                                        <div class="load_text3">
                                            <i></i>
                                            <span><img src="/Public/static/yasin/new_imgs/text3.png" alt=""></span>
                                            <p><img src="/Public/static/yasin/new_imgs/img3.png" alt=""></p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <p class="load_text">努力的加载中...  <span id="load_p"></span>%</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--首页-->
    <script src="/Public/static/yasin/js/pingzi_video.js" type="text/javascript" charset="utf-8"></script>
    <script type='text/javascript' src="/Public/static/yasin/js/jquery.imgpreload.min.js"></script>
    <script>
        //首页
        var imgs = document.images;
        var imgNum = 0;
        var the_images = [];
        var win_wid = $(window).width();
        var win_hei = $(window).height();
        for (var i = 0; i < imgs.length; i++) {
            the_images.push(imgs[i].src);
        }
        jQuery.imgpreload(the_images, {
            each: function () {
                var status = $(this).data('loaded') ? 'success' : 'error';
                if (status == "success") {
                    var v = (parseFloat(++imgNum) / the_images.length).toFixed(2);
                    var count = Math.round(v * 100);
                    if(count > 25){
                        $('.load_text1').addClass('show');
                    }
                    if(count > 40){
                        $('.load_text2').addClass('show');
                    }
                    if(count > 60){
                        $('.load_text3').addClass('show');
                    }
                    showHours("seconds",count,50);
                    $('#load_p').text(count);
                }
            },
            all: function () {
                setTimeout(function(){
                    $('.loading_box').fadeOut(200);
                },5000);
            }
        });

        function showHours(oClass,num,n){
            var aEle = getByClass(oClass)[0].children,
                Rdeg = num > n ? n : num,
                Ldeg = num > n ? num - n : 0;
            aEle[2].innerHTML = "<span></span>";

            aEle[1].children[0].style.transform = "rotateZ("+ (360/(2*n)*Rdeg-180) +"deg)";
            aEle[0].children[0].style.transform = "rotateZ("+ (360/(2*n)*Ldeg-180) +"deg)";
        }

        function getByClass(oClass){
            return document.getElementsByClassName(oClass);
        }
    </script>

    <script>
        function video_time_add() {
            var url = "http://yaxin.xinjmc.com/home/article/video_view";
            //请求链接格式：一般处理程序文件?action="请求的操作"
            url += "&id=" + $("#video").val();　　　　　　　　　　//参数格式&参数名=值

            $.ajax({
                type: "get",　　　　　　　　　　//以POST的方式发送请求
                url: url,　　　　　　　　　　　　//上面拼凑的链接及参数
                contentType: "application/json",
                dataType: "json",
                success: function (data)
                {
                    //成功获取一般处理程序响应后执行的代码
                },
                error: function (err)
                {
                    //收到一般处理程序响应失败后执行的代码
                    alert("观看失败");
                }
            });
        }
    </script>


	<!-- /主体 -->

	<!-- 底部 -->
	
    <!-- 底部
    ================================================== -->

    <div class="er_code">
        <div>
            <div>
                <div>
                    <div class="contents-box">
                        <img class="close_btn" src="/Public/static/yasin/new_imgs/close.png" alt="">
                        <img class="code_er" src="/Public/static/yasin/new_imgs/code.png" alt="">
                        <p class="scan_code">扫描二维码关注公众号</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="/Public/static/yasin/js/jquery.pjax.min.js"></script>
    <script src="/Public/static/yasin/js/common.js"></script>
    <script src="/Public/static/yasin/js/amazeui.min.js"></script>

    <script type='text/javascript' src="/Public/static/yasin/js/jquery.form.min.js"></script>
    <script type='text/javascript' src="/Public/static/yasin/js/wp-embed.min.js"></script>


<!--&lt;!&ndash;医院详情&ndash;&gt;-->
    <!--<script src="/Public/static/yasin/js/owl.carousel.min.js"></script>-->
    <!---->
<!--&lt;!&ndash;分页&ndash;&gt;-->
    <!--<script type="text/javascript" src="/Public/static/yasin/js/jquery.page.js"></script>-->

<!--&lt;!&ndash;首页&ndash;&gt;-->
    <!--<script src="/Public/static/yasin/js/pingzi_video.js" type="text/javascript" charset="utf-8"></script>-->
    <!--<script type='text/javascript' src="/Public/static/yasin/js/jquery.imgpreload.min.js"></script>-->


    <script type='text/javascript'>

//        $(document).pjax('a', '#pjaxBody');
        $(document).pjax('a', '#pjaxBody');
        $(document).on("pjax:timeout", function(event) {
            // 阻止超时导致链接跳转事件发生
            event.preventDefault();
        });
//        $(document).pjax('a', '#pjax-container');
//        $(document).on("pjax:timeout", function(event) {
//            // 阻止超时导致链接跳转事件发生
//            event.preventDefault();
//        });
//        $('a').pjax({
//            container: '#container', //内容替换的容器
//            fx: 'fade',  //展现的动画，支持默认和fade, 可以自定义动画方式。
//            cache: true,  //是否使用缓存
//            storage: true,  //是否使用本地存储
//            titleSuffix: '' //标题后缀
//        });

        $('.recruit_lists .recruit_link').on('click',function(){
            if($(this).parent().hasClass('show')){
                $(this).parent().removeClass('show');
            }else{
                $(this).parent().addClass('show');
            }
        });

        (function smoothscroll(){
            var currentScroll = document.documentElement.scrollTop || document.body.scrollTop;
            if (currentScroll > 0) {
                window.requestAnimationFrame(smoothscroll);
                window.scrollTo (0,currentScroll - (currentScroll/5));
            }
        })();
//
//        $(document).ready(function(){
//            $(".globalNav li a").each(function(){
//                $this = document.getElementById('bank');
//                if($this==String(window.location)){
//                    $this.addClass("current");  //hover表示被选中效果的类名
//                }
//            });
//        });


//        $('.globalNav li a').click(function(){
//            $('.globalNav li').removeClass('current');
//            $(this).parent().addClass('current');
//        });

//        $(document).ready(function(){
//            $(".globalNav li:nth-child(1)").addClass('current');
//            $(".globalNav li a").each(function(){
//                $this = $(this);
//                if($this[0].href==String(window.location)){
//                    $('.globalNav li').removeClass('current');
//                    $(this).parent().addClass('current');  //hover表示被选中效果的类名
//                }
//            });
//        });


        $(document).ready(function() {
            $('.small_menus li a').each(function(){
                $this = $(this);
                if($this[0].href==String(window.location)){
                    $('.small_menus li').removeClass('active');
                    $(this).parent().addClass('active');  //hover表示被选中效果的类名
                }
            });
        });
//        $(document).ready(function() {
//            $('.small_menus li a').each(function(){
//                if($(this)[0].href==String(window.location)){
//                    $('.small_menus li').removeClass("active");
//                    $(this).parent().addClass('active');
//                }
//            });
//        });

//        $(".globalNav li:nth-child(1)").addClass('current');
//        $('.globalNav li a').click(function(){
//            $('.globalNav li').removeClass('current');
//            $(this).parent().addClass('current');
//        });

//        $(".globalNav li a").on("click",function(){
//            var the=$(this).attr("id");
//            $(".globalNav li:nth-child("+the+")").addClass('current');
//            $('.globalNav li a').click(function(){
//                $('.globalNav li').removeClass('current');
//                $(this).parent().addClass('current');
//            });
//        });

    </script>

    <script>
        $('.show_code').click(function(){
            $('.er_code').fadeIn(200);
        });
        $('.close_btn').click(function(){
            $('.er_code').fadeOut(200);
        });

//        $(".globalNav li:nth-child(1)").addClass('current');
//        $('.globalNav li a').click(function(){
//            $('.globalNav li').removeClass('current');
//            $(this).parent().addClass('current');
//        });

//        var url = $('.globalNav li a').attr('id');
//        console.log(url);
//        var url = window.location.href;
//        var what = document.getElementById('bank');
//        if (url = what){
//            $(".globalNav li:nth-child(5)").addClass('current');
//        }
//        $('.globalNav li a').click(function(){
//            $('.globalNav li').removeClass('current');
//            $(this).parent().addClass('current');
////        });
//
//        $(document).ready(function(){
//
//            $(".globalNav li a").each(function(){
//                $this = document.getElementById('bank');
//                if($this==String(window.location)){
//                    $this.addClass("current");  //hover表示被选中效果的类名
//                }
//            });
//        });

//        $(".globalNav li a").on("click",function(){
//            var the=$(this).attr("id");
//            $(".globalNav li:nth-child("+the+")").addClass('current');
//            $('.globalNav li a').click(function(){
//                $('.globalNav li').removeClass('current');
//                $(this).parent().addClass('current');
//            });
//        });

//        if ($url = $this){
//            $('.globalNav li a').click(function(){
//                $(this).parent().addClass('current');
//            });
//        }

//        var $nava=$(".globalNav");
//        $nava.children("li").click(function(){
//            $(this).children("a").addClass("current");
//            $(this).siblings().children("a").removeClass("current")
//        });

    </script>

<script type="text/javascript">
(function(){
	var ThinkPHP = window.Think = {
		"ROOT"   : "", //当前网站地址
		"APP"    : "", //当前项目地址
		"PUBLIC" : "/Public", //项目公共目录地址
		"DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
		"MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
		"VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
	}
})();
</script>
 <!-- 用于加载js代码 -->
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
	
</div>

	<!-- /底部 -->
</body>
</html>