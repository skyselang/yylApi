<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;
use think\facade\Url;

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
            $project_id = Request::param('project_id');//项目id
            $field = Request::param('field');//字段
            $field_val = Request::param('field_val');//字段值
            $date_type = Request::param('date_type');//日期类型
            $start_date = Request::param('start_date');//开始日期
            $end_date = Request::param('end_date');//结束日期
            if ($project_id) {
                $where['i.project_id'] = $project_id;
            }
            if ($field_val) {
                $where['i'.$field] = array('like',"%".$field_val."%");
            }
            if ($start_date && $end_date) {
                $start_time = strtotime($start_date.' 00:00:00');
                $end_time = strtotime($end_date.' 23:59:59');
                $where['i.'.$date_type] = ['>=',$start_time];
                $where['i.'.$date_type] = ['<=',$end_time];
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
                ->join('project p','i.project_id=p.project_id')
                ->join('admin a','p.admin_id=a.admin_id')
                ->field('i.interface_id, i.name, i.interface_pid, i.method, i.url, i.sort, i.is_delete, i.create_time, i.update_time, p.project_name, a.username')
                ->where($where)
                ->order($order)
                ->select();
            $count = count($data);// 总记录数

            if ($data) {
                foreach ($data as $k => $v) {
                    $data[$k]['id'] = $v['interface_id'];
                    $data[$k]['share_url'] = Url::build('share/share/share',['interface_id'=>$v['interface_id']],'',true);
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
        $project_name = Db::name('project')->where('project_id',$project_id)->value('project_name');
        $this->assign('project_name',$project_name);

		return $this->fetch();
	}

    // 接口查看
    public function interfaces_edit()
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
            $interface['apiurl_prefix'] = unserialize($interface['apiurl_prefix']);
            $interface['request'] = unserialize($interface['request']);
            $interface['response'] = unserialize($interface['response']);
        }

        $this->assign('interface', $interface);

        return $this->fetch();
    }
    
}
