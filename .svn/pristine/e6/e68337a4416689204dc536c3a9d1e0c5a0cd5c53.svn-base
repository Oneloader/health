<?php
namespace Home\Controller;

class ListController extends HomeController{
    /**
     * 列表页显示
    */
    public function index($id){
        $model = D('Document');
        $category = D('Category');
        $re = $model->where(['id'=>$id])->select();
//        var_dump($re);exit;

        foreach ($re as $key=>$value){
            $son = $category->where(['pid'=>$value['category_id']])->select();
            foreach ($son as $k=>$v){
                $document = 'document_'.$v['name'];
            }
        }
        $do = D($document);
//        var_dump($do);exit;
        $list = $do->select();
//        var_dump($list);exit;
        /* 模板赋值并渲染模板 */
        $this->assign('list', $list);
        $this->display();
    }
}