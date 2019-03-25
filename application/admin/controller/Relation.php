<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;

class Relation extends Common 
{

	public function relation()
	{
		$project_id = Request::param('project_id');
		$this->assign('project_id');

		$user = Db::name('relation')
			->where('project_id',$project_id)
			->select();
		$this->assign('user',$user);

		if (Request::isAjax()) {
			$project_id = Request::param('project_id/s');
			$user_id = Request::param('user_id/a');

			$user = Db::name('relation')
				->where('project_id',$project_id)
				->select();

			foreach ($user_id as $k => $v) {
				
			}

		}

		return $this->fetch();
	}

	/**
     * 搜索用户
     * @param string $name 球场名称
     * @return JSON
     */
    public function search_user(){
        if (Request::isAjax()) {
            $val = Request::param('val');

            $user = Db::name('user')
            	->where('is_delete',0)
            	->where('username','like',"%{$val}%")
            	->order('user_id')
            	->field('user_id,username,is_delete')
            	->select();

            if ($user) {
                $res['code'] = 0;
                $res['data'] = $user;
                $res['msg'] = '搜索到相关用户';
            } else {
                $res['code'] = 1;
                $res['msg'] = '没有找到相关用户';
            }

            return json($res);
        }
    }

}