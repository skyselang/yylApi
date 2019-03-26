<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Config;
use think\facade\Session;

class Index extends Common
{	

    public function index()
    {
    	$user_id = Session::get('user_id');

    	$relation = Db::name('relation')
    		->where('user_id',$user_id)
    		->select();

    	foreach ($relation as $k => $v) {
    		$interface[$k]['interface'] = Db::name('interface')
    			->where('is_delete',0)
    			->where('interface_pid',0)
    			->where('project_id',$v['project_id'])
    			->select();
    		$create_time = Db::name('interface')
    			->where('is_delete',0)
    			->where('project_id',$v['project_id'])
    			->order('create_time desc')
    			->find();
    		$interface[$k]['interface'][$k]['create_time'] = $create_time['create_time'];
    		$interface[$k]['project_name'] = Db::name('project')->where('project_id',$v['project_id'])->value('project_name');
    	}
    	// dump($interface);
    	$this->assign('interface',$interface);

        return $this->fetch();
    }

}
