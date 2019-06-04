<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Config;
use think\facade\Session;

class Index extends Base
{	
    public function index()
    {
        $user_id = Session::get('user_id');

        $project = Db::name('relation')
            ->alias('r')
            ->join('project p','p.project_id=r.project_id')
            ->join('interface i','i.project_id=p.project_id')
            ->where('r.user_id',$user_id)
            ->where('p.is_delete',0)
            ->where('p.is_disable',0)
            ->where('i.is_delete',0)
            ->where('i.is_disable',0)
            ->order('p.project_id desc')
            ->group('i.project_id')
            ->field('r.id,r.user_id,p.project_id,p.project_name,p.project_desc,p.create_time,count(i.interface_id) as count,max(i.update_time) as last_time')
            ->select();
            
        foreach ($project as $k => &$v) {
            $v['last_time_ago'] = format_date(strtotime($v['last_time']));
        }
        
        $this->assign('project',$project);

        return $this->fetch();
    }
}
