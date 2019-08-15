<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 显示N分钟(小时/天/月/年)前函数
 * @author yyl
 * @param  int $time 时间
 * @return string    N分钟(小时/天/月/年)前
 */
function format_date($time)
{
    $t = time() - $time;
    $f = array(
        '31536000' => '年',
        '2592000' => '个月',
        '604800' => '星期',
        '86400' => '天',
        '3600' => '小时',
        '60' => '分钟',
        '1' => '秒'
    );
    foreach ($f as $k => $v) {
        if (0 != $c = floor($t / (int) $k)) {
            return $c . $v . '前';
        }
    }
}

function api_fullname($interface_id = 0)
{
    if (empty($interface_id)) {
        return false;
    }
    $interface = Db::name('interface')
        ->alias('i')
        ->join('project p', 'i.project_id=p.project_id')
        ->where('i.interface_id', $interface_id)
        ->field('i.interface_id, i.interface_pid, i.name, i.project_id, p.project_name')
        ->find();
    if ($interface['interface_pid'] == 0) {
        return $interface['project_name'] . ' > ' . $interface['name'];
    } else {
        $interfaces = Db::name('interface')
            ->field('interface_id, interface_pid, name, project_id')
            ->where(['project_id' => $interface['project_id'], 'is_disable' => 0, 'is_delete' => 0])
            ->order('interface_id desc')
            ->select();
        foreach ($interfaces as $k => $v) {
            $array[$v['interface_id']] = $v['interface_pid'];
            $names[$v['interface_id']] = $v['name'];
        }
        $id = $interface_id;
        $name[] = $interface['name'];
        while ($array[$id]) {
            $id = $array[$id];
            $name[] = $names[$id];
        }
        $name[] = $interface['project_name'];
        krsort($name);
        $fullname = implode(' > ', $name);
        return $fullname;
    }
}
