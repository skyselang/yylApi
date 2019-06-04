<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;

class Relation extends Base 
{

	public function relation()
	{
		$project_id = Request::param('project_id');
		$this->assign('project_id',$project_id);

		$user = Db::name('relation')
			->where('project_id',$project_id)
			->select();
        foreach ($user as $k => $v) {

            $user[$k]['username'] = Db::name('user')->where('user_id',$v['user_id'])->value('username');
        }
		$this->assign('user',$user);

		if (Request::isAjax()) {
            $res['code'] = 1;
			$project_id = Request::param('project_id/s');
			$user_id = Request::param('user_id/a');

			$relation_user_old = Db::name('relation')
				->where('project_id',$project_id)
				->select();

            foreach ($user_id as $k => $v) {
                $relation_user_new[$k]['project_id'] = $project_id;
                $relation_user_new[$k]['user_id'] = $v;
                $relation_user_new[$k]['create_time'] = date('Y-m-d H:i:s');
            }

            $insert = Db::name('relation')
                ->insertAll($relation_user_new);

            if ($insert) {
                foreach ($relation_user_old as $k => $v) {
                    Db::name('relation')->delete($v);
                }
                
                $res['code'] = 0;
                $res['msg'] = '关联成功';
            } else {
                $res['msg'] = '关联失败';
            }
            
			return json($res);
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