<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|管理平台</title>
    <link href="/lvyou/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link href="/lvyou/Public/Admin/css/bootstrap.min.css" rel="stylesheet" />
    <!--<script type="text/javascript" src="/lvyou/Public/Admin/js/bootstrap-switch.min.js"></script>
	<link href="/lvyou/Public/Admin/css/bootstrap-switch.min.css" rel="stylesheet" />-->
    
    <link rel="stylesheet" type="text/css" href="/lvyou/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/lvyou/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/lvyou/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/lvyou/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/lvyou/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
   	
		
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/lvyou/Public/static/jquery-1.10.2.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]>
    <!-->
    <script type="text/javascript" src="/lvyou/Public/static/jquery-2.0.3.min.js"></script> 
	<!--<![endif]-->
	<script type="text/javascript" src="/lvyou/Public/Admin/js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/lvyou/Public/Admin/js/jquery.cookie.js"></script>
	
	
    
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
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->                        
                            <form class="form-horizontal" role="form" action="<?php echo U('Page/add');?>" method="post">
                                <?php echo setParam(array('id'=>$id));?>

                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 名称 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                                <input type="text" name="name" value="<?php echo ($page['name']); ?>" class="form-control" />
                                        </div>
                                </div>
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 首页显示 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                            <select name="ishome">
                                                <option value="0" <?php if($page['ishome']==0){ ?>selected<?php } ?>>否</option>
                                                <option value="1" <?php if($page['ishome']==1){ ?>selected<?php } ?>>是</option>
                                            </select>
                                        </div>
                                </div>
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> seo标题 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                                <input type="text" name="seo_title" value="<?php echo ($page['seo_title']); ?>" class="form-control" />
                                        </div>
                                </div>
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> seo关键词 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                                <input type="text" name="seo_keyword" value="<?php echo ($page['seo_keyword']); ?>" class="form-control" />
                                        </div>
                                </div>
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> seo描述 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                                <input type="text" name="seo_description" value="<?php echo ($page['seo_description']); ?>" class="form-control" />
                                        </div>
                                </div>
                                <div class="form-group">
                                    <link rel="stylesheet" href="/lvyou/Public/Admin/addons/kindeditor/themes/default/default.css" />
                                    <link rel="stylesheet" href="/lvyou/Public/Admin/addons/kindeditor/plugins/code/prettify.css" />
                                    <script charset="utf-8" src="/lvyou/Public/Admin/addons/kindeditor/kindeditor.js"></script>
                                    <script charset="utf-8" src="/lvyou/Public/Admin/addons/kindeditor/lang/zh_CN.js"></script>
                                    <script charset="utf-8" src="/lvyou/Public/Admin/addons/kindeditor/plugins/code/prettify.js"></script>
                                    <script>
                                        KindEditor.ready(function (K) {
                                            var editor1 = K.create('textarea[name="content"]', {
                                                cssPath: '/lvyou/Public/Admin/addons/kindeditor/plugins/code/prettify.css',
                                                uploadJson: '/lvyou/Public/Admin/addons/kindeditor/php/upload_json.php',
                                                fileManagerJson: '/lvyou/Public/Admin/addons/kindeditor/php/file_manager_json.php',
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
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 内容 <span style="color:#f00;">*</span></label>
                                        <div class="col-sm-9">
                                                <textarea type="text" name="content" class="form-control" /><?php echo ($page['content']); ?></textarea>
                                        </div>
                                </div>
                                
                                <div class="form-group">
                                        <label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 排序 <span style="color:#f00;">*</span></label>

                                        <div class="col-sm-9">
                                                <input type="text" name="sort" value="<?php echo intval($page['sort']);?>" class="form-control" />
                                        </div>
                                </div>
                                <div class="form-group">
									<div class="checkbox col-sm-3 col-sm-offset-2">
											
											<label>
											   开启/关闭 <input name="status" class="ace ace-switch ace-switch-7" type="checkbox" <?php if($page && empty($page['status'])){ }else{ ?>checked='checked'<?php } ?> value='1'>
											   
											</label>
											
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
            "ROOT"   : "/lvyou", //当前网站地址
            "APP"    : "/lvyou/index.php?s=", //当前项目地址
            "PUBLIC" : "/lvyou/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/lvyou/Public/static/think.js"></script>
    <script type="text/javascript" src="/lvyou/Public/Admin/js/common.js"></script>
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