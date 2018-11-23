<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Page;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ArticleController extends HomeController {

    /* 文档模型频道页 */
	public function index(){
//	    echo 1;exit;
		/* 分类信息 */
		$category = $this->category();

		//频道页只显示模板，默认不读取任何内容
		//内容可以通过模板标签自行定制

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->display($category['template_index']);
	}

	/* 文档模型列表页 */
	public function lists($p = 1){
		/* 分类信息 */
		$category = $this->category();
		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
		$this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0, $p = 1){
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}

		/* 页码检测 */
		$p = intval($p);
		$p = empty($p) ? 1 : $p;

		/* 获取详细信息 */
		$Document = D('Document');

        $info = $Document->detail($id);

        if(!$info){
			$this->error($Document->getError());
		}

		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}
		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');
//		var_dump($p);exit;
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
        $this->display($tmpl);
	}

	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}

		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}

    /* 资讯文档模型频道页 */
    public function information(){
//	    echo 1;exit;
        /* 分类信息 */
        $category = $this->information_cate();
//        var_dump($category);exit;

        //频道页只显示模板，默认不读取任何内容
        //内容可以通过模板标签自行定制

        /* 模板赋值并渲染模板 */
//        var_dump($category);exit;
        $this->assign('category', $category);
        $this->display($category['template_index']);
    }

    /* 资讯文档分类检测 */
    private function information_cate($id = 0){
        /* 标识正确性检测 */
        $id = $id ? $id : I('get.category', 0);
        if(empty($id)){
            $this->error('没有指定文档分类！');
        }

        /* 获取分类信息 */
        $category = D('Category')->info($id);
        if($category && 1 == $category['status']){
            switch ($category['display']) {
                case 0:
                    $this->error('该分类禁止显示！');
                    break;
                //TODO: 更多分类显示状态判断
                default:
                    return $category;
            }
        } else {
            $this->error('分类不存在或被禁用！');
        }
    }

    /* 文章类文档模型列表页 */
    public function recruit($p = 1){
        /* 分类信息 */
        $category = $this->category();
        /* 获取当前分类列表 */
        $Document = D('Document');
        $list = $Document->page($p, $category['list_row'])->lists($category['id']);
        if(false === $list){
            $this->error('获取列表数据失败！');
        }
        foreach ($list as $key=>$val){
            $detail[] = D('document_recruit')
                ->alias('r')
                ->field('d.create_time,r.list_title,r.duty,r.demand')
                ->join('one_document AS d ON  r.id=d.id')
                ->where(['d.id'=>$val['id']])
                ->find();
            /*列表背景图*/
            $img_id = $detail[0]['detail_img'];
            $Photo = D('Picture');
            $list_img_info = $Photo->where(['id' => $img_id])->find();
            $list[$key] += ['list_images' => $list_img_info['path']];
            $list[$key] += ['time' => $val['create_time']];
            $list[$key] += ['detail' => $detail['article']];
        }

        /* 查分类 */
        $cate_name = D('category')
            ->where(['id'=>$category['pid']])
            ->select();

        $current = $this->page_nav($category,1);
        $top_cate = D('category')
            ->field('id,title')
            ->where(['pid'=>54])
            ->select();
        /* 模板赋值并渲染模板 */
        $this->assign('f_cate_id', $category['pid']);
        $this->assign('f_cate', $current['father']);
        $this->assign('g_cate', $current['g_father']);
        $this->assign('current_cate', $current['cate_name']);
        $this->assign('category', $category);
        $this->assign('top_cate', $top_cate);
        $this->assign('cate_name', $cate_name);
        $this->assign('list', $list);
        $this->assign('detail', $detail);
        $this->display($category['template_lists']);
    }

    /*
     * 判断是否是pjax请求
     * */
//    protected function is_pjax(){
//        $input = $_GET;
////        var_dump($input);exit;
//        if(isset($input['pjax']) && !empty($input['pjax'])){
//            return true;//是pjax请求
//        }else{
//            return false;//不是pjax请求
//        }
//    }

    /* 医院类文档模型列表页 */
    public function hospital_lists($id,$p = 1){
        /* 分类信息 */
//        $category = $this->category();
//        var_dump($category['list_row']);exit;
        /* 获取当前分类列表 */
        $Document = D('Document');
        $cate = $Document
            ->field('id,title,category_id')
            ->where(['id'=>$id])
            ->find();
        $my_cate = D('category')
//            ->field('id,title')
            ->where(['pid'=>$cate['category_id']])
            ->find();
        $page = new \Think\Page(count($list),6);

        $list = $Document
            ->where(['category_id'=>$my_cate['id'],'status'=>1])
            ->order('id asc')
            ->limit($page->firstRow.','.$page->listRows)
            ->select();
        foreach ($list as $key=>$val){
            $detail = D('document_hospital_details')
                ->field('article,list_img,abstract')
                ->where(['id'=>$val['id']])
                ->find();
//            var_dump($detail);exit;
            /*列表背景图*/
            $img_id = $detail['list_img'];
            $Photo = D('Picture');
            $list_img_info = $Photo->where(['id' => $img_id])->find();
//            $article = mb_substr($detail['article'],0,30,"UTF-8");
            $list[$key] += ['list_images' => $list_img_info['path'],'abstract'=>$detail['abstract']];
        }

        $hospital_list = D('document_model')
            ->where(['id'=>130])
            ->find();


        $pic = D('picture');
        $list_img_info = $pic
            ->field('path')
            ->where(['id' => $hospital_list['banner_img']])
            ->find();

        $list_info = D('document_third_list')
            ->where(['id'=>$id])
            ->find();
        $list_banner = D('picture')
            ->field('path')
            ->where(['id'=>$list_info['list_img']])
            ->find();

        if(false === $list){
            $this->error('获取列表数据失败！');
        }
        $current = $this->page_nav($my_cate,1);
        $page->setConfig('prev','上一页');
        $page->setConfig('next','下一页');
        $show = $page->show();

        /* 模板赋值并渲染模板 */
        $this->assign('f_cate', $current['father']);
        $this->assign('g_cate', $current['g_father']);
        $this->assign('current_cate', $current['cate_name']);
        $this->assign('banner', $list_banner['path']);
        $this->assign('back_img', $list_img_info['path']);
        $this->assign('category', $my_cate);
        $this->assign('list', $list);
        $this->assign('list_info', $list_info);
        $this->assign('page', $show);
        $this->display('hospital_lists');//返回pjax的模板
    }

    /* 文章类文档模型列表页 */
    public function article_lists($list_row=6){
//        $list_row = I('post.list_row',6,'int');
        $p = I('post.page',1,'int');;
        /* 分类信息 */
        $category = $this->category();
        /* 获取当前分类列表 */
        $Document = D('Document');
        $count = $Document->where(['category_id'=>$category['id']])->count();
        $list = $Document
            ->where(['status'=>1])
            ->page($p, $list_row)
            ->lists($category['id']);

//        $test = $Document
//            ->where(['status'=>1])
//            ->page(2, $list_row)
//            ->lists($category['id']);
//        var_dump($test);exit;

        if(false === $list){
            $this->error('获取列表数据失败！');
        }
        $Photo = D('Picture');
        foreach ($list as $key=>$val){
            $detail = D('document_article_details')
                ->field('detail_img,sub_title')
                ->where(['id'=>$val['id']])
                ->select();
            /*列表背景图*/
            $img_id = $detail[0]['detail_img'];
            $list_img_info = $Photo->where(['id' => $img_id])->find();
            $time = date('Y-m-d',$val['create_time']);
            $list[$key] += ['list_images' => $list_img_info['path'],'synopsis'=>$detail[0]['sub_title']];
            $list[$key]['create_time'] = $time;
            $list[$key]['count'] = $count;
        }
        /* 查分类 */
        $cate_name = D('category')
            ->where(['id'=>$category['pid']])
            ->select();
        $current = $this->page_nav($category,2);

        $top_img_info = D('document_fifth_list')
            ->where(['list_title'=>$current['father']['title']])
            ->getField('list_img');
        if (!empty($top_img_info)){
            $top_img = $Photo->where(['id' => $top_img_info])->find();
            $this->assign('top_img', $top_img);
        }

        /* 模板赋值并渲染模板 */
        $this->assign('f_cate', $current['father']);
        $this->assign('g_cate', $current['g_father']);
        $this->assign('current_cate', $current['cate_name']);
        $this->assign('category', $category);
        $this->assign('cate_name', $cate_name);
        $this->assign('list', $list);
        if (IS_AJAX){
            $this->ajaxReturn(['status'=>1,'msg'=>$msg,'data'=>$list]);
        }
        $this->display($category['template_lists']);
    }


    public function hospital_detail($id,$next_title){
        $document = D('document');
        $from = $document->where(['id'=>$id])->select();
        $type = $from[0]['type'];
        $table = "document_hospital_details";
        $db = D($table);
        $detail = $db->where(['id'=>$id])->find();

        $doctor = D('document_doc')
            ->alias('c')
            ->field('c.id,c.list_title,c.position,c.seniority,c.expertise,c.hospital,c.sort,doc_img')
            ->join('one_document as d ON c.id = d.id')
            ->where(['c.hospital'=>$id,'d.status'=>1])
            ->order('c.sort asc')
            ->select();
        foreach ($doctor as $key=>$val){
            $pic = D('Picture')->where(['id'=>$val['doc_img']])->find();
            $doctor[$key]['path'] = $pic['path'];
//            $seniority = (string)$val['seniority'];
            $doctor[$key]['seniority'] = htmlspecialchars_decode($val['seniority']);
            $doctor[$key]['expertise'] = htmlspecialchars_decode($val['expertise']);
        }

        $tech_img = json_decode($detail['tech_img'],true);
        $ambient_img = json_decode($detail['ambient_img'],true);
        $amb_img = array_chunk($ambient_img, 4);

        /* 查图片 */
        $pic = D('picture');
        $picture = $pic->where(['id'=>$detail['detail_img']])->find();
        $photo_path = $picture['path'];

        /* 查视频预览图片 */
        $pic = D('picture');
        $video_img = $pic->where(['id'=>$detail['video_img']])->find();
        /* 查视频 */
        $vid = D('file');
        $video = $vid->where(['id'=>$detail['video']])->find();
        $video_path = "Uploads/Download/".$video['savepath'].$video['savename'];

        /* 更新浏览数 */
        $map = array('id' => $id);
        $document->where($map)->setInc('view');
        $current = $this->nav_page($id);
//        var_dump($current['father']);exit;

        $this->assign('this', $current['this']);
        $this->assign('f_cate', $current['father']);
        $this->assign('g_cate', $current['g_father']);
        $this->assign('current_cate', $current['cate_name']);
        $this->assign('detail',$detail);
        $this->assign('next_title',$next_title);
        $this->assign('picture',$photo_path);//图片
        $this->assign('video',$video_path);//视频
        $this->assign('video_img',$video_img);//视频
        $this->assign('doctor',$doctor);//医生详情
        $this->assign('tech_img',$tech_img);//科技图片
        $this->assign('ambient_img',$amb_img);//环境图片
        $this->display('hospital_details');
    }

    public function list_detail($id,$detail_type){
        $document = D('document');
        $from = $document->where(['id'=>$id])->find();
        $type = $from['type'];
//        var_dump($type);exit;
        if (isset($detail_type)){
            if ($detail_type == 1){
                $table = "document_article_details";
            }else{
                $table = "document_hospital_details";
            }
        }
        $db = D($table);
        $detail = $db->where(['id'=>$id])->select();
        $pic = D('picture');
        $picture = $pic->where(['id'=>$detail[0]['detail_img']])->select();
        $photo_path = $picture[0]['path'];

        /* 更新浏览数 */
        $map = array('id' => $id);
        $document->where($map)->setInc('view');

        $current = $this->nav_page($id);

        $category = D('document')
            ->alias('d')
            ->field('c.id,d.create_time,d.view')
            ->join('one_category c ON d.category_id=c.id')
            ->where(['d.id'=>$from['id'],'d.status'=>1])
            ->find();

        $left = D($table)
            ->alias('d')
            ->field('d.id,d.list_title')
            ->join('one_document c ON c.id=d.id')
            ->where('d.id > '.$from['id'].' AND c.category_id = '.$category['id'])
            ->find();

        $right = D($table)
            ->alias('d')
            ->field('d.id,d.list_title')
            ->join('one_document c ON c.id=d.id')
            ->where('d.id < '.$from['id'].' AND c.category_id = '.$category['id'])
            ->order('d.id desc')
            ->find();

        $this->assign('left', $left);
        $this->assign('right', $right);
        $this->assign('time', $category);
        $this->assign('this', $current['this']);
        $this->assign('f_cate', $current['father']);
        $this->assign('g_cate', $current['g_father']);
        $this->assign('current_cate', $current['cate_name']);
        $this->assign('detail',$detail);
        $this->assign('picture',$photo_path);
        if ($type == 2){
            $this->display('article_details');
        }else{
            $this->display('hospital_details');
        }
    }

    public function company($id){
//        var_dump($id);
//        $fourth = D('Document')->home(4,48,1);
        $table = "document_article_details";
        $db = D($table);
        $detail = $db->where(['id'=>$id])->select();
        if (count($detail) == 0){
            $detail = D('document_fourth_list')
                ->where(['id'=>$id])
                ->select();
        }

        $list = D('document_model')
            ->where(['id'=>131])
            ->find();

        /*列表背景图*/
        $pic = D('picture');
        $picture = $pic->where(['id'=>$detail[0]['list_img']])->select();
        $photo_path = $picture[0]['path'];
        $list_img_info = $pic
            ->field('path')
            ->where(['id' => $list['banner_img']])
            ->find();

        /* 更新浏览数 */
        $document = D('document');
        $map = array('id' => $id);
        $document->where($map)->setInc('view');
        $current = $this->nav_page($id);
//        /* 查分类 */
        $info = D('document')
            ->where($map)
            ->find();
        $eq_cate = D('category')
            ->where(['id'=>$info['category_id']])
            ->find();
        $f_cate = D('category')
            ->field('title,id')
            ->where(['pid'=>$eq_cate['pid']])
            ->select();

        foreach ($f_cate as $key=>$va){
            $com_id = D('document')
                ->field('id')
                ->where(['category_id'=>$va['id']])
                ->find();
//            var_dump($com_id);exit;
            $f_cate[$key]['id'] = $com_id['id'];
        }

        $current['eq_cate'] = $f_cate;
        $this->assign('current_cate', $current['eq_cate']);
        $this->assign('this', $current['this']);
        $this->assign('f_cate', $current['father']);
        $this->assign('detail',$detail);//栏目
        $this->assign('picture',$photo_path);//栏目
        $this->assign('back_img',$list_img_info['path']);
//        $this->display('list_detail');
        $this->display('company');
    }

    public function company_info($id){
        $table = "document_article_details";
        $db = D($table);
        $detail = $db->where(['id'=>$id])->find();
        $list = D('document_model')
            ->where(['id'=>129])
            ->find();
        /*列表背景图*/
        $pic = D('picture');
        $picture = $pic->where(['id'=>$detail['bk_img']])->select();
        $photo_path = $picture[0]['path'];
        $list_img_info = $pic
            ->field('path')
            ->where(['id' => $list['banner_img']])
            ->find();

        /* 更新浏览数 */
        $document = D('document');
        $map = array('id' => $id);
        $document->where($map)->setInc('view');
        $current = $this->nav_page($id);
//        /* 查分类 */
        $info = D('document')
            ->where($map)
            ->find();
        $eq_cate = D('category')
            ->where(['id'=>$info['category_id']])
            ->find();
        $f_cate = D('category')
            ->field('title,id')
            ->where(['pid'=>$eq_cate['pid']])
            ->select();

        foreach ($f_cate as $key=>$va){
            $com_id = D('document')
                ->field('id')
                ->where(['category_id'=>$va['id']])
                ->find();
//            var_dump($com_id);exit;
            $f_cate[$key]['id'] = $com_id['id'];
        }

        $second = D('Document')->home(2,46,1);
        $this->assign('second',$second);//列表
        $current['eq_cate'] = $f_cate;
        $this->assign('current_cate', $current['eq_cate']);
        $this->assign('id', $id);
        $this->assign('this', $current['this']);
        $this->assign('f_cate', $current['father']);
        $this->assign('detail',$detail);//栏目
        $this->assign('picture',$photo_path);//栏目
        $this->assign('back_img',$list_img_info['path']);
//        $this->display('list_detail');
        $this->display('company_info');
    }

    public function contact($id){
//        var_dump($id);exit;
        /* 分类信息 */
//        $category = $this->category();
        $document = D('document');
        $from = $document->where(['id'=>$id])->find();
        $type = $from[0]['type'];
//        var_dump($from['category_id']);exit;

        $table = "document_contact_us";
        $db = D($table);
        $detail = $db->where(['id'=>$id])->select();
//        var_dump($detail);exit;
        $pic = D('picture');
        $picture = $pic->where(['id'=>$detail[0]['company_img']])->select();
        $photo_path = $picture[0]['path'];
        $current = $this->nav_page($id);

        $current_cate = D('category')
            ->field('id,title,name')
            ->where(['pid'=>$current['father']['id']])
            ->select();
//        var_dump($current);
//        foreach ($current_cate as $key=>$val){
//            var_dump($val);exit;
//            $currents = D('document')
//                ->field('id')
//                ->where(['category_id'=>$val['id']])
//                ->find();
//            $p_current = D('category')
//                ->alias('c')
//                ->field('c.id,c.name')
//                ->join('join one_document AS d ON d.category_id=c.id')
//                ->where(['c.pid'=>54])
//                ->find();
//
//            $current_cate['cate_name'] = $p_current['name'];
//            $current_cate['cate_id'] = $currents['id'];
//        }


        /* 更新浏览数 */
        $map = array('id' => $id);
        $document->where($map)->setInc('view');
        $this->assign('this', $current['this']);
        $this->assign('f_cate', $current['father']);
        $this->assign('g_cate', $current['g_father']);
        $this->assign('current_cate', $current_cate);
        $this->assign('detail',$detail);//栏目
//        $this->assign('next_title',$next_title);//栏目
        $this->assign('picture',$photo_path);//栏目
//        $this->display('list_detail');
        $this->display('contact');
    }

    /* 小导航 */
    public function page_nav($category,$type){
//        var_dump($type);exit;
        /* 获取当前分类的父以上所有分类 */
        $pid = $category['pid'];
        $f_cate = D('category')
            ->field('id,title,name,pid')
            ->where(['id'=>$pid])
            ->select();

        $g_cate = D('category ')
            ->field('id,title,name')
            ->where(['id'=>$f_cate[0]['pid']])
            ->select();

        $current_cate = D('category ')
            ->field('id,title,name')
            ->where(['pid'=>$f_cate[0]['pid']])
            ->select();
        foreach ($current_cate as $key=>$val){
            $current = D('document')
                ->where(['category_id'=>$val['id']])
                ->find();
            $p_current = D('category')
                ->alias('c')
                ->field('c.id,c.name')
                ->join('join one_document AS d ON d.category_id=c.id')
                ->where(['c.pid'=>$val['id']])
                ->find();

            if ($type == 1){
                $current_cate[$key]['cate_name'] = $p_current['name'];
                $current_cate[$key]['cate_id'] = $current['id'];
            }else{
                $current_cate[$key]['cate_name'] = $p_current['name'];
            }
        }
        return array('father'=>$f_cate[0],'g_father'=>$g_cate[0],'cate_name'=>$current_cate);
    }

    /* 小导航 */
    public function nav_page($id){
        /* 获取当前分类的父以上所有分类 */
        $this_cate = D('document')
            ->alias('d')
            ->field('d.title,d.category_id,c.id,c.title,c.name,c.pid')
            ->join('join one_category AS c ON c.id=d.category_id')
            ->where(['d.id'=>$id])
            ->find();

        $the_cate = D('document')
            ->field('title,id')
            ->where(['id'=>$id])
            ->find();
//        var_dump($the_cate);exit;

        $f_cate = D('category')
            ->field('id,title,name,pid')
            ->where(['id'=>$this_cate['pid']])
            ->find();

        $g_cate = D('category')
            ->field('id,title,name')
            ->where(['id'=>$f_cate['pid']])
            ->find();

        $current_cate = D('category')
            ->field('id,title,name')
            ->where(['pid'=>$f_cate['pid']])
            ->select();
//        var_dump($f_cate);exit;

        foreach ($current_cate as $key=>$val){
            $current = D('document')
                ->field('id')
                ->where(['category_id'=>$val['id']])
                ->find();
            $p_current = D('category')
                ->alias('c')
                ->field('c.id,c.name')
                ->join('join one_document AS d ON d.category_id=c.id')
                ->where(['c.pid'=>$val['id']])
                ->find();

//            var_dump($current);exit;

            $current_cate[$key]['cate_name'] = $p_current['name'];
            $current_cate[$key]['cate_id'] = $current['id'];
//            if ($type == 1){
//                $current_cate[$key]['cate_name'] = $p_current['name'];
//                $current_cate[$key]['cate_id'] = $current['id'];
//            }else{
//                $current_cate[$key]['cate_name'] = $p_current['name'];
//            }
        }
        return array('this'=>$the_cate,'father'=>$f_cate,'g_father'=>$g_cate,'cate_name'=>$current_cate);
    }

    public function video_view($id){
//        $time = +1;
        if ($id){
            $add_time = D('document')
                ->where(['id'=>$id])
                ->setInc('view');
            if ($add_time){
                $time = D('document')
                    ->field('view')
                    ->where(['id'=>$id])
                    ->find();
            }
        }
        $this->ajaxReturn($time);
    }
}
