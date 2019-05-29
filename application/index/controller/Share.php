<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Request;

class Share extends Controller
{
    // 接口查看
    public function share()
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
        // $interface['response_data'] = html_entity_decode($interface['response_data']);
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

        return $this->fetch();
    }

    /**
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
