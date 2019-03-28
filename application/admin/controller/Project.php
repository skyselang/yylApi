<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;

class Project extends Common 
{
	// 项目
	public function project() 
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
            $admin_id = Session::get('admin_id');
            $where['is_delete'] = 0;
            $where['admin_id'] = $admin_id;

            // 排序
            $order_field = Request::param('order_field'); // 排序字段
            $order_type = Request::param('order_type'); // 排序方式
            if ($order_type) {
                $order_field = $order_field == 'id' ? 'project_id' : $order_field;
                $order = "{$order_field} {$order_type}";
            } else {
                $order = 'update_time desc, sort desc, project_id desc';
            }

            // 数据分页
            $data = Db::name('project')
                ->where($where)
                ->order($order)
                ->page($page,$limit)
                ->select(); 
            // 总记录数
            $count = Db::name('project')
	            ->where($where)
	            ->count();

            if ($data) {
                foreach ($data as $k => $v) {
                    $data[$k]['id'] = $v['project_id'];
                    $data[$k]['admin_id'] = Db::name('admin')->where('admin_id',$admin_id)->value('username');
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

	// 项目添加
	public function project_add() 
	{
    	if (Request::isAjax()) {
    		
    		$data['project_name'] = Request::param('project_name');
            $data['project_desc'] = Request::param('project_desc');
            $data['is_disable'] = Request::param('is_disable',0);
            $data['is_delete'] = Request::param('is_delete',0);
            $data['admin_id'] = Session::get('admin_id');
            $data['sort'] = Request::param('sort');
            $data['create_time'] = date('Y-m-d H:i:s');
            $data['update_time'] = date('Y-m-d H:i:s');

            // 接口前缀
            $apiurl_prefix_name = Request::param('apiurl_prefix_name/a',array());
            $apiurl_prefix_url = Request::param('apiurl_prefix_url/a',array());
            $apiurl_prefix_default = Request::param('apiurl_prefix_default/a',array(),false);
            $apiurl_prefix = array();
            foreach ($apiurl_prefix_name as $k => $v) {
                $apiurl_prefix[$k]['apiurl_prefix_name'] = $v;
                $apiurl_prefix[$k]['apiurl_prefix_url'] = $apiurl_prefix_url[$k];
                $apiurl_prefix[$k]['apiurl_prefix_default'] = 1;
            }
            $apiurl_prefix[key($apiurl_prefix_default)]['apiurl_prefix_default'] = 0;
            $data['apiurl_prefix'] = serialize($apiurl_prefix);

            $check = Db::name('project')
                ->where('is_delete',0)
            	->where('project_name',$data['project_name'])
            	->find();

            if ($check) {
                $res['code'] = 1;
                $res['msg'] = '项目名称已存在';
            } else {
                $insert = Db::name('project')
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

            return json($res);
    	}

		return $this->fetch();
	}

    // 项目编辑
    public function project_edit()
    {
        $project_id = Request::param('project_id');
        $project = Db::name('project')
            ->where('project_id',$project_id)
            ->find();
        $project['apiurl_prefix'] = unserialize($project['apiurl_prefix']);
        $this->assign('project',$project);

        if (Request::isAjax()) {
            
            $project_id = $data['project_id'] = Request::param('project_id');
            $project_name = $data['project_name'] = Request::param('project_name');
            $data['project_desc'] = Request::param('project_desc');
            $data['is_disable'] = Request::param('is_disable',0);
            $data['admin_id'] = Session::get('admin_id');
            $data['sort'] = Request::param('sort');
            $data['update_time'] = date('Y-m-d H:i:s');

            // 接口前缀
            $apiurl_prefix_name = Request::param('apiurl_prefix_name/a',array());
            $apiurl_prefix_url = Request::param('apiurl_prefix_url/a',array());
            $apiurl_prefix_default = Request::param('apiurl_prefix_default/a',array(),false);
            $apiurl_prefix = array();
            foreach ($apiurl_prefix_name as $k => $v) {
                $apiurl_prefix[$k]['apiurl_prefix_name'] = $v;
                $apiurl_prefix[$k]['apiurl_prefix_url'] = $apiurl_prefix_url[$k];
                $apiurl_prefix[$k]['apiurl_prefix_default'] = 1;
            }
            $apiurl_prefix[key($apiurl_prefix_default)]['apiurl_prefix_default'] = 0;
            $data['apiurl_prefix'] = serialize($apiurl_prefix);
            
            $check = Db::name('project')
                ->where('project_id','<>',$project_id)
                ->where('project_name',$project_name)
                ->find();

            if ($check) {
                $res['code'] = 1;
                $res['msg'] = '项目名称已存在';
            } else {
                $update = Db::name('project')
                    ->update($data);

                if ($update) {
                    $res['code'] = 0;
                    $res['msg'] = '编辑成功';
                } else {
                    $res['code'] = 1;
                    $res['msg'] = '编辑失败';
                }
            }

            return json($res);
        }

        return $this->fetch();
    }

    /**
     * 项目删除
     * @return json 删除结果
     */
    public function project_dele()
    {
        if (Request::isAjax()) {
            $id = Request::param('id');

            $strpos = strpos($id, ',');
            if ($strpos > 0) {
                $id_arr = explode(',', $id);
            } else {
                $id_arr = ['0'=>$id];
            }

            $success = $fail = 0;
            foreach ($id_arr as $k => $v) {
                $delete = Db::name('project')
                    ->where('project_id', $v)
                    ->update(['is_delete' => 1]);
                if ($delete) {
                    $success += 1;
                    Db::name('project')
                        ->where('project_id', $v)
                        ->update(['delete_time' => time()]);
                } else {
                    $fail += 1;
                }
            }

            $res['code'] = 0;
            $res['msg'] = "成功删除{$success}条，失败{$fail}条数据";
            
            return json($res);
        }
    }
}
