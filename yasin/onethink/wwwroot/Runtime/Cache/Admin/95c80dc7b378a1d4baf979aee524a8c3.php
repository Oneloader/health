<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="使用 thinkPHP 和 bootstrap 管理系统">
<meta name="author" content="">
<title><?php echo ($meta_title); ?>|<?php echo C('WEB_SITE_TITLE');?></title>
<link rel="shortcut icon" href="/Public/favicon.ico">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/sb/bootstrap.min.css" />
<!-- Font Awesome CSS -->
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/font-awesome/css/font-awesome.min.css" />

<!-- 表格 css-->
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/sb/dataTables.bootstrap.css" />
<!-- 弹出提示框，ajax用 css -->
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/sb/messenger.css" />
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/sb/messenger-theme-style.css" />

<!-- SB Admin CSS - Include with every page -->
<link rel="stylesheet" type="text/css" href="/Public/Admin/css/sb/sb-admin.css" />   

<!-- Custom styles for this template -->
<!-- 用于加载 css 代码 --> 
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>
</head>
<body>
<div id="wrapper">
  <!-- 导航条 ================================================== --> 
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<?php echo U('Index/index');?>">&nbsp;&nbsp;ThinkPHP 3.2.1</a>
    </div><!-- /.navbar-header -->

    <ul class="nav navbar-nav navbar-top-links">
        <li class="disabled"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        <li class="disabled"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
    <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>	
    </ul>

    <ul class="nav navbar-top-links navbar-right">
        <!-- 用户栏 -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i><?php echo get_username();?>  <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="<?php echo U('User/updateNickname');?>"><i class="fa fa-user fa-fw"></i> 修改昵称</a>
                </li>
                <li><a href="<?php echo U('User/updatePassword');?>"><i class="fa fa-gear fa-fw"></i> 修改密码</a>
                </li>
                <li class="divider"></li>
                <li><a href="<?php echo U('Public/logout');?>"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                </li>
            </ul><!-- /.dropdown-user -->
        </li><!-- /.dropdown -->
    </ul><!-- /.navbar-top-links -->
</nav><!-- /.navbar-static-top -->
<!--  /导航条结束点   ================================================== -->  
  	
<nav class="navbar-default navbar-static-side" role="navigation">
<div class="sidebar-collapse">
  <ul class="nav" id="side-menu">
    
    <li id="subnav" class="active" >
      <?php if(!empty($_extra_menu)): ?>
        <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
      <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i; if(!empty($sub_menu)): if(!empty($key)): ?><a href="#"><h3><i class="fa fa-sitemap fa-fw"></i><?php echo ($key); ?></h3><span class="fa arrow"></span></a><?php endif; ?>
        <ul class="nav nav-second-level">
            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="" >											
                <a href="<?php echo (U($menu["url"])); ?>"><i class="fa fa-table fa-fw"></i>&nbsp;&nbsp;<?php echo ($menu["title"]); ?></a>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul><?php endif; endforeach; endif; else: echo "" ;endif; ?>
    </li> 
    
  </ul> 
</div>
</nav>

  <div id="page-wrapper"> 
  <div class="row"> 
    <div id="main" class="col-lg-12 main">
      
      <?php if(!empty($_show_nav)): ?><!-- nav -->
      <div class="breadcrumb">
        <span>您的位置:</span>
        <?php $i = '1'; ?>
        <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
            <?php else: ?>
            <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
            <?php $i = $i+1; endforeach; endif; ?>
      </div><!-- /nav --><?php endif; ?>
             
      
	<div class="main-title cf">
		<h2><?php if(ACTION_NAME == 'add'): ?>新增<?php else: ?>编辑<?php endif; ?>模型</h2>
	</div>
    
    <div class="panel panel-default">
	<!-- 标签页导航 -->
    <div class="tab-wrap panel-body">
        <ul class="nav nav-tabs ">
            <li data-tab="tab1" class="active"><a href="#tab1" data-toggle="tab">基 础</a></li>
            <li data-tab="tab2"><a href="#tab2" data-toggle="tab">设 计</a></li>
            <li data-tab="tab3"><a href="#tab3" data-toggle="tab">高 级</a></li>
        </ul>
        <div class="row">
            <div class="col-lg-6">              
        <!-- 表单 -->
        <form id="form" action="<?php echo U('update');?>" method="post" class="form doc-modal-form" role="form" >
        <div class="tab-content panel-body">
            <!-- 基础 -->
            <div id="tab1" class="tab-pane fade in active" >
                <div class="form-group">
                    <label class="item-label">模型标识<span class="check-tips">（请输入文档模型标识）</span></label> 
                    <input type="text" class="form-control" name="name" value="<?php echo ($info["name"]); ?>">
 
                </div>
                <div class="form-group">
                    <label class="item-label">模型名称<span class="check-tips">（请输入模型的名称）</span></label> 
                    <input type="text" class="form-control" name="title" value="<?php echo ($info["title"]); ?>">  
                </div>
                <div class="form-group">
                    <label class="item-label">模型类型<span class="check-tips">（目前支持独立模型和文档模型）</span></label> 
                    <select name="extend" class="form-control">
                        <option value="0">独立模型</option>
                        <option value="1">文档模型</option>
                    </select> 
                </div>
            </div>

            <div id="tab2" class="tab-pane  fade tab2">
                <div class="form-group">
                    <label class="item-label">字段管理<span class="check-tips">（只有新增了字段，该表才会真正建立）</span></label> 
                    <div class="  ">
                        <span>字段列表 		[ <a href="<?php echo U('Attribute/add?model_id='.$info['id']);?>" target="_balnk">新增</a>
                        <a href="<?php echo U('Attribute/index?model_id='.$info['id']);?>" target="_balnk">管理</a> ] </span>
                        <ul class=" ">
                            <?php if(is_array($fields)): foreach($fields as $k=>$field): ?><li >
                                        <em ><?php echo ($field['title']); ?> [<?php echo ($field['name']); ?>]</em>
                                    </li><?php endforeach; endif; ?>
                        </ul>
                    </div>
 
                </div>
                <div class="form-group">
                    <label class="item-label">表单显示分组<span class="check-tips">（用于表单显示的分组，以及设置该模型表单排序的显示）</span></label> 
                    <input type="text" class="form-control" name="field_group" value="<?php echo ($info["field_group"]); ?>"> 
                </div>
                <div class="form-group">
                <label class="item-label">表单显示排序<span class="check-tips">（直接拖动进行排序）</span></label>
                <?php $_result=parse_field_attr($info['field_group']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class=" ">
                        <span><?php echo ($vo); ?></span>
                        <ul class=" " data-group="<?php echo ($key); ?>">
                            <?php if(is_array($fields)): foreach($fields as $k=>$field): if((($field['group'] == $key) or($i == 1 and !isset($field['group']))) and ($field['is_show'] == 1)): ?><li class="getSort">
                                        <em data="<?php echo ($field['id']); ?>"><?php echo ($field['title']); ?> [<?php echo ($field['name']); ?>]</em>
                                        <input type="hidden" name="field_sort[<?php echo ($key); ?>][]" value="<?php echo ($field['id']); ?>"/>
                                    </li><?php endif; endforeach; endif; ?>
                        </ul>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>

                <div class="form-group">
                    <label class="item-label">列表定义<span class="check-tips">（默认列表模板的展示规则）</span></label>  
                    <textarea name="list_grid" class="form-control"><?php echo ($info["list_grid"]); ?></textarea>  
                </div>
                <div class="form-group">
                    <label class="item-label">默认搜索字段<span class="check-tips">（默认列表模板的默认搜索项）</span></label> 
                    <input type="text" class="form-control" name="search_key" value="<?php echo ($info["search_key"]); ?>"> 
                </div>
                <div class="form-group">
                    <label class="item-label">高级搜索字段<span class="check-tips">（默认列表模板的高级搜索项）</span></label> 
                    <input type="text" class="form-control" name="search_list" value="<?php echo ($info["search_list"]); ?>"> 
                </div>
            </div>

            <!-- 高级 -->
            <div id="tab3" class="tab-pane fade tab3">
                <div class="form-group">
                    <label class="item-label">列表模板<span class="check-tips">（自定义的列表模板，放在Application\Admin\View\Think下，不写则使用默认模板）</span></label>      
                    <input type="text" class="form-control" name="template_list" value="<?php echo ($info["template_list"]); ?>">        
                </div>
                <div class="form-group">
                    <label class="item-label">新增模板<span class="check-tips">（自定义的新增模板，放在Application\Admin\View\Think下，不写则使用默认模板）</span></label>       
                    <input type="text" class="form-control" name="template_add" value="<?php echo ($info["template_add"]); ?>">         
                </div>
                <div class="form-group">
                    <label class="item-label">编辑模板<span class="check-tips">（自定义的编辑模板，放在Application\Admin\View\Think下，不写则使用默认模板）</span></label>           
                    <input type="text" class="form-control" name="template_edit" value="<?php echo ($info["template_edit"]); ?>">          
                </div>
                <div class="form-group">
                    <label class="item-label">列表数据大小<span class="check-tips">（默认列表模板的分页属性）</span></label>           
                    <input type="text" class="text form-control" name="list_row" value="<?php echo ($info["list_row"]); ?>">               
                </div>
            </div>
        
            <!-- 按钮 -->
            <div class="form-group">
                <label class="item-label"></label>
                <div class="edit_sort_btn">
                    <input type="hidden" name="id" value="<?php echo ($info['id']); ?>"/>
                    <button class="btn btn-default submit-btn ajax-post no-refresh" type="submit" target-form="form">确 定</button>
                    <button class="btn btn-default btn-return" onclick="javascript:history.back(-1);return false;">返 回</button>
                </div>
            </div>  
        </div>
        </form>		
            </div><!--  /div class="col-lg-6" -->
        </div><!-- /row -->
    </div>
    </div><!-- /panel-body -->
 
    </div>  
  </div>
</div>		  
    <!--  页脚，版权信息   ================================================== -->     
  <footer class="bs-footer" role="contentinfo">
	<div class="container">	  
		<p> 本站由 <strong><a href="http://www.thinkphp.cn" target="_blank">Think 3.2.1</a></strong> 强力驱动</p>
	</div>
  </footer>
  <!--  /页脚，版权信息   ================================================== -->  

  <div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
	
  </div>
</div>    
  
<!-- Core Scripts - Include with every page -->
<script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script> 
<script type="text/javascript" src="/Public/Admin/js/sb/bootstrap.min.js"></script> 
<!-- Page-Level Plugin Scripts - 侧边栏 -->
<script type="text/javascript" src="/Public/Admin/js/sb/plugins/metisMenu/jquery.metisMenu.js"></script> 
<!-- 弹出提示框，ajax用 js -->
<script type="text/javascript" src="/Public/Admin/js/sb/plugins/messenger/messenger.js"></script> 
<script type="text/javascript" src="/Public/Admin/js/sb/plugins/messenger/messenger-theme-future.js"></script> 
<!-- Page-Level Plugin Scripts - Tables 表格-->
<script type="text/javascript" src="/Public/Admin/js/sb/plugins/dataTables/jquery.dataTables.js"></script> 
<script type="text/javascript" src="/Public/Admin/js/sb/plugins/dataTables/dataTables.bootstrap.js"></script> 

<!-- SB Admin Scripts - Include with every page -->
<script type="text/javascript" src="/Public/Admin/js/sb/sb-admin.js"></script>

<!-- Page-Level Demo Scripts - Blank - Use for reference -->

<!--  think JS   ================================================== --> 
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
<script type="text/javascript" src="/Public/Admin/js/sb/think.js"></script>
<script type="text/javascript" src="/Public/Admin/js/sb/think_ajax.js"></script>
<!--include file="Public/navjs"/-->


<script type="text/javascript" src="/Public/static/jquery.dragsort-0.5.1.min.js"></script>
<script type="text/javascript" charset="utf-8">
Think.setValue("extend", <?php echo ((isset($info["extend"]) && ($info["extend"] !== ""))?($info["extend"]):0); ?>);

//导航高亮
highlight_subnav('<?php echo U('Model/index');?>');

 
//拖曳插件初始化
$(function(){
	$(".needdragsort").dragsort({
	     dragSelector:'li',
	     placeHolderTemplate: '<li class="draging-place">&nbsp;</li>',
	     dragBetween:true,	//允许拖动到任意地方
	     dragEnd:function(){
	    	 var self = $(this);
	    	 self.find('input').attr('name', 'field_sort[' + self.closest('ul').data('group') + '][]');
	     }
	 });
})
</script>
 
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>
</body>
</html>