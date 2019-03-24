<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;

class User extends Common 
{
	// 用户
	public function user() 
	{
		if (Request::isAjax()) {
            // 分页
            $page = Request::param('page');
            $limit = Request::param('limit');

            // 条件
            $field = Request::param('field');//字段
            $field_val = Request::param('field_val');//字段值
            $date_type = Request::param('date_type');//日期类型
            $start_date = Request::param('start_date');//开始日期
            $end_date = Request::param('end_date');//结束日期
            if ($field_val) {
                $where[$field] = array('like',"%".$field_val."%");
            }
            if ($start_date && $end_date) {
                $start_time = strtotime($start_date.' 00:00:00');
                $end_time = strtotime($end_date.' 23:59:59');
                $where[] = [$date_type, ['>=', $start_time], ['<=', $end_time], 'and'];
            }
            $where = [];

            // 排序
            $order_field = Request::param('order_field'); // 排序字段
            $order_type = Request::param('order_type'); // 排序方式
            if ($order_type) {
                $order_field = $order_field == 'id' ? 'user_id' : $order_field;
                $order = "{$order_field} {$order_type}";
            } else {
                $order = 'user_id desc, login_time desc';
            }

            // 数据分页
            $data = Db::name('user')
                ->where($where)
                ->order($order)
                ->page($page,$limit)
                ->select(); 
            // 总记录数
            $count = Db::name('user')
	            ->where($where)
	            ->count();

            if ($data) {
                foreach ($data as $k => $v) {
                    $data[$k]['id'] = $v['user_id'];
                }

                $res['code'] = 0;
                $res['data'] = $data;
                $res['count'] = $count;
            } else {
                $res['code'] = 0;
            }

            return json($res);
        }

		return $this->fetch();
	}

	// 用户添加
	public function user_add() 
	{
    	if (Request::isAjax()) {
    		
            $username = Request::param('username');
            $password = Request::param('password');

            if ($username == '' || $username == null || $username == 'undefined') {
                $res['code'] = 1;
                $res['msg'] = '请输入账号！';
            } elseif ($password == '' || $password == null || $password == 'undefined') {
                $res['code'] = 1;
                $res['msg'] = '请输入密码！';
            } else {
                $check = Db::name('user')
                    ->where('username',$username)
                    ->find();

                if ($check) {
                    $res['code'] = 1;
                    $res['msg'] = '账号已存在！';
                } else {
                    $data['username'] = $username;
                    $data['password'] = md5($password);
                    $data['create_time'] = date('Y-m-d H:i:s');
                    $insert = Db::name('user')
                        ->data($data)
                        ->insert();

                    if ($insert) {
                        $res['code'] = 0;
                        $res['msg'] = '添加成功';
                    } else {
                        $res['code'] = 1;
                        $res['msg'] = '添加失败';
                    }
                }
            }

            return json($res);
    	}

		return $this->fetch();
	}
}
