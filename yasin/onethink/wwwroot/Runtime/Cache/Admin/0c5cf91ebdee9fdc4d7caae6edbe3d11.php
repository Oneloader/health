<?php if (!defined('THINK_PATH')) exit();?><div class='controls ' style='background: aliceblue;
     padding: 10px;'>
    <link rel="stylesheet" href="/Addons/UploadPic/style/UploadImages.css">
    <script type="text/javascript" src="/Addons/UploadPic/js/jquery.sortable.js"></script>
    <textarea id="fields_input_<?php echo ($param['name']); ?>" name="<?php echo ($param['name']); ?>" class='hidden'><?php echo ($param['value']); ?></textarea>
    <!--<div><label>扩展字段：<input id="other_fields_<?php echo ($param['name']); ?>" value="" style="ime-mode:disabled" /><a id="other_fields_<?php echo ($param['name']); ?>_link">确定</a>    格式：首字母a-zA-Z，保留字段name,id,path,多个字段以","隔开，删除字段，将删除现有字段值，请谨慎操作</label></div>-->
    <div class='controls'>
        <div class="upload-img-box" id="fields-list_<?php echo ($param['name']); ?>">
        </div>
    </div>
    <div class='fields-option controls'>
        <input id="file_upload_<?php echo ($param['name']); ?>" name="file_upload" type="file" multiple="true"/>
        <div id="file_upload_<?php echo ($param['name']); ?>_error"></div>
    </div>
    <script type="text/javascript">
        var handlePictures_<?php echo ($param['name']); ?>=function(){
            var o = $("#fields_input_<?php echo ($param['name']); ?>");
            var oOtherFields=$("#other_fields_<?php echo ($param['name']); ?>");
            var oOtherFieldsLink=$("#other_fields_<?php echo ($param['name']); ?>_link");
            var oTemplate = $("#fields_input_template_<?php echo ($param['name']); ?>");
            var oResult = $('#fields-list_<?php echo ($param['name']); ?>');
            var oError=$("#file_upload_<?php echo ($param['name']); ?>_error");
            var oValueJson = o.text();
            var oValue = $.parseJSON(oValueJson);
            var oList=[];
            var oFields=[];
            var oBaseFields=['name','id','path'];
            var showError=function(value){
                var errorItem=$('<div></div>');
                errorItem.html(value);
                errorItem.appendTo(oError);
                setTimeout(function(){
                    errorItem.remove();
                },5000)
            };
            oOtherFieldsLink.bind('click',function(){
//                "gasdf,fasd,gasdf,fasdf".split(',').join(',')
//                /^[a-zA-Z]{1}[a-zA-Z0-9]+$/.test('fasdf09asdf')
                var arr=oOtherFields.val().split(',');
                oFields=[];
                for(var i in arr){
                    if(/^[a-zA-Z]{1}[a-zA-Z0-9]*$/.test(arr[i])&&$.inArray(arr[i],oFields)<0&&$.inArray(arr[i],oBaseFields)<0){
                        oFields.push(arr[i]);
                    }
                }
                oOtherFields.val(oFields.join(','));
                checkOtherFields(false);
                showValue();
            });
            var checkOtherFields=function(flag){
                if(oValue.length>0){
                    if(flag){
                        var item=oValue[0];
                        for(var i in item){
                            if($.inArray(i,oBaseFields)<0&&$.inArray(i,oFields)<0){
                                oFields.push(i);
                            }
                        }
                        oOtherFields.val(oFields.join(','));
                    }
                    if(oFields.length>0){
                        for(var i in oFields){
                            for(j in oValue){
                                if(!oValue[j][oFields[i]]){
                                    oValue[j][oFields[i]]='';
                                }
                            }
                        }
                    }
                }
            };
            var showValue=function(checkFields){
                o.text(JSON.stringify(oValue));
                oResult.html("");
                oList=[];
                for(var i in oValue){
                    var id=oValue[i].id;
                    oList[id]=oValue[i];
                    var resultItem=$('<div draggable="true" class="upload-pre-item" data-id="'+id+'"></div>');
                    var html="";
                    if(oFields.length>0){
                        for(var j in oFields){
                            html +='<label>'+oFields[j]+':<input data-id="'+id+'" data-field="'+oFields[j]+'" value="'+(oValue[i][oFields[j]]?oValue[i][oFields[j]]:'')+'"/></label>';
                        }
                    }
//                    html +='<label>名称:<input data-id="'+id+'" data-field="name" value="'+oValue[i].name+'"/></label>';
                    html+='<img src="'+oValue[i].path+'"><span data-id="'+id+'" class="btn-close" id="btn-close-'+id+'" title="删除图片"></span>';
                    resultItem.html(html);
                    resultItem.appendTo(oResult);
                    resultItem.find('.btn-close').bind('click',function(){
                        delValue($(this).attr('data-id'));
                    });
                    resultItem.find('input').bind('change',function(){
                        updateValue($(this).attr('data-id'),$(this).val(),$(this).attr('data-field'));
                    });
                }
                if(oResult.find('.upload-pre-item').length>0){
                    oResult.sortable().bind('sortupdate', function(event, ui) {
                        oValue=[];
                        oResult.find('.upload-pre-item').each(function(i){
                            var id=$(this).attr('data-id');
                            oValue.push(oList[id]);
                        });
                        showValue();
                    });
                }
            };
            var updateValue=function(id,value,field){
                for(var i in oValue){
                    if(oValue[i].id==id){
                        oValue[i][field]=value;
                        break;
                    }
                }
                showValue();
            };
            var delValue=function(id){
                for(var i in oValue){
                    if(oValue[i].id==id){
                        oValue.splice(i,1);
                        break;
                    }
                }
                showValue();
            };
            var uploadPictures = function (file, data) {
                var data = $.parseJSON(data);
                if(data.status==1){
                    var item={path:data.url?data.url:data.path,id:data.id,name:file.name.replace(/(.jpg)|(.png)|(.gif)/,"")};
                    oValue.push(item)
                }
                showValue();
                showError(file.name+":"+data.info);
            };
            $("#file_upload_<?php echo ($param['name']); ?>").uploadify({
                "height": 30,
                "swf": "/Public/static/uploadify/uploadify.swf",
                "fileObjName": "download",
                "buttonText": "上传多图",
                "uploader": "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
                "width": 120,
                'removeTimeout': 1,
                'fileTypeExts': '*.jpg; *.png; *.gif;',
                "onUploadSuccess": uploadPictures,
                'onFallback': function () {
                alert('未检测到兼容版本的Flash.');
                },
                'formData': {
                'timestamp': (new Date()).getTime()
                }
            });
            checkOtherFields(true);
            showValue();
        }
        $(function () {
            handlePictures_<?php echo ($param['name']); ?>();
        });
    </script>
</div>