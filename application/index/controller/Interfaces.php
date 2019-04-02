<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;

class Interfaces extends Common
{
	// 接口
	public function interfaces() 
	{
		if (Request::isAjax()) {
            $project_id = Request::param('project_id');
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
            $where['is_delete'] = 0;
            $where['is_disable'] = 0;
            $where['project_id'] = $project_id;
            
            // 排序
            $order_field = Request::param('order_field'); // 排序字段
            $order_type = Request::param('order_type'); // 排序方式
            if ($order_type) {
                $order_field = $order_field == 'id' ? 'interface_id' : $order_field;
                $order = "{$order_field} {$order_type}";
            } else {
                $order = 'sort desc, interface_id asc';
            }

            // 数据分页
            $data = Db::name('interface')
                ->where($where)
                ->order($order)
                ->select(); 
            // 总记录数
            $count = Db::name('interface')
	            ->where($where)
	            ->count();

            if ($data) {
                foreach ($data as $k => $v) {
                    $is_delete = Db::name('project')->where('project_id',$v['project_id'])->value('is_delete');
                    if ($is_delete == 1) {
                        unset($data[$k]);
                    }
                    
                    $data[$k]['project_name'] = Db::name('project')->where('project_id',$v['project_id'])->value('project_name');
                    $data[$k]['id'] = $v['interface_id'];
                    $data[$k]['admin_id'] = Db::name('admin')->where('admin_id',$v['admin_id'])->value('username');

                }

                $res['code'] = 0;
                $res['data'] = $data;
                $res['count'] = $count;
            } else {
                $res['code'] = 0;
            }

            return json($res);
        }

        $project_id = Request::param('project_id');
        $project_name = Db::name('interface')
            ->where('project_id',$project_id)
            ->where('interface_pid',0)
            ->value('name');
        $this->assign('project_name',$project_name);

		return $this->fetch();
	}

	// 接口添加
	public function interfaces_add_dis()
	{
        // 项目
        $project = Db::name('project')
            ->where('is_delete',0)
            ->order(['sort'=>'desc','update_time'=>'desc'])
            ->select();
        $project[0]['apiurl_prefix'] = unserialize($project[0]['apiurl_prefix']);
        $this->assign('project',$project);

        // 接口
        $interface = Db::name('interface')
            ->where('project_id',$project[0]['project_id'])
            ->select();
        $interface = $this->getTree($interface);
        $this->assign('interface',$interface);

        // 返回参数
        $response = Db::name('interface_response')
            ->where('is_delete',0)
            ->order(['response_id','response_sort'=>'desc'])
            ->select();
        $this->assign('response',$response);

    	if (Request::isAjax()) {
    		
            $data['project_id'] = Request::param('project_id');
            $data['interface_pid'] = Request::param('interface_pid',0);
            $data['admin_id'] = Session::get('admin_id');
    		$data['name'] = Request::param('name');
            $data['explain'] = Request::param('explain');
            $data['url'] = Request::param('url');
            $data['method'] = Request::param('method');
            $data['sort'] = Request::param('sort');
            $data['is_disable'] = Request::param('is_disable',0);
            $data['is_delete'] = Request::param('is_delete',0);
            $data['create_time'] = date('Y-m-d H:i:s');
            $data['update_time'] = date('Y-m-d H:i:s');

            // 请求参数
            $request_param_name = Request::param('request_param_name/a',array());
            $request_param_example = Request::param('request_param_example/a',array());
            $request_param_explain = Request::param('request_param_explain/a',array());
            $request_param_must = Request::param('request_param_must/a',array());
            $request_param_type = Request::param('request_param_type/a',array());
            $request = array();
            foreach ($request_param_name as $k => $v) {
                $request[$k]['request_param_name'] = $v;
                $request[$k]['request_param_example'] = $request_param_example[$k];
                $request[$k]['request_param_explain'] = $request_param_explain[$k];
                $request[$k]['request_param_must'] = $request_param_must[$k];
                $request[$k]['request_param_type'] = $request_param_type[$k];
            }
            $data['request'] = serialize($request);

            // 返回参数
            $response_param_name = Request::param('response_param_name/a',array());
            $response_param_example = Request::param('response_param_example/a',array());
            $response_param_explain = Request::param('response_param_explain/a',array());
            $response = array();
            foreach ($response_param_name as $k => $v) {
                $response[$k]['response_param_name'] = $v;
                $response[$k]['response_param_example'] = $response_param_example[$k];
                $response[$k]['response_param_explain'] = $response_param_explain[$k];
            }
            $data['response'] = serialize($response);

            $name = $data['name'];
            $project_id = $data['project_id'];
            $interface_pid = $data['interface_pid'];
            if ($interface_pid) {
                $where = ['project_id'=>$project_id,'interface_id'=>$interface_pid];
            } else {
                $where = ['project_id'=>$project_id];
            }
            
            $check = Db::name('interface')
                ->where($where)
            	->where('name',$name)
            	->find();

            if ($check) {
                $res['code'] = 1;
                $res['msg'] = '接口名称已存在';
            } else {
                $insert = Db::name('interface')
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

    // 接口编辑
    public function interfaces_edit()
    {
        // 接口详情
        $interface_id = Request::param('interface_id');
        $interface = Db::name('interface')
            ->where('interface_id',$interface_id)
            ->find();
        $apiurl_prefix = Db::name('project')->where('project_id',$interface['project_id'])->value('apiurl_prefix');
        $interface['apiurl_prefix'] = unserialize($apiurl_prefix);
        $interface['request'] = unserialize($interface['request']);
        $interface['response'] = unserialize($interface['response']);
        $this->assign('interface',$interface);

        // 该项目所有接口
        $interfaces = Db::name('interface')
            ->where('project_id',$interface['project_id'])
            ->select();
        $interfaces = $this->getTree($interfaces);
        $this->assign('interfaces',$interfaces);

        // 项目
        $project = Db::name('project')
            ->where('is_delete',0)
            ->order(['sort'=>'desc','update_time'=>'desc'])
            ->select();
        $this->assign('project',$project);

        // 返回参数
        $response = Db::name('interface_response')
            ->where('is_delete',0)
            ->order(['response_id','response_sort'=>'desc'])
            ->select();
        $this->assign('response',$response);

        if (Request::isAjax()) {
            
            $data['interface_id'] = Request::param('interface_id');
            $data['project_id'] = Request::param('project_id');
            $data['interface_pid'] = Request::param('interface_pid',0);
            $data['admin_id'] = Session::get('admin_id');
            $data['name'] = Request::param('name');
            $data['explain'] = Request::param('explain');
            $data['url'] = Request::param('url');
            $data['method'] = Request::param('method');
            $data['sort'] = Request::param('sort');
            $data['is_disable'] = Request::param('is_disable',0);
            $data['is_delete'] = Request::param('is_delete',0);
            $data['update_time'] = date('Y-m-d H:i:s');

            // 请求参数
            $request_param_name = Request::param('request_param_name/a',array());
            $request_param_example = Request::param('request_param_example/a',array());
            $request_param_explain = Request::param('request_param_explain/a',array());
            $request_param_must = Request::param('request_param_must/a',array());
            $request_param_type = Request::param('request_param_type/a',array());
            $request = array();
            foreach ($request_param_name as $k => $v) {
                $request[$k]['request_param_name'] = $v;
                $request[$k]['request_param_example'] = $request_param_example[$k];
                $request[$k]['request_param_explain'] = $request_param_explain[$k];
                $request[$k]['request_param_must'] = $request_param_must[$k];
                $request[$k]['request_param_type'] = $request_param_type[$k];
            }
            $data['request'] = serialize($request);

            // 返回参数
            $response_param_name = Request::param('response_param_name/a',array());
            $response_param_example = Request::param('response_param_example/a',array());
            $response_param_explain = Request::param('response_param_explain/a',array());
            $response = array();
            foreach ($response_param_name as $k => $v) {
                $response[$k]['response_param_name'] = $v;
                $response[$k]['response_param_example'] = $response_param_example[$k];
                $response[$k]['response_param_explain'] = $response_param_explain[$k];
            }
            $data['response'] = serialize($response);

            $name = $data['name'];
            $project_id = $data['project_id'];
            $interface_pid = $data['interface_pid'];
            if ($interface_pid) {
                $where = ['project_id'=>$project_id,'interface_pid'=>$interface_pid];
            } else {
                $where = ['project_id'=>$project_id];
            }

            $check = Db::name('interface')
                ->where('interface_id','<>',$interface_id)
                ->where($where)
                ->where('name',$name)
                ->find();

            if ($check) {
                $res['code'] = 1;
                $res['msg'] = '接口名称已存在';
            } else {
                $insert = Db::name('interface')
                    ->update($data);

                if ($insert) {
                    $res['code'] = 0;
                    $res['msg'] = '修改成功';
                } else {
                    $res['code'] = 1;
                    $res['msg'] = '修改失败';
                }
            }

            return json($res);
        }

        return $this->fetch();
    }

    /**
     * @Author   yyl
     * @DateTime 2019-03-25
     * 获取返回参数模板
     * @return json  返回参数模板 
     */
    public function response_param_template()
    {
        if (Request::isAjax()) {
            $response = Db::name('interface_response')
                ->where('is_delete',0)
                ->order(['response_sort'=>'desc','response_id'=>'asc'])
                ->select();
            if ($response) {
                $res['code'] = 0;
                $res['msg'] = '返回参数模板获取成功';
                $res['data'] = $response;
            } else {
                $res['code'] = 1;
                $res['msg'] = '返回参数模板获取失败';
            }

            return json($res);
        }
    }

    /**
     * 接口删除
     * @return json 删除结果
     */
    public function interfaces_dele_dis()
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
                $delete = Db::name('interface')
                    ->where('interface_id', $v)
                    ->update(['is_delete' => 1]);
                if ($delete) {
                    $success += 1;
                    Db::name('interface')
                        ->where('interface_id', $v)
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

    /**
     * 根据项目id获取所有接口
     * @return json 该项目所有接口
     */
    public function interface_tree()
    {
        if (Request::isAjax()) {
            $project_id = Request::param('project_id',0);

            $interface = Db::name('interface')
                ->where('project_id',$project_id)
                ->select();

            if ($interface) {
                $res['code'] = 0;
                $res['data'] = $this->getTree($interface);
            } else {
                $res['code'] = 1;
                $res['msg'] = '没有查到相关接口';
            }

            return json($res);
        }
    }

    /**
     * 根据项目id获取接口前缀
     * @return json 项目接口前缀
     */
    public function apiurl_prefix()
    {
        if (Request::isAjax()) {
            $project_id = Request::param('project_id',0);

            $apiurl_prefix = Db::name('project')
                ->where('project_id',$project_id)
                ->value('apiurl_prefix');

            if ($apiurl_prefix) {
                $res['code'] = 0;
                $res['data'] = unserialize($apiurl_prefix);
            } else {
                $res['code'] = 1;
                $res['msg'] = '没有查到相关接口前缀';
            }

            return json($res);
        }
    }

    /**
     * 递归获取无限极分类
     * @param  array  $array 分类
     * @param  integer $pid  父级id
     * @param  integer $lv   等级
     * @return array        tree分类
     */
    public function getTree($array, $pid = 0, $lv = 0)
    {
        static $tree = array();

        foreach ($array as $k => $v) {
            if ($v['interface_pid'] == $pid) {
                $v['lv'] = $lv;
                $v['name'] = str_repeat('----', $lv).$v['name'];
                $tree[] = $v;
                $this->getTree($array, $v['interface_id'], $lv + 1);
            }
        }

        return $tree;
    }
    
}
