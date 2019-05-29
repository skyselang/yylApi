<?php

namespace app\share\controller;

use think\Controller;
use think\Db;
use think\facade\Request;

class Api extends Controller
{
    // 接口查看
    public function api()
    {
        // 接口详情
        $interface_id = Request::param('id');
        $interface = Db::name('interface')
            ->where('interface_id',$interface_id)
            ->find();
        $apiurl_prefix = Db::name('project')->where('project_id',$interface['project_id'])->value('apiurl_prefix');
        $interface['apiurl_prefix'] = unserialize($apiurl_prefix);
        $interface['request'] = unserialize($interface['request']);
        $interface['response'] = unserialize($interface['response']);
        $this->assign('interface',$interface);

        return $this->fetch();
    }
    
}
