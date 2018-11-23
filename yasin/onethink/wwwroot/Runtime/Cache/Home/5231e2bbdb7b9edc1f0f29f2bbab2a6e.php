<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html lang="ja" prefix="og: http://ogp.me/ns# fb: http://www.facebook.com/2008/fbml">
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
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/Public/static/bootstrap/js/html5shiv.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/Public/static/bootstrap/js/bootstrap.min.js"></script>
<!--<![endif]-->

<link rel="stylesheet" href="/Public/static/yasin/css/reset.css">
<link rel="stylesheet" href="/Public/static/yasin/css/iconfont.css">
<link rel="stylesheet" href="/Public/static/yasin/css/common.css">
<link rel="stylesheet" href="/Public/static/yasin/css/hmk_cv.css">
<link rel="stylesheet" href="/Public/static/yasin/css/video.css" type="text/css"/>
<link rel="stylesheet" href="/Public/static/yasin/css/amazeui.min.css" type="text/css"/>
<link rel="stylesheet" href="/Public/static/yasin/css/owl.carousel.min.css" type="text/css"/>
<link rel="stylesheet" href="/Public/static/yasin/css/owl.theme.default.min.css" type="text/css"/>
<link rel='stylesheet' id='contact-form-7-css' href="/Public/static/yasin/css/styles.css" type='text/css' media='all'/>
<link rel='stylesheet' href="/Public/static/yasin/css/new_styles.css" type='text/css'/>
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
</style>
<link rel='stylesheet' href="/Public/static/yasin/css/styles.css-ver=4.5.css" type='text/css' media='all'/>
<link rel='stylesheet'  href="/Public/static/yasin/css/new_styles.css" type='text/css'/>

<script type='text/javascript' src="/Public/static/yasin/js/jquery.js"></script>
<script type='text/javascript' src="/Public/static/yasin/js/jquery-migrate.min.js"></script>
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>

</head>
<body class="toppage">
	<!-- 头部 -->
	<!-- 导航条
================================================== -->
<header class="header">
    <div class="headerBox mobile_menus">
        <ul class="topNav">

        </ul>
    </div>
    <div class="headerBox">
        <p class="headerLogo"><a href="index.php?s=/Home/Index/index" tppabs=""><img src="/Public/static/yasin/new_imgs/logo.png"></a></p>
        <ul class="globalNav">
            <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li>
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
</header>

	<!-- /头部 -->
	
	<!-- 主体 -->
	
    <header class="jumbotron subhead" id="overview">
        <div class="container">
            <h2>源自相同起点，演绎不同精彩！</h2>
            <p class="lead"></p>
        </div>
    </header>


<!-- 左侧 nav
================================================== -->

    <div class="span9">
        <!-- Contents
        ================================================== -->
        <section id="contents">
            <?php $__CATE__ = D('Category')->getChildrenId($category['id']);$__LIST__ = D('Document')->page(!empty($_GET["p"])?$_GET["p"]:1,10)->lists($__CATE__, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><div class="">
                    <h3><a href="<?php echo U('Article/detail?id='.$list['id']);?>"><?php echo ($list["title"]); ?></a></h3>
                </div>
                <div>
                    <p class="lead"><?php echo ($list["description"]); ?></p>
                </div>
                <div>
                    <span><a href="<?php echo U('Article/detail?id='.$list['id']);?>">查看全文</a></span>
                    <span class="pull-right">
                        <span class="author"><?php echo (get_username($list["uid"])); ?></span>
                        <span>于 <?php echo (date('Y-m-d H:i',$list["create_time"])); ?></span> 发表在 <span>
                        <a href="<?php echo U('Article/lists?category='.get_category_name($list['category_id']));?>"><?php echo (get_category_title($list["category_id"])); ?></a></span> 
                        <span>阅读( <?php echo ($list["view"]); ?> )</span>&nbsp;&nbsp;
                    </span>
                </div>
                <hr/><?php endforeach; endif; else: echo "" ;endif; ?>

        </section>
    </div>

	<!-- /主体 -->

	<!-- 底部 -->
	
    <!-- 底部
    ================================================== -->
    <footer class="footer">
        <div class="footerBox">
            <div class="footerPagetop" id="footerPagetop"><a href="#top"></a></div>
            <ul class="footerNav">
                <li><a href="#stage2">亚新集团</a></li>
                <li><a href="#stage3">医疗布局</a></li>
                <li><a href="#stage4">产业资源</a></li>
                <li><a href="#stage5">最新资讯</a></li>
                <li><a href="#stage6">关于我们</a></li>
            </ul>
            <div class="footerLogo"><img src="/Public/static/yasin/new_imgs/logo.png" alt=""></div>
            <div class="footerCopyright"><?php echo C(WEB_SITE_ADDRESS);?>  ICP备案：<?php echo C(WEB_SITE_ICP);?><span><?php echo C(WEB_SITE_COPYRIGHT);?></span></div>
        </div>
    </footer>
    <script src="/Public/static/yasin/js/jquery-3.1.0.min.js"></script>
    <script src="/Public/static/yasin/js/jquery-1.9.1.min.js"></script>
    <script src="/Public/static/yasin/js/jquery.pjax.min.js"></script>
    <script src="/Public/static/yasin/js/common.js"></script>
    <script src="/Public/static/yasin/js/amazeui.min.js"></script>
    <script src="/Public/static/yasin/js/owl.carousel.min.js"></script>

    <script type='text/javascript' src="/Public/static/yasin/js/jquery.form.min.js"></script>
    <script src="/Public/static/yasin/js/pingzi_video.js" type="text/javascript" charset="utf-8"></script>
    <!--<script type='text/javascript' src="/Public/static/yasin/js/scripts.js"></script>-->
    <script type='text/javascript' src="/Public/static/yasin/js/wp-embed.min.js"></script>
    <script type="text/javascript" src="/Public/static/yasin/js/jquery.page.js"></script>

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

            $(".globalNav li:nth-child(1)").addClass('current');
            $('.globalNav li a').click(function(){
                $('.globalNav li').removeClass('current');
                $(this).parent().addClass('current');
            });

        $(document).ready(function() {
//            $(".small_menus li:nth-child(1)").addClass('active');
//            $('.small_menus li a').click(function () {
//                $('.small_menus li').removeClass('active');
//                $(this).parent().addClass('active');
//            });

//            $('.globalNav li a').each(function(){
//                if($($(this))[0].href==String(window.location)){
//                    $('.globalNav li').removeClass("current");
//                    $(this).parent().addClass('current');
//                }
//            });

            $('.small_menus li a').each(function(){
                if($($(this))[0].href==String(window.location)){
                    $('.small_menus li').removeClass("active");
                    $(this).parent().addClass('active');
                }
            });
        });

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

        $(".pageDiv").createPage({
            pageCount: 20,//总页数
            current: 1,//当前页
            turndown: 'false',//是否显示跳转框，显示为true，不现实为false,一定记得加上引号...
            backFn: function (p) {
                //            $('#modals').html('')
                //            initPage(p,0);
            }
        });

    </script>

    <script>
        $('.show_code').click(function(){
            $('.er_code').fadeIn(200);
        });
        $('.close_btn').click(function(){
            $('.er_code').fadeOut(200);
        });
    </script>
    <script>
        var owl1 = $("#owl-demo1");
        owl1.on('initialize.owl.carousel initialized.owl.carousel ' +
            'initialize.owl.carousel initialize.owl.carousel ' +
            'resize.owl.carousel resized.owl.carousel ' +
            'refresh.owl.carousel refreshed.owl.carousel ' +
            'update.owl.carousel updated.owl.carousel ' +
            'drag.owl.carousel dragged.owl.carousel ' +
            'translate.owl.carousel translated.owl.carousel ' +
            'to.owl.carousel changed.owl.carousel', function (e) {
            $('.' + e.type)
                .removeClass('secondary')
                .addClass('success');
            window.setTimeout(function () {
                $('.' + e.type)
                    .removeClass('success')
                    .addClass('secondary');
            }, 500);
        });
        owl1.owlCarousel({
            loop: true,
            nav: true,
            navText: ["", ""],
            lazyLoad: true,
            autoplay: false,
            autoplayTimeout: 2000,
            autoplayHoverPause: true,
            margin: 10,
            video: true,

            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                960: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            }
        });

        $('.hover_doc_intro').hover(
            function(){
                $('#data_name').text($(this).attr('data-name'));
                $('#data_skill').text($(this).attr('data-skill'));
                $('#data_intro').text($(this).attr('data-intro'));
                $('#data_per').text($(this).attr('data-per'));
                $(this).find('img').addClass('show');
            },function(){
                $(this).find('img').removeClass('show');
            }
        );
    </script>

<script type="text/javascript">
(function(){
	var ThinkPHP = window.Think = {
		"ROOT"   : "", //当前网站地址
		"APP"    : "/index.php?s=", //当前项目地址
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