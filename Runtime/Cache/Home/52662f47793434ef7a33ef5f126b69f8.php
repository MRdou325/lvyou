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

	<link href="/lvyou/Public/Home/New/css/goods.css" rel="stylesheet" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=E4805d16520de693a3fe707cdc962045"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=E4805d16520de693a3fe707cdc962045&amp;services=&amp;t=20151113040005"></script>

   
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
          <a href="<?php echo U('Index/index');?>" title="<?php echo C('WEB_SITE_TITLE');?>">主页</a> <col-md- class="divider"></col-md->
        </li>
        <li>
          <a href="<?php echo U('Goods/cate',array('id'=>$goods['cate_id']));?>" title="<?php echo ($goods['category_name']); ?>"><?php echo ($goods['category_name']); ?></a> <col-md- class="divider"></col-md->
        </li>
        <li class="active">
          <?php echo ($goods['title']); ?>
        </li>
      </ul>
      <?php } ?>
    </div>
</div>

	
<div class="row-fluid">
  <div class="container">
    <div class="goods bg-white">
    <?php if($msg){ ?><div class="msg"><?php echo ($msg); ?></div><?php } ?>
        <!--items start-->
        <div class="destination-top col-md-12">
            <h1 class="tit col-md-12"><?php echo cutstr($cate['category_name'],100);?></h1> 
        </div>
        <div class="destination-carousel col-md-12">
            <div class="e_destination_imgbox col-md-8 col-sm-12">
                <img alt="<?php echo ($cate['category_name']); ?>" src="<?php echo ($cate['catepic_url']); ?>" >
            </div>
            <div class="e_destination_txtbox col-md-3 col-sm-12">
                <div class="b_title clrfix">
                    <h1 class="tit"><?php echo ($cate['category_name']); ?></h1>
                    <div class="entit"></div>
                </div>
               <div class="countbox">
                <div class="c_item">&nbsp;&nbsp;<?php echo ($goods['summary']); ?></div>
               </div>
            </div>
        </div>
        <div class="destination col-md-12">
            <div class="destination-left col-md-8 col-sm-12">
            </div>
            <div class="destination-right col-md-3 col-sm-12">
                <div class="baidu_map">
                    <div id="allmap"></div>
                </div>
            </div>
        </div>
        <div class="show_box fl col-md-12">
            <div class="show_body mb20 clear">
                <div class="row"><h1 class="title"><?php if($goods['tid'] > 0){ ?><strong>&lt;<?php echo ($goods['tname']); ?>&gt;</strong><?php } echo cutstr($goods['title'],100);?></h1></div>
                <div class="show_img fl">
                    <a class="show_big buy" title="<?php echo ($goods_name); ?>">
                        <img alt="<?php echo ($goods['title']); ?>" src="<?php echo ($goods['pic_url']); ?>" >
                    </a>
                    <!-- JiaThis Button BEGIN -->
                    <div class="jiathis_style">
                        <a class="jiathis_button_qzone"></a>
                        <a class="jiathis_button_tsina"></a>
                        <a class="jiathis_button_tqq"></a>
                        <a class="jiathis_button_weixin"></a>
                        <a class="jiathis_button_renren"></a>
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                        <a class="jiathis_counter_style"></a>
                    </div>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                    <!-- JiaThis Button END -->
                </div>
                <div class="price-info goods-info pr  fl">
                <?php if($goods['goods_type']==1){ ?>
                    <ul>
                        <li>门 市 价: <del id="price">￥<?php echo ($goods['price']); ?></del>&nbsp;&nbsp;&nbsp;<em><b id="price_cncn"><?php echo sprintf( "%.2f",$goods['discount_price']/$goods['price'])*10; ?>折</b></em></li>                                                                    
                        <li class="price" style="width:100% !important;">优 惠 价: <em>￥<b id="price_cncn"><?php echo ($goods['discount_price']); ?></b></em>&nbsp;元&nbsp;&nbsp;&nbsp;<?php if($goods['child_price'] > 0){ ?>儿童价：<em>￥<b id="price_cncn_child"><?php echo ($goods['child_price']); ?></b></em>&nbsp;元<?php } ?></li>
                        <li>发团日期: 指定日期，请提前<strong><?php echo ($goods["aheaddays"]); ?></strong>天报名</li>
                        <li>出发城市: <?php echo ($goods['city']); ?></li>
                        <li>行程天数: <?php echo ($goods['days']); ?>天</li>
                        <li>交通方式: <?php echo ($goods['traffic']); ?></li>
                        <?php if(!empty($tags)): ?><li class="tag">产品提示：
                            <?php if(is_array($tags)): $i = 0; $__LIST__ = $tags;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tag): $mod = ($i % 2 );++$i;?><span><?php if($tag["pic_url"] != ''){ ?><img title="<?php echo ($tag["name"]); ?>" alt="<?php echo ($tag["name"]); ?>" src="<?php echo (get_image_url($tag["pic_url"])); ?>"><?php }else{ echo ($tag["name"]); } ?></span><?php endforeach; endif; else: echo "" ;endif; ?>
                        </li><?php endif; ?>
                    </ul>
                    <?php }else{ ?>
                        <ul class="txt">
                            <li class="price">优 惠 价: <em>￥<b><?php echo ($goods['discount_price']); ?></b></em>&nbsp;元</li>
                            <li class="price mt3">门 市 价: <del>￥<?php echo ($goods['price']); ?></del>&nbsp;&nbsp;元</li>
                            <li><span>办理时间:</span><?php echo ($goods['days']); ?>天</li>                        
                            <li><span>邀 请 函:</span><?php if($goods['invite']==2){ ?>不<?php } ?>需要</li>                        
                            <li><span>有 效 期:</span><?php echo ($goods["aheaddays"]); ?>天</li>                        
                            <li><span>所属领区:</span><?php echo ($goods['city']); ?></li>                        
                            <li><span>最多停留:</span><?php echo ($goods["maxdays"]); ?>天</li>                        
                            <li><span>面&nbsp;&nbsp;&nbsp;&nbsp;试:</span><?php if($goods['audition']==2){ ?>不<?php } ?>需要</li>                        
                            <li><span>受理范围:</span><?php echo ($goods['traffic']); ?></li>
                        </ul>
                    <?php } ?>
                    <div class="button">
                        <p class="btn">
                            <a class="go_btn buy fl" rel="nofollow" onclick="ShowDiv(baom)">
                                <span>马上报名&gt;&gt;</span>
                            </a>
                        </p>
                        <s class="tel">或直接拨打<em><?php echo C('WEB_SITE_TEL');?></em>咨询/预订</s>
                </div>
                    <p class="btn" style="display:block">
                    <a class="y-like my-like mt5 fl item-like-btn" href="javascript:;" onclick="favor(<?php echo ($goods['goods_id']); ?>)">
                            <em class="icon icon-k"></em>收藏</a> 
                    </p>
                </div>
            </div>
        </div>
        <div>
            <div class="bady-part col-md-9">
                <div class="bady-tab bady_bg clear" id="bady-tab">
                    <ul class="fl" id="tabs">
                        <li><a title="tab1">商品详情</a></li>
                        <?php if(is_array($goods_extra)): $k = 0; $__LIST__ = $goods_extra;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$extra): $mod = ($k % 2 );++$k;?><li><a title="tab<?php echo ($k+1); ?>"><?php echo ($extra["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                    <div class="gobuy fr buy">
                        <p class="price fl">
                            <em class="yang">￥</em>
                            <span class="jd-current"><?php echo ($goods['discount_price']); ?></span></p>
                            <a class="btn  fl" rel="nofollow" onclick="ShowDiv(baom)">
                            <span>马上报名&gt;&gt;</span>
                        </a>
                    </div>
                </div>

                <div class="con">
                    <div id="content">
                        <div id="tab1" class="tab">
                            <?php echo ($goods['item_body']); ?>
                        </div>
                        <?php if(is_array($goods_extra)): $k = 0; $__LIST__ = $goods_extra;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$extra): $mod = ($k % 2 );++$k;?><div id="tab<?php echo ($k+1); ?>" class="tab">
                                <?php echo ($extra["content"]); ?>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>

                </div>
                <script>
                    $(document).ready(function() {
                        $("#content div.tab").hide(); // Initially hide all content
                        $("#tabs li a:first").attr("class","active"); // Activate first tab
                        $("#content div:first").fadeIn(); // Show first tab content
                        
                        $('#tabs a').click(function(e) {
                            e.preventDefault();        
                            $("#content div.tab").hide(); //Hide all content
                            $("#tabs li a").attr("class",""); //Reset id's
                            $(this).parent().find("a").attr("class","active"); // Activate this
                            $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
                        });
                        $('#add_goods').click(function(e) {
                            e.preventDefault();        
                            $("#content div.tab").hide(); //Hide all content
                            $("#tabs li a").attr("class",""); //Reset id's
                            //$(this).parent().find("a").attr("class","active"); // Activate this
                            $('#tab0').fadeIn(); // Show content for current tab
                        });
                    });
                </script>
            </div>
            <div class="hot_box fr col-md-3">
                <div class="hot_goods">
                    <h3>
                        <div class="line"></div>
                        <div class="line-txt">HOT同类热卖</div>
                    </h3>
                    <?php if(is_array($hot_goods)): $i = 0; $__LIST__ = $hot_goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div>
                            <a target="_blank" href="<?php echo U('goods/info',array('id'=>$v['goods_id']));?>">
                                <img src="<?php echo ($v["pic_url"]); ?>" alt="<?php echo ($v["title"]); ?>">
                                <div class="hot_price">
                                    <em class="hot_yang">￥</em>
                                    <em class="hot_num"><?php echo ($v["discount_price"]); ?></em>
                                </div>
                            </a>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- /主体 -->
    <script type="text/javascript" src="/lvyou/Public/Home/js/jquery.sticky.js"></script>
    <script type="text/javascript"> // sticky nav bar 
      $(function(){
        $("div#bady-tab").sticky({topSpacing:0});
      });
    </script>

</div>
<div id="baom" style="display:none">
<div id="baom_bg" onclick="CloseDiv()"></div>
<script language="javascript" type="text/javascript" src="/lvyou/Public/Home/js/WdatePicker.js"></script>
    <div id="bao_content">
    <div class="close" id="close" onclick="CloseDiv()" title="关闭">X</div>
    <form action="<?php echo U('Goods/info',array('id'=>$goods['goods_id'],'add'=>'do'));?>" method="post">
    <ul>
        <li>
            <h2>&nbsp;===&nbsp;旅游在线预定&nbsp;===</h2>
        </li>
        <li>
            <label class="normal">旅游线路：</label>
            <input class="normal-input title" readonly="" value="<?php echo ($goods["title"]); ?>"  autocomplete="off" type="text">
        </li>
        <li>
            <label class="normal">出游时间：</label>
            <input value="" class="normal-input" id="time" placeholder="请选择出行时间" name="time" autocomplete="off" type="text" onClick="WdatePicker({minDate:'%y-%M-%d'})">
        </li>
        <li>
            <label class="normal">成人数：</label>
            <input value="1" class="normal-input" id="num" placeholder="/人" name="num" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;成人价：<font color="#f53"><?php echo ($goods["discount_price"]); ?>元/人</font>
        </li>
        <li>
            <label class="normal">小孩数：</label>
            <input value="0" class="normal-input" id="child" placeholder="/人" name="child" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;小孩价： <font color="#f53"><?php echo ($goods["child_price"]); ?>元/人</font><br>&nbsp;&nbsp;&nbsp;&nbsp;（12周岁以下为小孩）
        </li>
        <li>
            <label class="normal">您的姓名：</label>
            <input value="" class="normal-input" id="name" placeholder="请输入您的姓名" name="name" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 正确的联系人能帮助我们更快的联系到您
        </li>
        <li>
            <label class="normal">您的电话：</label>
            <input value="" class="normal-input" id="tel" placeholder="请输入您的手机号" name="tel" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 推存填写手机号码，方便我们联系到您
        </li>
        <li>
            <label class="normal">您的邮件：</label>
            <input value="" class="normal-input" id="email" placeholder="请输入您的邮箱" name="email" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 请填写你常用的邮箱，及时收取旅游优惠信息！
        </li>
        <li>
            <label class="normal">您的地址：</label>
            <input value="" class="normal-input" id="address" placeholder="请输入您的地址" name="address" autocomplete="off" type="text">
            &nbsp;&nbsp;&nbsp;&nbsp;* 非常重要，方便我们上门接送！
        </li>
        <li>
            <label class="normal">备注信息：</label>
            <textarea name="desc">请填写您的留言</textarea>
        </li>
        <li>
            <label class="normal"></label>
            <div class="btn">
                <input class="sub smt-o" value="提交" autocomplete="off" type="submit">
            </div>
        </li>
    </ul>
    </form>
    </div>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script>
    <script type="text/javascript">
//弹出隐藏层
function ShowDiv(show_div){
    $("#baom").css("display","block");//.css("width","100%").css("height","100%");
};
//关闭弹出层
function CloseDiv()
{
     $("#baom").css("display","none");
};
$().ready(function(){
    $("#time").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#num").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#child").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#name").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#tel").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#email").blur(function(){if($(this).val() == "") $(this).focus()});
    $("#address").blur(function(){if($(this).val() == "") $(this).focus()});

    $(".sub").click(function(){
        if($("#time").val() == ""){
            $("#time").focus();
            return false;
        }
        if($("#num").val() == ""){
            $("#num").focus();
            return false;
        }
        if($("#child").val() == ""){ 
            $("#child").focus();
            return false;
        }
        if($("#name").val() == ""){
            $("#name").focus();
            return false;
        }
        if($("#tel").val() == ""){
            $("#tel").focus();
            return false;
        }
        if($("#email").val() == ""){
            $("#email").focus();
            return false;
        }
        if($("#address").val() == ""){
            $("#address").focus();
            return false;
        }
    });
});
</script>
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