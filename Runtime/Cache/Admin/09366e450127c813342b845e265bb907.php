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
            

            
    <div class="container">
        <script type="text/javascript" src="/ke361/Public/static/uploadify/jquery.uploadify.min.js"></script>
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->                        
                            <form class="form-horizontal" role="form" action="<?php echo U('CategoryGoods/add');?>" method="post">
                                <?php echo setParam(array('id'=>$category['id'],'p_id'=>$p_id));?>
                              
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 分类名称 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                                <input type="text" name="category_name" value="<?php echo ($category['category_name']); ?>" class="form-control" />
                                        </div>
                                </div>

                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 颜色选择 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                            <select name="color" style="color:#fff,background:#000">
                                                <option <?php if($category['color'] == 'green'){ ?>selected<?php } ?> value="green" style="background:#7ac406">===绿色===</option>
                                                <option <?php if($category['color'] == 'green_b'){ ?>selected<?php } ?> value="green_b" style="background:#2cbaa2">===深绿===</option>
                                                <option <?php if($category['color'] == 'blue_b'){ ?>selected<?php } ?> value="blue_b" style="background:#01a1eb">===暗蓝===</option>
                                                <option <?php if($category['color'] == 'blue_c'){ ?>selected<?php } ?> value="blue_c" style="background:#00a9f7">===蓝色===</option>
                                                <option <?php if($category['color'] == 'blue'){ ?>selected<?php } ?> value="blue" style="background:#4775f7">===深蓝===</option>
                                                <option <?php if($category['color'] == 'pink'){ ?>selected<?php } ?> value="pink" style="background:#ff6d9a">===粉色===</option>
                                                <option <?php if($category['color'] == 'yellow'){ ?>selected<?php } ?> value="yellow" style="background:#fab40c">===黄色===</option>
                                                <option <?php if($category['color'] == 'purple'){ ?>selected<?php } ?> value="purple" style="background:#b57dea">===紫色===</option>
                                            </select>
                                        </div>
                                </div>

                                <div class="form-group">

                                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">分类图标</label>
                                    <div class="col-sm-9">
                                        <input type="file" id="upload_picture">
                                        <input type="hidden" name="catepic_url" id="catepic" value="<?php echo ((isset($category['catepic_url']) && ($category['catepic_url'] !== ""))?($category['catepic_url']):''); ?>"/>
                                        <div class="upload-img-box">
                                            <?php if(!empty($category['catepic_url'])): ?><div class="upload-pre-item"><img src="/ke361<?php echo ($category["catepic_url"]); ?>"/></div><?php endif; ?>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                    //上传图片
                                    /* 初始化上传插件 */
                                    $("#upload_picture").uploadify({
                                        "height"          : 30,
                                        "swf"             : "/ke361/Public/static/uploadify/uploadify.swf",
                                        "fileObjName"     : "download",
                                        "buttonText"      : "上传图片",
                                        "uploader"        : "<?php echo U('File/uploadcatePicture',array('session_id'=>session_id()));?>",
                                        "width"           : 120,
                                        'removeTimeout'   : 1,
                                        'fileTypeExts'    : '*.jpg; *.png; *.gif;',
                                        "onUploadSuccess" : uploadPicture,
                                        'onFallback' : function() {
                                            alert('未检测到兼容版本的Flash.');
                                        }
                                    });
                                    function uploadPicture(file, data){
                                        var data = $.parseJSON(data);
                                        var src = '';
                                        if(data.status){
                                            src = data.url || data.path;
                                            $("#catepic").val(src);
                                            $("#catepic").parent().find('.upload-img-box').html(
                                                '<div class="upload-pre-item"><img src="' + '/ke361' + src + '"/></div>'
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

                                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">广告图片</label>
                                    <div class="col-sm-9">
                                        <input type="file" id="upload_adpicture">
                                        <input type="hidden" name="ad_url" id="ad" value="<?php echo ((isset($category['ad_url']) && ($category['ad_url'] !== ""))?($category['ad_url']):''); ?>"/>
                                        <div class="upload-img-box">
                                            <?php if(!empty($category['ad_url'])): ?><div class="upload-pre-item"><img src="/ke361<?php echo ($category["ad_url"]); ?>"/></div><?php endif; ?>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                    //上传图片
                                    /* 初始化上传插件 */
                                    $("#upload_adpicture").uploadify({
                                        "height"          : 30,
                                        "swf"             : "/ke361/Public/static/uploadify/uploadify.swf",
                                        "fileObjName"     : "download",
                                        "buttonText"      : "上传图片",
                                        "uploader"        : "<?php echo U('File/uploadcatePicture',array('session_id'=>session_id()));?>",
                                        "width"           : 120,
                                        'removeTimeout'   : 1,
                                        'fileTypeExts'    : '*.jpg; *.png; *.gif;',
                                        "onUploadSuccess" : uploadPicture,
                                        'onFallback' : function() {
                                            alert('未检测到兼容版本的Flash.');
                                        }
                                    });
                                    function uploadPicture(file, data){
                                        var data = $.parseJSON(data);
                                        var src = '';
                                        if(data.status){
                                            src = data.url || data.path;
                                            $("#ad").val(src);
                                            $("#ad").parent().find('.upload-img-box').html(
                                                '<div class="upload-pre-item"><img src="' + '/ke361' + src + '"/></div>'
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
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 分类排序 <span style="color:#f00;">*</span></label>

                                        <div class="col-sm-9">
                                                <input type="text" name="order" value="<?php echo intval($category['order']);?>" class="form-control" />
                                        </div>
                                </div>

                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 是否首页显示 <span style="color:#f00;">*</span></label>

                                        <div class="col-sm-9">
                                            <select name="is_home">
                                                 <option value="0" <?php if($category["is_home"]==0){ ?>selected<?php } ?>>否</option>
                                                 <option value="1" <?php if($category["is_home"]==1){ ?>selected<?php } ?>>是</option>
                                            </select>
                                        </div>
                                </div>
                                
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 首页显示数量 <span style="color:#f00;">*</span></label>

                                        <div class="col-sm-9">
                                                <input type="text" name="home_num" value="<?php echo intval($category['home_num']);?>" class="form-control" />
                                                (仅对第一级分类有效)
                                        </div>
                                </div>
                                
                                <div class="form-group">
											
										<label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 分类状态 <span style="color:#f00;">*</span></label>

										<div class="col-sm-9">
                                            <select name="state">
                                                 <option value="0" <?php if($category["status"]==0){ ?>selected<?php } ?>>关闭</option>
                                                 <option value="1" <?php if($category["status"]==1){ ?>selected<?php } ?>>开启</option>
                                            </select>
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
                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        
  


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