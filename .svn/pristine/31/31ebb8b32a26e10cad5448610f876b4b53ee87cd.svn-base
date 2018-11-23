<?php

namespace Addons\UploadPic;
use Common\Controller\Addon;

/**
 * 文件上传插件
 * @author lhb
 */

    class UploadPicAddon extends Addon{

        public $info = array(
            'name'=>'UploadPic',
            'title'=>'多图上传',
            'description'=>'多图上传',
            'status'=>1,
            'author'=>'lhb',
            'version'=>'0.1'
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的UploadFiles钩子方法
        public function UploadPic($param){
            if (empty($param['value'])) {
                $param['value'] = json_encode(array());
            }
            $this->assign('param', $param);
            $this->display('index');
        }

    }