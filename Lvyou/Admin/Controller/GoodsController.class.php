<?php
namespace Admin\Controller;

use Admin\Controller\AdminController;
use Admin\Model\GoodsModel;
use Admin\Model\TagModel;
class GoodsController extends AdminController
{
    public function index(){
       $cateId = I('cate_id');
       if($cateId>0){
           $where = array('cate_id'=>$cateId);
       }
        $goodsList = $this->lists('Goods',$where,'sort desc , goods_id desc',array());
        $this->assign('goodsList', $goodsList);
        $this->assign('category',D('CategoryGoods')->getGoodsCategory(1));
        $this->display();
    }
    public function edit(){
        $goodsId = I('goods_id');
        if(IS_POST){
            $p['title'] = I('title');
            $p['goods_type'] = I('goods_type');
            $p['cate_id'] = I('cate_id');
            $p['tid'] = I('tid');
            $p['seo_title'] = I('seo_title');
            $p['seo_keywords'] = I('seo_keywords');
            $p['seo_description'] = I('seo_description');
            $p['price'] = I('post.price', 0.00, 'floatval');
            $p['discount_price'] = I('post.discount_price', 0.00, 'floatval');
            $p['child_price'] = I('child_price', 0.00, 'floatval');
            $p['city'] = I('city');
            $p['days'] = I('days');
            $p['aheaddays'] = I('aheaddays');
            $p['traffic'] = I('traffic');
            $p['volume'] = I('volume');
            $p['status'] = I('status');
            $p['item_body'] = I('item_body');
            $p['maxdays'] = I('maxdays');
            $p['audition'] = I('audition');
            $p['invite'] = I('invite');
            
            $p['pic_url'] = I('pic_url');
            $p["add_id"] = session('user_auth_admin.uid');
            $p["add_uname"] = session('user_auth_admin.username');
            $tag = I('tag');
            $p['tags'] = implode($tag, ",");
            $GoodsModel = new GoodsModel();
            $GoodsModel->addTags($tag, $goodsId);
        
            if (!$p['title'])
                $this->error('请填写商品名称');
            if (!$p['price'])
                $this->error('请填写商品价格');
            if (!$p['cate_id'])
                $this->error('请填选择分类');
        
            if (empty($goodsId) && empty($p['pic_url'])) {
                $this->error('请上传商品图片');
            }
        
           

            $goodsM = D('goods');
            if (empty($goodsId)) {
                $goodsM->add($p);
            } else {
                $goodsM->where("goods_id='{$goodsId}'")->save($p);
            }
            $this->success('操作成功',U('index'));
        }
       
       
        $category = D('CategoryGoods')->getCategoryList();
        $this->assign('mytag', explode(",", D('Goods')->getGoodsInfo($goodsId,"tags")));
        $this->assign('tags', M('tag')->select());
        $this->assign('category', $category);
        $this->assign('topic',M('topic')->where("state=1")->select());
        $this->assign('sid', $sid);
        $this->assign('goodstype', M('goods_type')->where("status > 0")->order("sort")->select());
        $this->assign('goods_id', $goodsId);
        $this->assign('goods', M('goods')->find($goodsId));
        $this->display();
    }
    public function status($status = 0){
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $where['goods_id'] =   array('in',$id);
      
        $goods = D('Goods')->getGoodsById($goodsId);
        $GoodsModel = new GoodsModel();
         $GoodsModel->where($where)->save(array('status'=>$status ? 0 : 1));
     
        $this->success('操作成功',U('Goods/index'));
    }
    public function del(){
        $id = array_unique((array)I('id',0));       
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $where['goods_id'] =   array('in',$id);
        if(M('Goods')->where($where)->delete()){
             $this->success('操作成功');
        }else {
            $this->error('删除失败');
        }
    }

    public function extra()
    {
        $goodsId = I('goods_id');
        $extra = M("goods_extra")->where(array("goods_id" => $goodsId))->select();
        $this->assign("goods_id", $goodsId);
        $this->assign("extralist", $extra);
        $this->display();
    }

    public function extraedit(){
        $goodsId = I('goods_id');
        $Id = I('id');
        if(IS_POST){
            $p['name'] = I('name');
            $p['sort'] = I('sort');
            $p['status'] = I('status');
            $p['goods_id'] = I('goods_id');
            $p['content'] = I('content');
            if (empty($Id)) {
                M('goods_extra')->add($p);
            } else {
                M('goods_extra')->where("id='{$Id}'")->save($p);
            }
            $this->success('操作成功',U('extra',array("goods_id" => $goodsId)));
        }
        $this->assign('id', $Id);
        $this->assign("goods_id", $goodsId);
        $this->assign('extra', M('goods_extra')->find($Id));
        $this->display();
    }
    
    public function extrastatus($id){
         
        $goods_extra = M('goods_extra')->find($id);
        M('goods_extra')->where("id='{$id}'")->save(array('status'=>$goods_extra['status']==1?0:1));
        $this->success('操作成功',U('extra', array("goods_id" => $goods_extra['goods_id'])));
    }

    public function goodstype(){
        $this->assign("goods_type", M('goods_type')->where('status > 0')->order("sort")->select());
        $this->display();
    }

    public function goodstypeedit(){
        $Id = I('id');
        if(IS_POST){
            $p['name'] = I('name');
            $p['sort'] = I('sort');
            $p['status'] = I('status');
            if (empty($Id)) {
                M('goods_extra')->add($p);
            } else {
                M('goods_extra')->where("id='{$Id}'")->save($p);
            }
            $this->success('操作成功',U('goodstype'));
        }
        $this->assign('id', $Id);
        $this->assign("goods_id", $goodsId);
        $this->assign('goods_type', M('goods_type')->find($Id));
        $this->display();
    }
	
	public function newsedit()
	{
		$Id = I('id');
        if(IS_POST){
            $p['title'] = I('title');
            $p['cate_id'] = I('cate_id');
            $p['pic'] = I('pic');
			$p['summary'] = I('summary');
			$p['content'] = I('content');
			$p['source'] = I('source');
			$p['status'] = I('status');
			$p['time'] = I('status');
            if (empty($Id)) {
                M('news')->add($p);
            } else {
                M('news')->where("id='{$Id}'")->save($p);
            }
            $this->success('操作成功',U('news'));
        }
        $this->assign('id', $Id);
        $this->assign('tags', M('tag')->select());
        $this->assign('category', D('CategoryGoods')->getCategoryList());
        $this->display();
	}
}

?>