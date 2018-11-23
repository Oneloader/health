<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){
        $category = D('Category')->getTree();
        $lists    = D('Document')->lists(null);
        $first = D('Document')->home(1,42,1);
        $second = D('Document')->home(2,46,1);
        $third = D('Document')->home(3,41,1);
        $fourth = D('Document')->home(4,48,1);
        $fifth = D('Document')->home(5,50,1);
        $sixth = D('Document')->home(6,54,1);
//        var_dump($sixth);exit;

        $this->assign('category',$category);//栏目
        $this->assign('lists',$lists);//列表
        $this->assign('first',$first);//列表
        $this->assign('second',$second);//列表
        $this->assign('third',$third);//列表
        $this->assign('fourth',$fourth);//列表
        $this->assign('fifth',$fifth);//列表
        $this->assign('sixth',$sixth);//列表
        $this->assign('page',D('Document')->page);//分页

        $this->display();
    }

}