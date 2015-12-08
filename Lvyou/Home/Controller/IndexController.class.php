<?php
namespace Home\Controller;
use Home\Model;
use Home\Model\GoodsModel;
use Home\Model\CategoryGoodsModel;
class IndexController extends HomeController {

    function __construct() {
        parent::__construct();
    }

    public function index() {
        $bannerarr = M('banner')->where(array('status' => 1))->order("`sort` ASC")->select();
        $bannerlist = array();
        foreach ($bannerarr as $key => $data) {
            $text = explode("|", $data["content"]);
            $content = array();
            foreach ($text as $k => $v) {
                $vv = explode(":", $v);
                if(count($vv) >= 2){
                    $content[$k]["txt"] = $vv[0];
                    $content[$k]["time"] = $vv[1];
                }
            }
            $data["content"] = $content;
            $bannerlist[] = $data;
        }
        $where_ad['state'] = 1;
        $ad_arr = M('ad')->where($where_ad)->order("`order` DESC")->select();
        foreach ($ad_arr as $k => $v) {
            if ($v['type'] == 1) {
                $focus[] = $v;
            } elseif ($v['type'] == 2) {
                $flink[] = $v;
            }
        }

        $category_good = M("category_goods")->where(array("status" => 1, "p_id" => 0))->where("is_home = 1 or is_home_banner = 1")->order("sort ASC")->select();
        $cglist = array();
        $GoodsModel = new GoodsModel();
        $is_home_banner = 0;
        $is_one = 0;
        foreach ($category_good as $key => $v) {
            $data = array();
            $data['id'] = $v["id"];
            $data['category_name'] = $v["category_name"];
            $data['num'] = $v["home_num"];
            $data['catepic_url'] = $v["catepic_url"];
            $data['ad_url'] = $v["ad_url"];
            $data['color'] = $v["color"];
            $data['sku'] = $v["sku"];
            $data['is_home_banner'] = $v["is_home_banner"];
            $data['is_home'] = $v['is_home'];
            $data['is_home_banner_type'] = $v['is_home_banner_type'];
            $data['key'] = 0;
            $category_child = M("category_goods")->where(array("status" => 1, "p_id" => $v["id"]))->field("id,category_name,is_home")->select();
            $cids = $v["id"];
            foreach ($category_child as $vv) {
                $cids .= ',' . $vv["id"];
                if($vv["is_home"] == 1){
                    $data["category_child"][] = $vv;
                }
            }
            if($data['is_home_banner']==1 && $is_home_banner == 0)
            {
                $is_home_banner = 1;
            }
            if($data['is_home']==1 && $is_one == 0)
            {
                $data['key'] = 1;
                $is_one = 1;
            }
            $where = 'status = 1 and cate_id in (' . $cids . ')';
            $data["goods"] = $GoodsModel->getGoods($v["home_num"], $where);
            $cglist[] = $data;
        }
        $defpage = array();
        $cate = M('category')->where(array('status'=>1,'ishome'=>1))->order("sort")->select();
        foreach ($cate as $key => $value) {
            $data = array();
            $data["id"] = $value["id"];
            $data["name"] = $value["title"];
            $data["pic"] = $value["icon"];
            $data["type"] = 2;
            $data["content"] = M('document')->where(array('status'=>1,'category_id'=>$value["id"]))->limit($value["list_row"])->select();
            $defpage[] = $data;
        }
        $page = M('page')->where(array('status'=>1,'ishome'=>1))->order("sort")->select();
        foreach ($page as $key => $value) {
            $data = array();
            $data["id"] = $value["id"];
            $data["name"] = $value["name"];
            $data["type"] = 1;
            $data["content"] = $value["content"];
            $defpage[] = $data;
        }
        $CategoryGoodsModel = new CategoryGoodsModel();
        $categorygoods = $CategoryGoodsModel->getCategoryChildList(0,1);
        $this->assign('defpage', $defpage);
        $this->assign('is_home_banner', $is_home_banner);
        $this->assign('orders', M('orders')->order('createtime DESC')->limit(12)->select());
        $this->assign('category_List', $cglist);
        $this->assign('banner', $bannerlist);
        $this->assign('categorygoods', $categorygoods);
        $this->assign('ishome', true);
        $this->display();
    }
}