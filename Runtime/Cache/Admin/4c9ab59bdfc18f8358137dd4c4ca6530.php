<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|管理平台</title>
    <link href="/ke361/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/ke361/Public/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <!--<script type="text/javascript" src="/ke361/Public/Admin/js/bootstrap-switch.min.js"></script>
	<link href="/ke361/Public/Admin/css/bootstrap-switch.min.css" rel="stylesheet" />-->
    
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/ke361/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
   	
		
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/ke361/Public/static/jquery-1.10.2.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]>
    <!-->
    <script type="text/javascript" src="/ke361/Public/static/jquery-2.0.3.min.js"></script> 
	<!--<![endif]-->
	<script type="text/javascript" src="/ke361/Public/Admin/js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/ke361/Public/Admin/js/jquery.cookie.js"></script>
	
	
    
</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo"></span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->
		
        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth_admin.username');?>"><?php echo session('user_auth_admin.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
        <div class="web-index">
			<a href="<?php echo U('Home/Index/index');?>" target="_blank">网站首页</a>
		</div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
            <div id="subnav" class="subnav">
                <?php if(!empty($_extra_menu)): ?>
                    <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                    <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
                        <ul class="side-sub-menu">
                            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                                    <a class="item" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        
        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
    <!-- ace styles -->


	<!--[if lte IE 8]>
	  <link rel="stylesheet" href="/ke361/Public/Admin/css/ace-ie.min.css" />
	<![endif]-->


               <script type="text/javascript" src="/ke361/Public/static/uploadify/jquery.uploadify.min.js"></script>           
                        <form class="form-horizontal" role="form" action="<?php echo U('Goods/edit');?>" method="post" enctype="multipart/form-data">
                          <?php echo setParam(array('goods_id'=>$goods['goods_id']));?>
                           <div class="form-group">
	                          <label class="col-sm-2 control-label no-padding-right" for="form-field-1">图片<span style="color:#f00;">*</span></label>
							  <div class="col-sm-9">
									<input type="file" id="upload_picture_pic_url">
									<input type="hidden" name="pic_url" id="pic_url" value="<?php echo ($goods[pic_url]); ?>"/>
									<div class="upload-img-box">
									<?php if(!empty($goods["pic_url"])): ?><div class="upload-pre-item"><img src="<?php echo ($goods[pic_url]); ?>"/></div><?php endif; ?>
									</div>
							  </div>	
								<script type="text/javascript">
								//上传图片
							    /* 初始化上传插件 */
								$("#upload_picture_pic_url").uploadify({
							        "height"          : 30,
							        "swf"             : "/ke361/Public/static/uploadify/uploadify.swf",
							        "fileObjName"     : "download",
							        "buttonText"      : "上传图片",
							        "uploader"        : "<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
							        "width"           : 120,
							        
							        "removeTimeout"	  : 1,
							        "fileTypeExts"	  : "*.jpg; *.png; *.gif;",
							        "onUploadSuccess" : uploadPicture,
							        "onFallback" : function() {
							            alert('未检测到兼容版本的Flash.');
							        }
							    });
								function uploadPicture(file, data){
							    	var data = $.parseJSON(data);
							    	var src = '';
							    	
							        if(data.status){
							        	
							        	$("#pic_url").val(data.path);
							        	src = data.url || '/ke361' + data.path
							        	$("#pic_url").parent().find('.upload-img-box').html(
							        		'<div class="upload-pre-item"><img src="' + src + '"/></div>'
							        	);
							        } else {
							        	updateAlert(data.info);
							        	setTimeout(function(){
							                $('#top-alert').find('button').click();
							                $(that).removeClass('disabled').prop('disabled',false);
							            },1500);
							        }
							    }
								</script>
							</div>
                           
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">名称<span style="color:#f00;">*</span></label>
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="title" value="<?php echo ($goods['title']); ?>"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">类型</label>   
                                <div class="col-sm-9">
                                    <select class="col-sm-12 form-control" name="goods_type" id="type">
                                        <option value="1" <?php if($goods['goods_type']==1){ ?>selected<?php } ?>>普通线路</option>   
                                        <option value="2" <?php if($goods['goods_type']==2){ ?>selected<?php } ?>>签证</option>                                     
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">选择分类</label>
                                <div class="col-sm-9">
                                    <select class="col-sm-12 form-control" name="cate_id">
                                        <option value="0">选择分类</option>
                                        <?php if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><option value="<?php echo ($data['id']); ?>" <?php if($data['id'] == $goods["cate_id"]){ ?>selected<?php } ?>>
                                        	<?php $__FOR_START_23051__=1;$__FOR_END_23051__=$data["level"];for($i=$__FOR_START_23051__;$i < $__FOR_END_23051__;$i+=1){ if($i+1 == $data['level']){ ?>&nbsp;|-<?php }else{ ?>&nbsp;&nbsp;&nbsp;<?php } } ?>	
                                        		<?php echo ($data['category_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>                                        
                                    </select>
                                    <script type='text/javascript'>
                                        $("select[name='sort_id'] option[value='<?php echo $goods[sort_id] ?>']").attr('selected','selected');
                                    </script>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">选择专题</label>
                                <div class="col-sm-9">
                                    <select class="col-sm-12 form-control" name="tid">
                                        <option value="0">选择专题</option>
                                        <?php if(is_array($topic)): $i = 0; $__LIST__ = $topic;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><option value="<?php echo ($data['tid']); ?>"><?php echo ($data['name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>                                        
                                    </select>
                                    <script type='text/javascript'> 
                                        $("select[name='tid'] option[value='<?php echo $goods[tid] ?>']").attr('selected','selected');
                                    </script>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">seo标题</label>	
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="seo_title" value="<?php echo ($goods['seo_title']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">seo关键字</label>	
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="seo_keywords" value="<?php echo ($goods['seo_keywords']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">seo内容</label>	
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="seo_description" value="<?php echo ($goods['seo_description']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">商品价格(原价)<span style="color:#f00;">*</span></label>	
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="price" value="<?php echo ($goods['price']); ?>"></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">折扣价格(实际显示价格)</label>	
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="discount_price" value="<?php echo ($goods['discount_price']); ?>"></div>
                            </div>

                            <div class="form-group type-1" <?php if($goods['type']==2){ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-2 control-label no-padding-right">儿童票</label> 
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="child_price" value="<?php echo ($goods['child_price']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" id="city"><?php if($goods['type']==2){ ?>所属领区<?php }else{ ?>出发城市<?php } ?></label> 
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="city" value="<?php echo ($goods['city']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" id="aheaddays"><?php if($goods['type']==2){ ?>有效期<?php }else{ ?>提前预定<?php } ?></label> 
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="aheaddays" value="<?php echo ($goods['aheaddays']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" id="days"><?php if($goods['type']==2){ ?>办理时间<?php }else{ ?>行程天数<?php } ?></label> 
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="days" value="<?php echo ($goods['days']); ?>"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right" id="traffic"><?php if($goods['type']==2){ ?>受理范围<?php }else{ ?>交通方式<?php } ?></label> 
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="traffic" value="<?php echo ($goods['traffic']); ?>"></div>
                            </div>

                            <div class="form-group type-2" <?php if($goods['type']==1){ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-2 control-label no-padding-right">最多停留</label> 
                                <div class="col-sm-9"><input class="col-sm-12 form-control" type="text" name="maxdays" value="<?php echo ($goods['maxdays']); ?>"></div>
                            </div>

                            <div class="form-group type-2" <?php if($goods['type']==1){ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-2 control-label no-padding-right">面试</label> 
                                <div class="col-sm-9">
                                    <select class="col-sm-12 form-control" name="audition">
                                        <option value="1" <?php if($goods['audition']==1){ ?>selected<?php } ?>>是</option>   
                                        <option value="2" <?php if($goods['audition']==2){ ?>selected<?php } ?>>否</option>                                     
                                    </select>
                                </div>
                            </div>

                            <div class="form-group type-2" <?php if($goods['type']==1){ ?>style="display:none"<?php } ?>>
                                <label class="col-sm-2 control-label no-padding-right">邀请函</label> 
                                <div class="col-sm-9">
                                    <select class="col-sm-12 form-control" name="invite">
                                        <option value="1" <?php if($goods['invite']==1){ ?>selected<?php } ?>>是</option>   
                                        <option value="2" <?php if($goods['invite']==2){ ?>selected<?php } ?>>否</option>                                     
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">标签<span style="color:#f00;">*</span></label>
                                <div class="col-sm-9">
                                    <?php if(is_array($tags)): $i = 0; $__LIST__ = $tags;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i;?><input type="checkbox" name="tag[]" value="<?php echo ($tag["id"]); ?>" <?php if(in_array($tag['id'], $mytag)){ ?>checked<?php } ?>><?php echo ($tag["name"]); ?>&nbsp;&nbsp;&nbsp;<?php endforeach; endif; else: echo "" ;endif; ?>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">审核状态<span style="color:#f00;">*</span></label>
                                <div class="col-sm-9">
                                    <select class="col-sm-12 form-control" name="status">
                                        <option selected="selected" value="1">审核通过</option>
                                        <option value="0">待审核</option>
                                    </select>
                                    <script type='text/javascript'>
                                        $("select[name='state'] option[value='<?php echo $goods[state] ?>']").attr('selected','selected');
                                    </script>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right">商品介绍 </label>

                                <link rel="stylesheet" href="/ke361/Public/Admin/addons/kindeditor/themes/default/default.css" />
                                <link rel="stylesheet" href="/ke361/Public/Admin/addons/kindeditor/plugins/code/prettify.css" />
                                <script charset="utf-8" src="/ke361/Public/Admin/addons/kindeditor/kindeditor.js"></script>
                                <script charset="utf-8" src="/ke361/Public/Admin/addons/kindeditor/lang/zh_CN.js"></script>
                                <script charset="utf-8" src="/ke361/Public/Admin/addons/kindeditor/plugins/code/prettify.js"></script>
                                <script>
                KindEditor.ready(function (K) {
                    var editor1 = K.create('textarea[name="item_body"]', {
                        cssPath: '/ke361/Public/Admin/addons/kindeditor/plugins/code/prettify.css',
                        uploadJson: '/ke361/Public/Admin/addons/kindeditor/php/upload_json.php',
                        fileManagerJson: '/ke361/Public/Admin/addons/kindeditor/php/file_manager_json.php',
                        allowFileManager: true,
                        afterChange: function (){
                            var self = this;
                            self.sync();
                        },
                        afterCreate: function () {
                            var self = this;
                            K.ctrl(document, 13, function () {
                                self.sync();
                                K('form[name=example]')[0].submit();
                            });
                            K.ctrl(self.edit.doc, 13, function () {
                                self.sync();
                                K('form[name=example]')[0].submit();
                            });
                        }
                    });
                    prettyPrint();
                });
                                </script>
                                <div class="col-sm-9">
                                    <textarea class="col-sm-12" name="item_body" style="height:500px;visibility:hidden;"><?php echo stripslashes($goods['item_body']);?></textarea>
                                </div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-4 col-md-4">
                                    <button class="btn btn-info btn-block ajax-post" target-form="form-horizontal" type="submit">
                                        <i class="icon-ok bigger-110"></i>
                                        确认
                                    </button>
                                </div>
                            </div>
                        </form>
<script type="text/javascript">
    $(document).ready(function(){
        $('#type').change(function(){
            var val = $(this).val();
            if(val == 2)
            {
                $("div.type-2").show();
                $("div.type-1").hide();
                $("#city").text("所属领区");
                $("#aheaddays").text("有效期");
                $("#days").text("办理时间");
                $("#traffic").text("受理范围");
            }
            else
            {
                $("div.type-2").hide();
                $("div.type-1").show();
                $("#city").text("出发城市");
                $("#aheaddays").text("提前预定");
                $("#days").text("行程天数");
                $("#traffic").text("交通方式");
            }
        });
    });
</script> 
   
 
        </div>
        <div class="cont-ft">
            <div class="copyright">
                <div class="fl">感谢使用<a>LinThink</a>管理平台</div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div>
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "/ke361", //当前网站地址
            "APP"    : "/ke361/index.php?s=", //当前项目地址
            "PUBLIC" : "/ke361/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/ke361/Public/static/think.js"></script>
    <script type="text/javascript" src="/ke361/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
</body>
</html>