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

    <div class="lineup"  style="background-image: url(<?php echo ($back_img); ?>);background-size: 100% auto;background-repeat:  no-repeat;background-color: #e1ddda;">
    <header class="header">
        <div class="headerBox mobile_menus">
            <ul class="topNav">

            </ul>
        </div>
        <div class="headerBox">
            <p class="headerLogo"><a href="http://yaxin.xinjmc.com" tppabs=""><img src="/Public/static/yasin/new_imgs/logo.png"></a></p>
            <ul class="globalNav">
                <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i; if(($nav["pid"]) == "0"): ?><li <?php if($nav["title"] == '产业资源'): ?>class="current"<?php endif; ?>>
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

        <div class="top_items show">
            <div class="center_menu clearfix">
                <ul class="breadcrumbed float_left">
                    <li><a href="<?php echo U('Index/index');?>">TOP</a></li>
                    <li><a href="javascript:void(0)"><?php echo ($f_cate["title"]); ?></a></li>
                    <li><?php echo ($this["title"]); ?></li>
                </ul>
                <div class="right_menus float_right clearfix">
                    <ul class="small_menus float_right">
                        <?php if(is_array($current_cate)): $i = 0; $__LIST__ = $current_cate;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$current): $mod = ($i % 2 );++$i;?><li <?php if($this['title'] == $current['title']): ?>class="active"<?php endif; ?>>
                            <a href="<?php echo U('Article/company?id='.$current['id'].'&detail_type=1&pjax=container');?>"><?php echo ($current["title"]); ?></a>
                            <i class="icons_line"></i>
                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <i class="box_line"></i>
                </div>
            </div>
        </div>
    </header>

    <div class="breadcrumbs"></div>

        <section id="stage1" class="lineupHeading">
            <h1>
                <div class="img"><img src="<?php echo ($picture); ?>" class="fit" alt="Himiko"></div>
            </h1>
        </section>

        <div id="pjaxBody">
            <div class="new_content">
                <h1><span><?php echo ($detail["0"]["list_title"]); ?></span><i>/ <?php echo ($detail["0"]["en_title"]); ?></i></h1>
                <div class="new_bodys">
                    <?php echo ($detail["0"]["article"]); ?>
                </div>
            </div>
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
        </div>
    </div>

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