<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Model;
use Admin\Controller\DatabaseController;
use Think\Model;
use Think\Page;

/**
 * 文档基础模型
 */
class DocumentModel extends Model{

    /* 自动验证规则 */
    protected $_validate = array(
        array('name', '/^[a-zA-Z]\w{0,30}$/', '文档标识不合法', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
        array('name', '', '标识已经存在', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
        array('title', 'require', '标题不能为空', self::VALUE_VALIDATE, 'regex', self::MODEL_BOTH),
        array('category_id', 'require', '分类不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_INSERT),
        array('category_id', 'require', '分类不能为空', self::EXISTS_VALIDATE , 'regex', self::MODEL_UPDATE),
        array('category_id,type', 'check_category', '内容类型不正确', self::MUST_VALIDATE , 'function', self::MODEL_INSERT),
        array('category_id', 'check_category', '该分类不允许发布内容', self::EXISTS_VALIDATE , 'function', self::MODEL_BOTH),
        array('model_id,category_id,pid', 'check_category_model', '该分类没有绑定当前模型', self::MUST_VALIDATE , 'function', self::MODEL_INSERT),
    );

    /* 自动完成规则 */
    protected $_auto = array(
        array('uid', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid'),
        array('title', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
        array('description', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
        array('root', 'getRoot', self::MODEL_BOTH, 'callback'),
        array('attach', 0, self::MODEL_INSERT),
        array('view', 0, self::MODEL_INSERT),
        array('comment', 0, self::MODEL_INSERT),
        array('extend', 0, self::MODEL_INSERT),
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        //array('reply_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
        array('status', 'getStatus', self::MODEL_BOTH, 'callback'),
    );

    public $page = '';

    /**
     * 获取文档列表
     * @param  integer  $category 分类ID
     * @param  string   $order    排序规则
     * @param  integer  $status   状态
     * @param  boolean  $count    是否返回总数
     * @param  string   $field    字段 true-所有字段
     * @return array              文档列表
     */
    public function lists($category, $order = '`id` DESC', $status = 1, $field = true){
        $map = $this->listMap($category, $status);

        return $this->field($field)->where($map)->order($order)->select();
    }

    /**
     * 计算列表总数
     * @param  number  $category 分类ID
     * @param  integer $status   状态
     * @return integer           总数
     */
    public function listCount($category, $status = 1){
        $map = $this->listMap($category, $status);
        return $this->where($map)->count('id');
    }

    /**
     * 获取详情页数据
     * @param  integer $id 文档ID
     * @return array       详细数据
     */
    public function detail($id){
        /* 获取基础数据 */
        $info = $this->field(true)->find($id);
        if ( !$info ) {
            $this->error = '文档不存在';
            return false;
        }elseif(!(is_array($info)) || 1 != $info['status']){
            $this->error = '文档被禁用或已删除！';
            return false;
        }
        /* 获取模型数据 */
        $logic  = $this->logic($info['model_id']);
        $detail = $logic->detail($id); //获取指定ID的数据
        if(!$detail){
            $this->error = $logic->getError();
            return false;
        }
        return array_merge($info, $detail);
    }

    /**
     * 返回前一篇文档信息
     * @param  array $info 当前文档信息
     * @return array
     */
    public function prev($info){
        $map = array(
            'id'          => array('lt', $info['id']),
            'pid'		  => 0,
            'category_id' => $info['category_id'],
            'status'      => 1,
            'create_time' => array('lt', NOW_TIME),
            '_string'     => 'deadline = 0 OR deadline > ' . NOW_TIME,  			
        );

        /* 返回前一条数据 */
        return $this->field(true)->where($map)->order('id DESC')->find();
    }

    /**
     * 获取下一篇文档基本信息
     * @param  array    $info 当前文档信息
     * @return array
     */
    public function next($info){
        $map = array(
            'id'          => array('gt', $info['id']),
            'pid'		  => 0,
            'category_id' => $info['category_id'],
            'status'      => 1,
            'create_time' => array('lt', NOW_TIME),
            '_string'     => 'deadline = 0 OR deadline > ' . NOW_TIME,  			
        );

        /* 返回下一条数据 */
        return $this->field(true)->where($map)->order('id')->find();
    }

    public function update(){
        /* 检查文档类型是否符合要求 */
        $Model = new \Admin\Model\DocumentModel();
        $res = $Model->checkDocumentType( I('type'), I('pid') );
        if(!$res['status']){
            $this->error = $res['info'];
            return false;
        }

        /* 获取数据对象 */
        $data = $this->field('pos,display', true)->create();
        if(empty($data)){
            return false;
        }

        /* 添加或新增基础内容 */
        if(empty($data['id'])){ //新增数据
            $id = $this->add(); //添加基础内容

            if(!$id){
                $this->error = '添加基础内容出错！';
                return false;
            }
            $data['id'] = $id;
        } else { //更新数据
            $status = $this->save(); //更新基础内容
            if(false === $status){
                $this->error = '更新基础内容出错！';
                return false;
            }
        }

        /* 添加或新增扩展内容 */
        $logic = $this->logic($data['model_id']);
        if(!$logic->update($data['id'])){
            if(isset($id)){ //新增失败，删除基础数据
                $this->delete($data['id']);
            }
            $this->error = $logic->getError();
            return false;
        }

        //内容添加或更新完成
        return $data;

    }

    /**
     * 获取段落列表
     * @param  integer $id    文档ID
     * @param  integer $page  显示页码
     * @param  boolean $field 查询字段
     * @param  boolean $logic 是否查询模型数据
     * @return array
     */
    public function part($id, $page = 1, $field = true, $logic = true){
        $map  = array('status' => 1, 'pid' => $id, 'type' => 3);
        $info = $this->field($field)->where($map)->page($page, 10)->order('id')->select();
        if(!$info) {
            $this->error = '该文档没有段落！';
            return false;
        }

        /* 不获取内容详情 */
        if(!$logic){
            return $info;
        }

        /* 获取内容详情 */
        $model = $logic = array();
        foreach ($info as $value) {
            $model[$value['model_id']][] = $value['id'];
        }
        foreach ($model as $model_id => $ids) {
            $data   = $this->logic($model_id)->lists($ids);
            $logic += $data;
        }

        /* 合并数据 */
        foreach ($info as &$value) {
            $value = array_merge($value, $logic[$value['id']]);
        }

        return $info;
    }

    /**
     * 获取指定文档的段落总数
     * @param  number $id 段落ID
     * @return number     总数
     */
    public function partCount($id){
        $map = array('status' => 1, 'pid' => $id, 'type' => 3);
        return $this->where($map)->count('id');
    }

    /**
     * 获取推荐位数据列表
     * @param  number  $pos      推荐位 1-列表推荐，2-频道页推荐，4-首页推荐
     * @param  number  $category 分类ID
     * @param  number  $limit    列表行数
     * @param  boolean $filed    查询字段
     * @return array             数据列表
     */
    public function position($pos, $category = null, $limit = null, $field = true){
        $map = $this->listMap($category, 1, $pos);

        /* 设置列表数量 */
        is_numeric($limit) && $this->limit($limit);

        /* 读取数据 */
        return $this->field($field)->where($map)->select();
    }

    /**
     * 获取数据状态
     * @return integer 数据状态
     * @author huajie <banhuajie@163.com>
     */
    protected function getStatus(){
        $cate = I('post.category_id');
        $check = M('Category')->getFieldById($cate, 'check');
        if($check){
            $status = 2;
        }else{
            $status = 1;
        }
        return $status;
    }

    /**
     * 获取根节点id
     * @return integer 数据id
     * @author huajie <banhuajie@163.com>
     */
    protected function getRoot(){
        $pid = I('post.pid');
        if($pid == 0){
            return 0;
        }
        $p_root = $this->getFieldById($pid, 'root');
        return $p_root == 0 ? $pid : $p_root;
    }

    /**
     * 获取扩展模型对象
     * @param  integer $model 模型编号
     * @return object         模型对象
     */
    private function logic($model){
        $name  = parse_name(get_document_model($model, 'name'), 1);
        $class = is_file(MODULE_PATH . 'Logic/' . $name . 'Logic' . EXT) ? $name : 'Base';
        $class = MODULE_NAME . '\\Logic\\' . $class . 'Logic';
        return new $class($name);  		
    }

    /**
     * 设置where查询条件
     * @param  number  $category 分类ID
     * @param  number  $pos      推荐位
     * @param  integer $status   状态
     * @return array             查询条件
     */
    private function listMap($category, $status = 1, $pos = null){
        /* 设置状态 */
        $map = array('status' => $status, 'pid' => 0);

        /* 设置分类 */
        if(!is_null($category)){
            if(is_numeric($category)){
                $map['category_id'] = $category;
            } else {
                $map['category_id'] = array('in', str2arr($category));
            }
        }

        $map['create_time'] = array('lt', NOW_TIME);
        $map['_string']     = 'deadline = 0 OR deadline > ' . NOW_TIME;

        /* 设置推荐位 */
        if(is_numeric($pos)){
            $map[] = "position & {$pos} = {$pos}";
        }

        return $map;
    }

    /**
     *  获取首页显示内容(根据不同显示区域展示不同显示内容)
     */
    public function home($view, $category, $order = '`id` ASC', $status = 1, $field = true){
        $map = $this->homeMap($view,$category,$status);
        $re = $this->field($field)->where($map)->order($order)->select();
        $result = $this->title($re);
        return $result;
    }

    private function title($re){
        foreach ($re as $key=>$val) {
//            var_dump($val);exit;
            $id = $val['id'];
            $condition['id'] = $id;

            if ($id == 11){
                $title = D('document_home')
                    ->where($condition)
                    ->select();
            }else{
                $title = D('document_model')
                    ->where($condition)
                    ->select();
            }

            foreach ($title as $h=>$a){
                /*首页背景图*/
                $img_id = $a['banner_img'];
                $Photo = D('Picture');
                $list_img_info = $Photo->where(['id' => $img_id])->find();
                $title[0]['banner_img'] = $list_img_info['path'];
                $mob = json_decode($a['mobile_img'],true);
                $title[0]['mobile_img'] = $mob;
            }

            $model = D('document_model')
                ->where($condition)
                ->select();
            foreach ($title as $k => $v) {
//                var_dump($category_name);exit;
                if ($val['view_num'] != ''){
                    for ($i=2;$i<7;$i++){
                        if ($val['view_num'] == $i) {
                            if($i==2){
                                $model = 'document_article_details';
                            }elseif($i==3){
                                $model = 'document_third_list';
                            }elseif($i==4){
                                $model = 'document_fourth_list';
                            }elseif($i==5){
                                $model = 'document_fifth_list';
                            }elseif($i==6){
                                $model = 'document_sixth_list';
                            }else{
                                $model = 'document_home';
                            }
                            if ($model == "document_fifth_list"){
                                    $title[$k]['dynamic'] = D('document')
                                        ->field('a.id,a.list_title,a.sub_title,c.name,one_document.create_time')
                                        ->join('one_document_article_details a ON one_document.id=a.id')
                                        ->join('one_category c ON one_document.category_id=c.id')
                                        ->order('id desc')
                                        ->where(['category_id'=>69,'one_document.status'=>1])
                                        ->limit(5)
                                        ->select();

                                    $title[$k]['news'] = D('document')
                                        ->field('a.id,a.list_title,a.sub_title,c.name,one_document.create_time')
                                        ->join('one_document_article_details a ON one_document.id=a.id')
                                        ->join('one_category c ON one_document.category_id=c.id')
                                        ->order('id desc')
                                        ->where(['category_id'=>70,'one_document.status'=>1])
                                        ->limit(5)
                                        ->select();
//                                }
                            }elseif ($model == "document_article_details"){
                                $yasin = D('document')
                                    ->field('a.id,a.list_title,a.article,a.sub_title,a.detail_img')
                                    ->join('one_document_article_details a ON one_document.id=a.id')
                                    ->where(['category_id'=>47,'status'=>1])
                                    ->limit(8)
                                    ->select();
                                $title[$k]['list'] = $yasin;
                                foreach ($yasin as $y=>$s){
                                    /*列表背景图*/
                                    $img_id = $s['detail_img'];
                                    $Photo = D('Picture');
                                    $list_img_info = $Photo->where(['id' => $img_id])->find();
                                    for ($i=0;$i<=2;$i++){
                                        $title[$k]['list'][$y] += ['list_images'=>$list_img_info['path']];
                                    }
                                }
                            }elseif ($model == "document_sixth_list"){
                                $recruit = D($model)
                                    ->field('one_document_sixth_list.id,list_title,one_document_sixth_list.en_title,one_document_sixth_list.tel,list_subtitle,list_img,c.name')
                                    ->join('one_document d ON one_document_sixth_list.id=d.id')
                                    ->join('left join one_category c ON d.category_id=c.pid')
                                    ->where(['d.status'=>1])
                                    ->select();

                                $contact = D('document_contact_us c')
                                    ->field('c.id,c.list_title,c.en_title,c.tel,d.view,p.path')
                                    ->join('one_document d ON c.id=d.id')
                                    ->join('one_picture p ON c.list_img=p.id')
                                    ->select();
                                $video_info = D('document_propagandist_video v')
                                    ->field('v.id,v.list_title,v.en_title,d.view,p.path,f.savepath,f.savename')
                                    ->join('one_document d ON v.id=d.id')
                                    ->join('one_picture p ON v.video_img=p.id')
                                    ->join('one_file f ON v.video=f.id')
                                    ->find();
                                $video_info['video_path'] = "/Uploads/Download/" . $video_info['savepath'] . $video_info['savename'];

//                                var_dump($recruit);exit;
                                $title[$k]['list'] = $recruit;
                                $title[$k]['contact'] = $contact;
                                $title[$k]['video'] = $video_info;
                            }elseif ($model == "document_third_list"){
                                $list = [
                                    "colligate_list",
                                    "specialty_list",
                                    "high_list",
                                    "accelerator_list"
                                ];
                                $where['c.name'] = array('in',$list);
                                $second_list = D($model)
                                    ->field('one_'.$model.'.id,one_'.$model.'.list_title,one_'.$model.'.en_title,one_'.$model.'.list_title,one_'.$model.'.list_img,c.name')
                                    ->join('one_document d ON one_'.$model.'.id=d.id')
                                    ->join('one_category c ON d.category_id=c.pid')
                                    ->where($where)
                                    ->select();
                                $title[$k]['list'] = $second_list;
                            }else{
                                $second_list = D($model)
                                    ->field('one_'.$model.'.id,one_'.$model.'.list_title,one_'.$model.'.en_title,one_'.$model.'.list_title,one_'.$model.'.list_img,c.name')
                                    ->join('one_document d ON one_'.$model.'.id=d.id')
                                    ->join('one_category c ON d.category_id=c.pid')
                                    ->select();
                                $title[$k]['list'] = $second_list;
                            }
                        }
                    }
                }
                foreach ($title[$k]['list'] as $second => $sec) {
                    /*列表背景图*/
                    $img_id = $sec['list_img'];
                    $Photo = D('Picture');
                    $list_img_info = $Photo->where(['id' => $img_id])->find();
                    $title[$k]['list'][$second] += ['list_images' => $list_img_info['path']];
                }
                /*首页背景视频*/
                $video_id = $v['banner_video'];
                if ($video_id != null) {
                    $File = D('File');
                    $video_info = $File->where(['id' => $video_id])->find();
                    $video_path = "/Uploads/Download/" . $video_info['savepath'] . $video_info['savename'];
                    $title[$k]['banner_video'] = $video_path;
                } else {
                    $video_path = NULL;
                    $title[$k]['banner_video'] = $video_path;
                }
            }
        }
        return $title;
    }

    private function homeMap($view, $category, $status = 1, $information){
        /* 设置状态 */
        $map = array('status' => $status);

        /* 设置分类 */
        if(!is_null($category)){
            if(is_numeric($category)){
                $map['category_id'] = $category;
            } else {
                $map['category_id'] = array('in', str2arr($category));
            }
        }

        /* 资讯分类 */
        if(!is_null($information)){
            if ($information == 1){
                $map['information'] = 1;
            }else{
                $map['information'] = 2;
            }
        }

        if ($view != NULL){
            $map['_string'] = 'view_num = '. $view;
        }else{
            $map['_string'] = 'view_num > 0';
        }
        return $map;
    }
}
