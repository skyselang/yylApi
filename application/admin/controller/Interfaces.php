<?php

namespace app\admin\controller;

use think\Db;
use think\facade\Url;
use think\facade\Session;
use think\facade\Request;

/**
 * 接口
 */
class Interfaces extends Base
{
    // 接口
    public function interfaces()
    {
        if (Request::isAjax()) {
            // 分页
            $page = Request::param('page');
            $limit = Request::param('limit');

            // 条件
            $project_id = Request::param('project_id'); //项目id
            $field = Request::param('field'); //字段
            $field_val = Request::param('field_val'); //字段值
            $date_type = Request::param('date_type'); //日期类型
            $start_date = Request::param('start_date'); //开始日期
            $end_date = Request::param('end_date'); //结束日期
            if ($project_id) {
                $where['i.project_id'] = $project_id;
            }
            if ($field_val) {
                $where['i' . $field] = array('like', "%" . $field_val . "%");
            }
            if ($start_date && $end_date) {
                $start_time = strtotime($start_date . ' 00:00:00');
                $end_time = strtotime($end_date . ' 23:59:59');
                $where['i.' . $date_type] = ['>=', $start_time];
                $where['i.' . $date_type] = ['<=', $end_time];
            }
            $where['i.is_delete'] = 0;
            $where['p.is_delete'] = 0;

            // 排序
            $order_field = Request::param('order_field'); // 排序字段
            $order_type = Request::param('order_type'); // 排序方式
            if ($order_type) {
                $order_field = $order_field == 'id' ? 'interface_id' : $order_field;
                $order = "i.{$order_field} {$order_type}";
            } else {
                $order = 'i.sort desc, interface_id asc';
            }

            $data = Db::name('interface')
                ->alias('i')
                ->join('project p', 'i.project_id=p.project_id')
                ->join('admin a', 'p.admin_id=a.admin_id')
                ->field('i.interface_id, i.name, i.interface_pid, i.method, i.url, i.sort, i.is_disable, i.is_delete, i.create_time, i.update_time, p.project_id,
                    p.project_name, a.username')
                ->where($where)
                ->order($order)
                ->select();
            $count = count($data); // 总记录数

            if ($data) {
                foreach ($data as $k => $v) {
                    $data[$k]['id'] = $v['interface_id'];
                    $data[$k]['share_url'] = Url::build('share/share/share', ['interface_id' => $v['interface_id']], '', true);
                }

                $res['code'] = 0;
                $res['data'] = $data;
                $res['count'] = $count;
            } else {
                $res['code'] = 0;
                $res['data'] = [];
                $res['count'] = 0;
            }

            return json($res);
        }

        $project = Db::name('project')->where('is_delete', 0)->field('project_id, project_name')->order('sort desc,project_id desc')->select();
        $this->assign('project', $project);

        return $this->fetch();
    }

    // 接口添加
    public function interfaces_add()
    {
        $pid['project_id'] = Request::param('project_id', 0);
        $pid['interface_id'] = Request::param('interface_id', 0);
        $this->assign('pid', $pid);
        $pid['project_id'] ? $project_where['project_id'] = $pid['project_id'] : $project_where = '';
        // 项目
        $project = Db::name('project')
            ->where('is_delete', 0)
            ->where($project_where)
            ->order(['sort' => 'desc', 'project_id' => 'desc'])
            ->field('project_id, project_name, apiurl_prefix')
            ->select();
        $project[0]['apiurl_prefix'] = unserialize($project[0]['apiurl_prefix']);
        $this->assign('project', $project);

        // 接口
        $interface = Db::name('interface')
            ->where('is_delete', 0)
            ->where('project_id', $project[0]['project_id'])
            ->field('interface_id, interface_pid, name, project_id')
            ->order('sort desc, interface_id desc')
            ->select();
        $interface = $this->getTree($interface);
        $this->assign('interface', $interface);

        // 返回参数
        $response = Db::name('interface_response')
            ->where('is_delete', 0)
            ->order(['response_id', 'response_sort' => 'desc'])
            ->select();
        $this->assign('response', $response);

        if (Request::isPost()) {
            $data['project_id'] = Request::param('project_id');
            $data['interface_pid'] = Request::param('interface_pid', 0);
            $data['admin_id'] = Session::get('admin_id');
            $data['name'] = Request::param('name');
            $data['explain'] = Request::param('explain');
            $data['url'] = Request::param('url');
            $data['method'] = Request::param('method');
            $data['sort'] = Request::param('sort');
            $data['is_disable'] = Request::param('is_disable', 0);
            $data['is_delete'] = Request::param('is_delete', 0);
            $data['create_time'] = date('Y-m-d H:i:s');
            $data['update_time'] = date('Y-m-d H:i:s');
            $data['response_data'] = Request::param('response_data');

            // 请求参数
            $request_param_name = Request::param('request_param_name/a', array());
            $request_param_example = Request::param('request_param_example/a', array());
            $request_param_explain = Request::param('request_param_explain/a', array());
            $request_param_must = Request::param('request_param_must/a', array());
            $request_param_type = Request::param('request_param_type/a', array());
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
            $response_param_name = Request::param('response_param_name/a', array());
            $response_param_example = Request::param('response_param_example/a', array());
            $response_param_explain = Request::param('response_param_explain/a', array());
            $response = array();
            foreach ($response_param_name as $k => $v) {
                $response[$k]['response_param_name'] = $v;
                $response[$k]['response_param_example'] = $response_param_example[$k];
                $response[$k]['response_param_explain'] = $response_param_explain[$k];
            }
            $data['response'] = serialize($response);

            if ($data['interface_pid']) {
                $where['interface_pid'] = $data['interface_pid'];
            }
            $where['project_id'] = $data['project_id'];
            $where['name'] = $data['name'];
            $where['is_delete'] = 0;

            $check = Db::name('interface')->where($where)->find();

            if ($check) {
                $res['code'] = 1;
                $res['msg'] = '接口名称已存在' . $check['interface_id'];
            } else {
                $insert = Db::name('interface')->insert($data);

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
        $interface = Db::name('interface')->where('interface_id', $interface_id)->find();
        if (empty($interface)) {
            $this->error('接口不存在');
            die;
        }
        $apiurl_prefix = Db::name('project')->where('project_id', $interface['project_id'])->value('apiurl_prefix');
        $interface['apiurl_prefix'] = unserialize($apiurl_prefix);
        $interface['request'] = unserialize($interface['request']);
        $interface['response'] = unserialize($interface['response']);
        $interface['share_url'] = Url::build('share/share/share', ['interface_id' => $interface['interface_id']], '', true);
        $interface['fullname'] = api_fullname($interface_id);
        $this->assign('interface', $interface);

        // 项目
        $project = Db::name('project')
            ->where('is_delete', 0)
            ->where('project_id', $interface['project_id'])
            ->order(['sort' => 'desc', 'project_id' => 'desc'])
            ->select();
        $this->assign('project', $project);

        // 该项目所有接口
        $interfaces = Db::name('interface')
            ->where('is_delete', 0)
            ->where('project_id', $interface['project_id'])
            ->order('sort desc,interface_id asc')
            ->select();
        $interfaces = $this->getTree($interfaces);
        $this->assign('interfaces', $interfaces);

        // 返回参数
        $response = Db::name('interface_response')
            ->where('is_delete', 0)
            ->order(['response_id', 'response_sort' => 'desc'])
            ->select();
        $this->assign('response', $response);

        if (Request::isPost()) {

            $data['interface_id'] = Request::param('interface_id');
            $data['project_id'] = Request::param('project_id');
            $data['interface_pid'] = Request::param('interface_pid', 0);
            $data['admin_id'] = Session::get('admin_id');
            $data['name'] = Request::param('name');
            $data['explain'] = Request::param('explain');
            $data['url'] = Request::param('url');
            $data['method'] = Request::param('method');
            $data['sort'] = Request::param('sort');
            $data['is_disable'] = Request::param('is_disable', 0);
            $data['is_delete'] = Request::param('is_delete', 0);
            $data['update_time'] = date('Y-m-d H:i:s');
            $data['response_data'] = Request::param('response_data');

            // 请求参数
            $request_param_name = Request::param('request_param_name/a', array());
            $request_param_example = Request::param('request_param_example/a', array());
            $request_param_explain = Request::param('request_param_explain/a', array());
            $request_param_must = Request::param('request_param_must/a', array());
            $request_param_type = Request::param('request_param_type/a', array());
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
            $response_param_name = Request::param('response_param_name/a', array());
            $response_param_example = Request::param('response_param_example/a', array());
            $response_param_explain = Request::param('response_param_explain/a', array());
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
                $where = ['project_id' => $project_id, 'interface_pid' => $interface_pid];
            } else {
                $where = ['project_id' => $project_id, 'interface_pid' => $interface_pid];
            }

            $check = Db::name('interface')
                ->where('interface_id', '<>', $interface_id)
                ->where('is_delete', 0)
                ->where($where)
                ->where('name', $name)
                ->find();

            if ($check) {
                $res['code'] = 1;
                $res['msg'] = '接口名称已存在';
            } else {
                $insert = Db::name('interface')
                    ->update($data);

                if ($insert) {
                    $res['code'] = 0;
                    $res['msg'] = '保存成功';
                } else {
                    $res['code'] = 1;
                    $res['msg'] = '保存失败';
                }
            }

            return json($res);
        }

        return $this->fetch();
    }

    // 接口单元格编辑
    public function interfacesedit()
    {
        if (Request::isAjax()) {
            $id = Request::param('id');
            $field_name = Request::param('field_name');
            $field_value = Request::param('field_value');

            if ($id && $field_name && $field_value) {
                $res['code'] = 1;
                $data[$field_name] = $field_value;
                $update = Db::name('interface')
                    ->where('interface_id', $id)
                    ->update($data);
                if ($update) {
                    $res['code'] = 0;
                    $res['msg'] = '编辑成功';
                } else {
                    $res['code'] = 1;
                    $res['msg'] = '编辑失败';
                }
                return json($res);
            }
        }
    }

    // 接口是否禁用
    public function interfaces_disable()
    {
        if (Request::isAjax()) {
            $res['code'] = 1;

            $id = Request::param('id');
            $is_disable = Request::param('is_disable');

            if ($id) {
                $data['interface_id'] = $id;
                $data['is_disable'] = $is_disable == 1 ? 0 : 1;
                $update = Db::name('interface')
                    ->update($data);
                if ($update) {
                    $res['code'] = 0;
                    $res['msg'] = '编辑成功';
                } else {
                    $res['msg'] = '编辑失败';
                }
            }

            return json($res);
        }
    }

    /**
     * 获取返回参数模板
     * @return json  返回参数模板 
     */
    public function response_param_template()
    {
        if (Request::isAjax()) {
            $response = Db::name('interface_response')
                ->where('is_delete', 0)
                ->order(['response_sort' => 'desc', 'response_id' => 'asc'])
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
    public function interfaces_dele()
    {
        if (Request::isAjax()) {
            $id = Request::param('id');

            $strpos = strpos($id, ',');
            if ($strpos > 0) {
                $id_arr = explode(',', $id);
            } else {
                $id_arr = ['0' => $id];
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
            $project_id = Request::param('project_id', 0);

            $interface = Db::name('interface')
                ->where('project_id', $project_id)
                ->where('is_delete', 0)
                ->order('sort desc,interface_id asc')
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
            $project_id = Request::param('project_id', 0);

            $apiurl_prefix = Db::name('project')
                ->where('project_id', $project_id)
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
                $v['name'] = str_repeat('----|', $lv) . $v['name'];
                $tree[] = $v;
                $this->getTree($array, $v['interface_id'], $lv + 1);
            }
        }

        return $tree;
    }
}
