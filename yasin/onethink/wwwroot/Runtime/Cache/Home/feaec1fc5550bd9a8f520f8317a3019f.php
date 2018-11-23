<?php if (!defined('THINK_PATH')) exit(); if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="new_item_box clearfix mor_ajx" data-p="6" data-max="<?php echo ($count); ?>">
		<a href="<?php echo U('Article/list_detail?id='.$data['id'].'&detail_type=1');?>" class="float_left"><img src="<?php echo ($data['list_images']); ?>" alt=""></a>
		<div class="item_right float_left">
			<h1><a href="<?php echo U('Article/list_detail?id='.$data['id'].'&detail_type=1');?>">标题：<?php echo ($data["title"]); ?>...</a></h1>
			<p class="icon_item clearfix">
				<span class="float_left clearfix"><img class="float_left time_icon" src="/Public/static/yasin/new_imgs/time_icon.png" alt=""><i class="float_left">上传时间：<em><?php echo (date('Y.m.d',$data["create_time"])); ?></em></i></span>
				<span class="float_left clearfix"><img class="float_left eye_icon" src="/Public/static/yasin/new_imgs/eye_icon.png" alt=""><i class="float_left">浏览量：<em><?php echo ($data["view"]); ?></em>次</i></span>
			</p>
			<span class="new_text"><?php echo ($data["synopsis"]); ?>...</span>
			<a href="<?php echo U('Article/list_detail?id='.$data['id'].'&detail_type=1');?>" class="info_link"><span>查看详情</span><img src="/Public/static/yasin/new_imgs/next_icon.png" alt=""></a>
		</div>
	</div><?php endforeach; endif; else: echo "" ;endif; ?>