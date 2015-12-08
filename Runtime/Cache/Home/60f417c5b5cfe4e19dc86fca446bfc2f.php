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

	
	 <?php if(C('BANNER_OPEN') == 1 && count($banner) > 0){ ?>
	   <div id="banner"  class="row-fluid">
<div class="container">
  <?php if($is_home_banner == 1){ ?>
	<div class="col-xs-12 col-md-3 banner-navbar">
    <ul class="all-cate-box">
      <?php if(is_array($category_List)): $i = 0; $__LIST__ = $category_List;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cl): $mod = ($i % 2 );++$i; if($cl['is_home_banner'] ==1){ ?>
        <li>
          <a href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>"><?php echo ($cl["category_name"]); ?></a>
          <i class="glyphicon glyphicon-chevron-right"></i>
          <?php if(!empty($cl['category_child'])): if($cl['is_home_banner_type']==2){ ?>
              <div class="sub-nav-0 visible-md visible-lg banner_sub_nav">
              <div class="rn_top">
  <ul>
    <li>
      <a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/5.html" class="mon"> 5<h5>月</h5></a>
      <a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/5.html" target="_blank"><img src="http://www.etimehouse.com/Uploads/ggimg/20150723/55b046e706fed.jpg" alt="苏马荡：清凉舒适的夏季" width="100%" height="160"></a>
      <a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/5.html" target="_blank" class="img-link">苏马荡：清凉舒适的夏季</a>                      
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/17.html" target="_blank">大峡谷</a>：心灵与视觉的洗礼。</span><br>
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/8.html" target="_blank">将军岩</a>：壶口秋风，大气磅礴。</span><br>
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/9.html" target="_blank">鱼木寨</a>：聆听初秋的心跳。</span>
    </li>
    <li>
      <a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/6.html" class="mon"> 6<h5>月</h5></a>
      <a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/6.html" target="_blank"><img src="http://www.etimehouse.com/Uploads/ggimg/20150723/55b047049f731.jpg" alt="腾龙洞：国家AAAA级旅游景区" width="100%" height="160"></a>
      <a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/6.html" target="_blank" class="img-link">腾龙洞：国家AAAA级旅游景区</a>                      
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/11.html" target="_blank">大水井</a>：红叶在湖光流韵间漂浮。</span><br>
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/12.html" target="_blank">佛宝山</a>：等待一场浪漫邂逅。</span><br>
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/13.html" target="_blank">垭石林</a>：蓝绿相接，骏马嘶鸣。</span>
    </li>
  </ul>
  <a href="/index.php/home/lhyt/lp_lists.shtml"><img src="/Public/Index/images/dc/tuangou.jpg" width="50%" height="274" style="float:right;" alt="林海云天广告"></a>
</div>

<div class="rn_bom">
  <ul>
    <li>
      <a class="msgw">美食</a>
      <img src="/Public/Index/images/ms.jpg" alt="美食">
      <span><a href="/index.php/home/img/index.shtml">苏马荡</a>：大饱口福的各色美食</span>
      <span><a href="/index.php/home/img/index.shtml">利川</a>：灵魂都是麻辣味</span>
      <span><a href="/index.php/home/img/index.shtml">成都</a>：泡菜的新鲜之旅</span>
    </li>
    <li>
      <a class="msgw">美景</a>
      <img src="/Public/Index/images/gw.jpg" alt="购物">
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/6.html">腾龙洞</a>：世界特级溶洞</span>
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/15.html">朝天门</a>：嘉陵江与长江交汇</span>
      <span><a href="http://www.etimehouse.com/index.php/Home/Travel/destination/id/16.html">天坑地缝</a>：旅游、渡假、科考</span>
    </li>
  </ul>
  <a href="http://www.tuniu.com/"><img src="/Public/Index/images/tnny.gif" width="190" height="80" style="float:right;margin-top:20px;" alt="林海云天广告"></a>
  <a href="http://www.sxcm.net/"><img src="/Public/Index/images/sxdsb.gif" width="190" height="80" style="float:right;margin-top:20px;margin-left:6px;" alt="林海云天广告"></a>
</div>

            <?php }else if($cl['is_home_banner_type']==1){ ?>
              <div class="sub-nav-0 visible-md visible-lg banner_sub_nav_img">
              <ul>
	<?php if(is_array($cl['goods'])): $i = 0; $__LIST__ = $cl['goods'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$good): $mod = ($i % 2 );++$i;?><li>
		<a href="<?php echo U('goods/info', array('id' => $good['goods_id']));?>" title="<?php echo ($good["title"]); ?>" class="img">
			<img alt="<?php echo ($good["title"]); ?>" title="<?php echo ($good["title"]); ?>" src="<?php echo ($good["pic_url"]); ?>" original="<?php echo ($good["pic_url"]); ?>" style="display: inline;" width="252" >
		</a>
		<p><a href="<?php echo U('goods/info', array('id' => $good['goods_id']));?>" title="<?php echo ($good["title"]); ?>"><?php echo ($good["title"]); ?></a></p>
	</li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
            <?php }else{ ?>
              <div class="sub-nav-0 visible-md visible-lg banner_sub_nav_txt">
              <ul>
  <?php if(is_array($cl['category_child'])): $i = 0; $__LIST__ = $cl['category_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cc): $mod = ($i % 2 );++$i;?><li class="title"><h4><?php echo ($cc["category_name"]); ?>推荐</h4></li>
    <li>
      <a href="<?php echo U('goods/cate',array('id'=>$cc['id']));?>" title="<?php echo ($cc["category_name"]); ?>" target="_blank"><label><?php echo ($cc["category_name"]); ?>：</label></a>
      <a href="/index.php/home/travel/destination/id/14.shtml" target="_blank" id="s-a">洪崖洞</a>						
      <a href="/index.php/home/travel/destination/id/11.shtml" target="_blank" id="s-a">大水井</a>						
      <a href="/index.php/home/travel/destination/id/10.shtml" target="_blank" id="s-a">朝阳洞</a>												
      <a href="/index.php/home/travel/destination/id/9.shtml" target="_blank">鱼木寨</a>						
      <a href="/index.php/home/travel/destination/id/8.shtml" target="_blank">将军岩</a>						                  
    </li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
            <?php } ?>
            </div><?php endif; ?>
        </li>
      <?php } endforeach; endif; else: echo "" ;endif; ?>
    </ul>
	</div>
<?php } ?>
<?php if(count($banner) ==1){ ?>
	<?php if(is_array($banner)): $i = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><div class="col-xs-12 col-md-9 banner-slide"><img title="<?php echo ($data["title"]); ?>" alt="<?php echo ($data["title"]); ?>" src="<?php echo ($data["image"]); ?>" width="100%" /></div><?php endforeach; endif; else: echo "" ;endif; ?>
<?php }else{ ?>
	<div id="myCarousel" class="carousel slide col-xs-12 col-md-9 banner-slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>   
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<?php if(is_array($banner)): $k = 0; $__LIST__ = $banner;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($k % 2 );++$k;?><div class="item<?php if($k == 1){ ?> active<?php } ?>">
					<img src="<?php echo ($data["image"]); ?>" alt="<?php echo ($data["title"]); ?>" title="<?php echo ($data["title"]); ?>" />
				</div><?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev"></a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next"></a>
	</div> 
<?php } ?>
</div>
</div>
	 <?php } ?>
    <div class="row-fluid">
        <div class="container">
        <div class="bg-white">
            <div class="col-md-3 col-xs-12 tuijian">
                <h2>标题</h2>
                <p>
                    本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
                </p>
            </div>
            <div class="col-md-6 col-xs-12 tuijian">
                <h2>标题</h2>
                <p>
                    本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
                </p>
            </div>
            <div class="col-md-3 col-xs-12 tuijian">
                <h2>标题</h2>
                <ol>
                    <li>
                        新闻资讯
                    </li>
                    <li>
                        体育竞技
                    </li>
                    <li>
                        娱乐八卦
                    </li>
                    <li>
                        前沿科技
                    </li>
                    <li>
                        环球财经
                    </li>
                    <li>
                        天气预报
                    </li>
                    <li>
                        房产家居
                    </li>
                    <li>
                        网络游戏
                    </li>
                </ol>
            </div>
            <div class="clear"></div>
        </div>
        </div>
    </div>
    <div class="row margin-top-20">
        <div class="container">
            <div class="col-md-12 product-tabs">
                <ul id="myTab" class="nav nav-tabs">
                <?php if(is_array($category_List)): $k = 0; $__LIST__ = $category_List;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cl): $mod = ($k % 2 );++$k; if($cl['is_home'] == 1){ ?>
                   <li <?php if($cl['key'] == 1){ ?>class="active"<?php } ?>><a href="#<?php echo ($cl['sku']); ?>" data-toggle="tab"><?php echo ($cl["category_name"]); ?></a></li>
                <?php } endforeach; endif; else: echo "" ;endif; ?>
                </ul>
                <div id="myTabContent" class="tab-content">
                <?php if(is_array($category_List)): $k = 0; $__LIST__ = $category_List;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cl): $mod = ($k % 2 );++$k; if($cl['is_home'] == 1){ ?>
                    <div class="tab-pane fade <?php if($cl['key'] == 1){ ?>in active<?php } ?>" id="<?php echo ($cl['sku']); ?>">
                    <?php if(is_array($cl['goods'])): $i = 0; $__LIST__ = $cl['goods'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$good): $mod = ($i % 2 );++$i;?><div class="product_item col-md-3 col-sm-6 col-xs-12">
                            <div class="img">
                                <img alt="<?php echo ($good["title"]); ?>" title="<?php echo ($good["title"]); ?>" src="<?php echo ($good["pic_url"]); ?>" original="<?php echo ($good["pic_url"]); ?>" style="display: inline;">
                            </div>
                            <p><?php echo ($good["title"]); ?></p>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    <div class="clear"></div>
                    </div>
                <?php } endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
    </div>
	 <div class="container">
	 	<?php if(is_array($category_List)): $i = 0; $__LIST__ = $category_List;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cl): $mod = ($i % 2 );++$i;?><div class="pro_item <?php echo ($cl['color']); if($cl["num"] < 5){ ?> pro4<?php } ?>" tag="<?php echo ($cl["category_name"]); ?>">
            <div class="hd">
                <h3 <?php if(!empty($cl['catepic_url'])): ?>style="background-image:url(<?php echo ($cl['catepic_url']); ?>)"<?php endif; ?>><a href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>" title="<?php echo ($cl["category_name"]); ?>" target="_blank"><?php echo ($cl["category_name"]); ?></a></h3>
                <div class="more" style="overflow:hidden">
                    <a class="first" href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>" title="<?php echo ($cl["category_name"]); ?>" target="_blank">精选</a>
                    <?php if(is_array($cl['category_child'])): $i = 0; $__LIST__ = $cl['category_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cc): $mod = ($i % 2 );++$i;?><a href="<?php echo U('goods/cate',array('id'=>$cc['id']));?>" title="<?php echo ($cc["category_name"]); ?>" target="_blank"><?php echo ($cc["category_name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <a class="more_link" href="<?php echo U('goods/cate',array('id'=>$cl['id']));?>" target="_blank">更多&gt;&gt;</a>
            </div>
            <div class="bd">
                <div class="left_img">
                <?php if(!empty($cl['ad_url'])): ?><img src="<?php echo ($cl['ad_url']); ?>" title="<?php echo ($cl["category_name"]); ?>" alt="<?php echo ($cl["category_name"]); ?>" original="<?php echo ($cl['ad_url']); ?>" style="display: inline;">
                <?php else: ?>
                    <img src="http://xnxwcdn.cncn.net/images/front/home30/pic_404_travel.jpg" title="<?php echo ($cl["category_name"]); ?>" alt="<?php echo ($cl["category_name"]); ?>" original="http://xnxwcdn.cncn.net/images/front/home30/pic_404_travel.jpg" style="display: inline;"><?php endif; ?>
                </div>
                <div class="pro_list">
                	<?php if(is_array($cl['goods'])): $i = 0; $__LIST__ = $cl['goods'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$good): $mod = ($i % 2 );++$i;?><div class="pro_box">
                        <a href="<?php echo U('goods/info', array('id' => $good['goods_id']));?>" target="_blank">
                            <div class="pro_border">
                                <div class="img">
                                    <img alt="<?php echo ($good["title"]); ?>" title="<?php echo ($good["title"]); ?>" src="<?php echo ($good["pic_url"]); ?>" original="<?php echo ($good["pic_url"]); ?>" style="display: inline;">
                                </div>
                                <p><?php echo ($good["title"]); ?></p>
                                <?php if($good["discount_price"] > 0){ ?>
                                <span class="price">
                                    <b><i>￥</i><?php echo ($good["discount_price"]); ?></b>
                                </span>
                                <span class="save">
                                    <b>省</b>￥<?php echo ($good['price']-$good['discount_price']); ?>
                                </span>
                                <?php }else{ ?>
                                <span class="price">
                                    <b><i>￥</i><del><?php echo ($good["price"]); ?></del></b>
                                </span>
                                <?php } ?>
                            </div>
                            <span class="link"></span>
                        </a>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div><?php endforeach; endif; else: echo "" ;endif; ?>
	 
	 	<div class="col-md-9">
	 		<div class="box540">
                <div class="page-tab">
                    <span class="more"><a href="about" target="_blank" id="link_more">更多&gt;&gt;</a><i></i></span>
                    <?php if(is_array($defpage)): $i = 0; $__LIST__ = $defpage;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$page): $mod = ($i % 2 );++$i;?><a class="tab" href="<?php echo U('Page/index',array('id'=>$page['id']));?>" target="_blank" data-link="about" data-val="<?php echo ($page['id']); ?>"><?php echo ($page["name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div class="page-con">
                	<?php if(is_array($defpage)): $i = 0; $__LIST__ = $defpage;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$page): $mod = ($i % 2 );++$i;?><div class="tu_wen J_t_con con<?php echo ($page['id']); ?>" style="display: block;">
                    	<?php echo ($page["content"]); ?>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>

            	<script>
                    $(document).ready(function() {
                        $(".page-con div.tu_wen").hide(); // Initially hide all content
                        $(".page-tab a.tab:first").attr("class","tab on"); // Activate first tab
                        $(".page-con div.tu_wen:first").fadeIn(); // Show first tab content
                        
                        $('.page-tab a.tab').mouseover(function(e) {
                            e.preventDefault();        
                            $(".page-con div.tu_wen").hide(); //Hide all content
                            $(".page-tab a.tab").attr("class","tab"); //Reset id's
                            $(this).attr("class","tab on"); // Activate this
                            $('.page-con div.con' + $(this).attr('data-val')).fadeIn(); // Show content for current tab
                        });
                    });
                </script>
	 	</div>
	 	<div class="col-md-3">
            <div class="box240">
                <div class="tit">
                <strong>最近预订</strong>
                </div>
                <div class="txt order">
                    <ul>
                    <?php if(!empty($orders)): if(is_array($orders)): $i = 0; $__LIST__ = $orders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$order): $mod = ($i % 2 );++$i;?><li><i></i><?php echo (mb_substr($order["name"],0,1,'utf-8')); ?>**&nbsp;&nbsp;预订了仅<em><?php echo ($order['discount_price']?$order['discount_price']:$order['price']); ?></em>元的
							<a href="<?php echo U('Goods/info',array('id'=> $order["goods_id"]));?>" title="<?php echo ($order["goods_name"]); ?>" target="_blank"><?php echo ($order["goods_name"]); ?></a>
						</li><?php endforeach; endif; else: echo "" ;endif; ?>
					<?php else: ?>
						<li><i></i> 暂时还没有订单!</li><?php endif; ?>
					</ul>
                </div>
            </div>
	 	</div>
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