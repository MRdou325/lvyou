<?php
namespace Home\Controller;
class ArticleController extends HomeController {
    public function artList(){
        $sort_id = ggp('id:i');        
        $this->a('sort_id',$sort_id);
        $where = "sort_id='{$sort_id}' and state=1";
        $count = M('article')->where($where)->count();
        $listRows = 10;
        $totalPage = ceil($count/$listRows);
        $this->a('totalpage',$totalPage);
        
        $page = $this->iniPage($count,$listRows);
        $artList = M('article')->where($where)->limit("{$page->firstRow},{$page->listRows}")->select();
        $this->a('artList',$artList);
        $this->a('nowpage',ggp('p:i'));
        $this->d(ggp('ajax')?'ajaxartlist':'');
    }
    
    public function detail(){
        $aid = ggp('aid:i');
        $detail = ArticleModel::I()->find($aid);
        $sort = D('Sort')->find($detail['sort_id']);
        $this->a('$sort',$sort);
        $this->a('$detail',$detail);
        $this->d();
    }
}