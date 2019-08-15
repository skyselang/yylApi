<?php

namespace app\share\controller;

use think\Controller;
use think\Db;
use think\facade\Request;

class Share extends Controller 
{
	// 接口查看
	public function share() 
    {
		
		$interface_id = Request::param('interface_id');//接口id

        $interface = Db::name('interface')
            ->alias('i')
            ->join('project p','p.project_id=i.project_id')
            ->where('interface_id', $interface_id)
            ->find();//接口详情
            
        if (!$interface) {
            $this->error('接口不存在！'.$interface_id);
        } else {
            $interface['fullname'] = api_fullname($interface_id);
            $interface['apiurl_prefix'] = unserialize($interface['apiurl_prefix']);
            $interface['request'] = unserialize($interface['request']);
            $interface['response'] = unserialize($interface['response']);
        }

		$this->assign('interface', $interface);
        
		return $this->fetch();
	}

}
