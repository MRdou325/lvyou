<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="">
 
<title><?php echo ($site_title); ?></title>
<meta name="keywords" content="<?php echo ($site_keyword); ?>" />
<meta name="description" content="<?php echo ($site_description); ?>">
<link href="/lvyou/Public/Home/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/lvyou/Public/Home/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="/lvyou/Public/Home/css/style.css" rel="stylesheet">
<script type="text/javascript" src="/lvyou/Public/Home/js/jquery.min.js"></script>
<script type="text/javascript" src="/lvyou/Public/Home/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/lvyou/Public/Home/js/html5shiv.js"></script>
<!--[if lt IE 9]>
  <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
  <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="<?php echo C('WEB_SITE_ICO');?>" rel="icon" type="image/x-icon" />


   
</head>
<body>
	<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/lvyou/Public/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
	<script>
       
  
    	   
       
   
	$(function(){
		$('#navbar').find('a[href="'+'<?php echo ($nav_url); ?>'+'"]').closest('li').addClass('active');  
		// $('.goods-list').find('li').each(function(){
			
		// 	$(this).height($(this).width()*1.35-1);	
		// });
		
					});
					
</script>
<script>
function favor(goodsid){
    $.get("<?php echo U('ajax/favor');?>",{id:goodsid},function(json){
    	// if(json.info == "ERROR_MEMBER_NO_LOGIN")
    	// {
    	// 	json.info = "请先登录"；
    	// }
    	showmsg(json.info);
    })    
}   
function login(){
	var name = $("#username").val();
	var password = $("#password").val()
	if(name == "")
	{
		showmsg("请输入用户名");
	}
	if(password == "")
	{
		showmsg("请输入密码");
	}
    $.post("<?php echo U('ajax/login');?>",{username:name,password:password},function(json){
    	console.log(json);
        showmsg(json.info);
        if(json.state == 1)
        {
        	location.href = "<?php echo U('Home/Index/index');?>";
        }
    })    
}   
function showmsg(msg){
	$("#tip").remove();
	$tip = $('<div id="tip" style="font-weight:bold;position:fixed;top:240px;left: 50%;z-index:9999;background:rgb(130,194,75);padding:18px 30px;border-radius:8px;color:#fff;font-size:16px;">'+msg+'</div>');
    $('body').append($tip);
	$tip.stop(true).css('margin-left', -$tip.outerWidth() / 2).fadeIn(500).delay(2000).fadeOut(500);
}
</script>
<!--Tab淡入浅出-->
<script>
   $(function () {
      $('#myTab li:eq(1) a').tab('show');
   });
</script>
<!--提示标签-->
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>

	<div class="row-fluid" id="header">
  <div class="container">
    <div class="col-md-6">
      <div class="logo">
        <a class="" href="/" title="<?php echo C('WEB_SITE_NAME');?>">
          <img title="<?php echo C('WEB_SITE_NAME');?>" alt="<?php echo C('WEB_SITE_NAME');?>" src="<?php echo C('WEB_SITE_LOGO');?>">
        </a>
      </div>
    </div>
    <div class="col-md-2 col-sm-12 login">
      <?php if($my['uid'] > 0): ?><button type="button" class="btn btn-danger col-xs-6"><a href="<?php echo U('User/logout');?>" ><i class="glyphicon glyphicon-log-out"></i> &nbsp;退出</a></button>
        <button type="button" class="btn btn-primary col-xs-6"><a href="<?php echo U('User/index');?>" ><i class="glyphicon glyphicon-user"></i> &nbsp;<?php echo ($my['username']); ?></a></button>
      <?php else: ?>
        <button type="button" class="btn btn-info col-xs-6"><a href="<?php echo U('User/register');?>" rel="nofollow">注册</a></button>
        <button type="button" class="btn btn-primary col-xs-6"><a href="<?php echo U('User/login');?>" rel="nofollow">登录</a></button><?php endif; ?>
    </div>
    <div class="col-md-4">
      <form class="form-search">
      <div class="input-group search">
               <div class="input-group-btn">
                  <button type="button" class="btn btn-default" 
                     tabindex="-1">下拉菜单
                  </button>
                  <button type="button" class="btn btn-default 
                     dropdown-toggle" data-toggle="dropdown" tabindex="-1">
                     <span class="caret"></span>
                     <span class="sr-only">切换下拉菜单</span>
                  </button>
                  <ul class="dropdown-menu">
                     <li><a href="#">功能</a></li>
                     <li><a href="#">另一个功能</a></li>
                     <li><a href="#">其他</a></li>
                     <li class="divider"></li>
                     <li><a href="#">分离的链接</a></li>
                  </ul>
               </div><!-- /btn-group -->
               <input type="text" class="form-control" placeholder="请输入目的地或关键词...">
               <input type="submit" class="search-btn" value="查找">
            </div><!-- /input-group -->
      </form>
    </div>
  </div>
</div>
<div class="row-fluid">
  <div class="container">
    <div class="col-md-12">
      <nav class="navbar navbar-default" role="navigation">
         <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
           <span class="sr-only">切换导航</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" title="首页" href="/"><i class="glyphicon glyphicon-home"></i></a>
         </div>
         <div class="collapse navbar-collapse" id="example-navbar-collapse">
          <ul class="nav navbar-nav">
            <?php if(!empty($nav)): if(is_array($nav)): $i = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$headnav): $mod = ($i % 2 );++$i; if($headnav['pid'] == 0 && $headnav['head'] ==1){ ?>
                  <li >
                    <a id="nav-<?php echo ($headnav["id"]); ?>"  href="<?php echo (get_nav_url($headnav["url"])); ?>" target="<?php if(($headnav["target"]) == "1"): ?>_blank<?php else: ?>_self<?php endif; ?>"><?php echo ($headnav["title"]); ?></a>
                  </li>
                <?php } endforeach; endif; else: echo "" ;endif; endif; ?>
           <li class="active"><a href="#">iOS</a></li>
           <li><a href="#">SVN</a></li>
           <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               Java <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
               <li><a href="#">jmeter</a></li>
               <li><a href="#">EJB</a></li>
               <li><a href="#">Jasper Report</a></li>
               <li class="divider"></li>
               <li><a href="#">分离的链接</a></li>
               <li class="divider"></li>
               <li><a href="#">另一个分离的链接</a></li>
            </ul>
           </li>
          </ul>
         </div>
      </nav>
      <?php if(!$ishome){ ?>
      <ul class="breadcrumb">
        <li>
          <a href="#">主页</a> <col-md- class="divider"></col-md->
        </li>
        <li>
          <a href="#">类目</a> <col-md- class="divider"></col-md->
        </li>
        <li class="active">
          主题
        </li>
      </ul>
      <?php } ?>
    </div>
  </div>
</div>

	

	 <link href="/lvyou/Public/Home/New/css/list.css" rel="stylesheet">
	 <link rel="stylesheet" type="text/css" href="/lvyou/Public/Home/New/css/login.css">
	 <div class="box">
	 	<div class="col-md-3">
	 		<div class="categorygoods-list">
    <?php if(is_array($CategoryList)): $i = 0; $__LIST__ = $CategoryList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($vo["level"] == 1){ ?>
        <h2 class="categorygoods_parent">
            <a href="<?php echo U('goods/cate',array("id"=>$vo['id']));?>" title="<?php echo ($vo["category_name"]); ?>" <?php if($vo['id'] == $_GET['id']){ ?>class="active"<?php } ?>><?php echo ($vo["category_name"]); ?></a>
        </h2>
    <?php }else{ ?>
        <a href="<?php echo U('goods/cate',array("id"=>$vo['id']));?>" title="<?php echo ($vo["category_name"]); ?>" <?php if($vo['id'] == $_GET['id']){ ?>class="active"<?php } ?>><?php echo ($vo["category_name"]); ?></a>
    <?php } endforeach; endif; else: echo "" ;endif; ?>
</div>

	 	</div>
	 	<div class="col-md-9">
	 		<div class="login-content" style="margin-top:20px;">
	 		<?php if($id){ ?>
            	<div class="title">
            		<?php echo ($page["name"]); ?>
            	</div>
            	<div class="login-center" style="width:100%">
                	<div class="fl">
	 					<?php echo ($page["content"]); ?>
	 				</div>
	 			</div>
	 		<?php }else{ ?>
            	<div class="login-center">
            		<?php if(is_array($page)): $i = 0; $__LIST__ = $page;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$page): $mod = ($i % 2 );++$i;?><div class="content-landing fl">
	 					<a href="<?php echo U('Page/index',array('id'=>$page['id']));?>" title="<?php echo ($page["name"]); ?>"><?php echo ($page["name"]); ?></a>
	 				</div><?php endforeach; endif; else: echo "" ;endif; ?>
	 			</div>
	 		<?php } ?>
	 		</div>
	 	</div>
	 	<div class="clear"></div>
      </div>
	 

	<!-- 页脚 -->
<div style="display: none;" class="side_right fix">
    <div class="con">
        <a class="trigger go-top" href="javascript:;">
            <p>回到<br>顶部</p>
            <span><i class="glyphicon glyphicon-triangle-top" aria-hidden="true" style="font-size:24px;"></i></span>
        </a>
    </div>
</div>
<?php if(C('WEB_SUPPORT_OPEN') == 1){ ?>
<div id="tool" class="">
	<div id="tool_content" style="display: block;">
		<div class="tc tool_c_top"></div>
		<div class="tc tool_c_content">
			<h3 class="ck online">&nbsp;</h3>
			<h3 class="ck support">咨询客服</h3>
			<?php if(is_array($support)): $i = 0; $__LIST__ = $support;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$qq): $mod = ($i % 2 );++$i;?><h3 class="ck qq"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo ($qq["number"]); ?>&site=qq&menu=yes"><?php echo ($qq["name"]); ?></a></h3><?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
		<div class="tc tool_c_tb"></div>
		<div class="tc tool_c_content">
			<h3 class="ck tel">&nbsp;</h3>
			<span class="ck phone"><?php echo C("WEB_SITE_TEL");?></span>
		</div>
		<div class="tc tool_c_bottom"></div>
	</div>
	<a id="aFloatTools_Show" class="ck" href="javascript:void(0);" onclick="javascript:$('#tool_content').hide(1000);	$('#aFloatTools_Show').attr('style','display:none');$('#aFloatTools_Hide').attr('style','display:block');return false;" style="display:block">&nbsp;</a>
	<a id="aFloatTools_Hide" class="ck" style="display:none" href="javascript:void(0);" onclick="javascript:$('#tool_content').show(1000);	$('#aFloatTools_Show').attr('style','display:block');$('#aFloatTools_Hide').attr('style','display:none');return false;">&nbsp;</a>
</div>
<?php } ?>

<div class="row-fluid visible-lg visible-md" id="footer">
    <div class="container">
		<div class="footer clearfix wrap" style="margin:0 auto;">    
			<p class="footer-link">  
				<?php if(!empty($nav)): if(is_array($nav)): $k = 0; $__LIST__ = $nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$footnav): $mod = ($k % 2 );++$k; if($footnav['pid'] == 0 && $footnav['foot'] == 1){ ?>
			        	<?php if($k!=1){ ?> | <?php } ?>
			            <a href="<?php echo (get_nav_url($footnav["url"])); ?>" rel="nofollow"><?php echo ($footnav["title"]); ?></a>
			        <?php } endforeach; endif; else: echo "" ;endif; endif; ?>        
			</p>    
			<p class="copyright">
				Copyright © <?php echo date("Y");?> <a class="" href="/" title="<?php echo C('WEB_SITE_NAME');?>"><?php echo C('WEB_SITE_NAME');?></a>版权所有　<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow"><?php echo C('WEB_SITE_ICP');?></a>
				<?php echo C('TONGJI');?>
			</p>   
			<div class="safety">      
				<a class="safety1" target="_blank" rel="nofollow" title="上海市旅游行业协会在线分会" href="http://www.shtour.org/tourlist_onlineid4.html"></a>      
				<a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息" href="http://www.miibeian.gov.cn/"></a>      
				<a class="safety3" target="_blank" rel="nofollow" title="网络110报警服务" href="http://www.cyberpolice.cn"></a>      
				<a class="safety4" target="_blank" rel="nofollow" title="支付宝特约商家" href="https://www.alipay.com/aip/aip_validate_list.htm?trust_id=AIP0102495"></a>      
				<a class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a>      
				<a class="safety6" target="_blank" rel="nofollow" title="上海工商" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>      
				<a class="safety7" target="_blank" rel="nofollow" title="可信网站" href="https://ss.cnnic.cn/verifyseal.dll?sn=2010101800100002662&amp;ct=df&amp;pa=590007"></a>   
				<a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业" href="https://search.szfw.org/cert/l/CX20120921001712001762" id="___szfw_logo___" hidefocus="false"></a>      
				<a class="safety9" target="_blank" rel="nofollow" title="网络社会征信网" href="http://www.zx110.org"></a>      
				<a class="safety10" target="_blank" rel="nofollow" title="360网站安全检测" href="http://webscan.360.cn"></a>      
				<a class="safety11" target="_blank" rel="nofollow" title="网监安全" href="http://www.zx110.org/picp/?sn=310100102508"></a>   
			</div>
		</div>
		<div class="hh_cooperate">
			<!-- 友情链接 -->
			<p>
				<?php if(!empty($flink)): ?><b>友情链接：</b>
				
				<?php if(is_array($flink)): $i = 0; $__LIST__ = $flink;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$friend): $mod = ($i % 2 );++$i;?><a title="<?php echo ($friend["title"]); ?>" href="<?php echo ($friend["url"]); ?>" <?php if($friend['blank'] == 1){ ?>target="_blank"<?php } ?>><?php echo ($friend["title"]); ?></a><?php endforeach; endif; else: echo "" ;endif; endif; ?>
			</p>
			<!-- // 友情链接 -->	
			<p>
				<b>热门精选：</b>
				<a target="_blank" href="http://dujia.lvmama.com/tour/taiguo3542">泰国旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/riben3543">日本旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/hanguo3544">韩国旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/tuerqi3574">土耳其旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/ouzhou3644">欧洲旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/dibai3581">迪拜旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/aodaliya3596">澳大利亚旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/sililanka3656">斯里兰卡旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/saibandao3547">塞班岛旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/maerdaifu3546">马尔代夫旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/balidao3545">巴厘岛旅游</a>
				<a target="_blank" href="http://dujia.lvmama.com/tour/maoliqiusi3629">毛里求斯旅游</a>
			</p>
		</div>
    </div>
</div>
<div class="row-fluid hidden-lg hidden-md">
	<div class="pagebottom">
		<div class="buttons">
			<a href="//login.m.taobao.com/login.htm?tpl_redirect_url=https%3A%2F%2Fm.taobao.com%2F%23index">登录</a>
			<a href="//reg.taobao.com/member/new_register.jhtml?_devenv=MobileDeviceBrowser&amp;tg=https%3A%2F%2Fm.taobao.com%2F%23index">注册</a>
			<a href="//www.taobao.com/index.php?from=wap">电脑版</a>
			<a href="//h5.m.taobao.com/other/feedback.html?alphatext=new_h5_index">用户反馈</a>
		</div>
		<div class="copyright">&copy;&nbsp;Copyright <?php echo date("Y");?> <?php echo C('WEB_SITE_ICP');?> <a>服务中心</a></div>
	</div>
</div>
</body>
</html>