<?php
namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\facade\Session;
use think\facade\Request;

class Admin extends Base
{
    /**
     * 修改资料
     * @return json
     */
    public function info()
    {
    	$admin_id = Session::get('admin_id');

    	if (empty($admin_id)) {
            $this->error('登录信息获取失败，请重新登录！');
    	} else {
    		$admin = Db::name('admin')->where('admin_id', $admin_id)->find();
    	}

    	if (Request::isAjax()) {
            $res['code'] = 1;
            $admin_id = Session::get('admin_id');
            if (empty($admin_id)) {
                $res['msg'] = '登录信息获取失败，请重新登录！';
            } else {
                $nickname = Request::param('nickname/s');
                $email = Request::param('email/s');

                if (empty($nickname)) {
                    $res['code'] = 1;
                    $res['msg'] = '请输入昵称';
                } elseif (empty($email)) {
                    $res['code'] = 1;
                    $res['msg'] = '请输入邮箱';
                } else {
                    $data['nickname'] = $nickname;
                    $data['email'] = $email;
                    $data['update_time'] = time();

                    $update = Db::name('admin')->where('admin_id', $admin_id)->update($data);

                    if ($update) {
                        $res['code'] = 0;
                        $res['msg'] = '修改成功';
                    } else {
                        $res['msg'] = '修改失败';
                    }
                }
            }

    		return json($res);
    	}
    	
    	$this->assign('info',$admin);

    	return $this->fetch();
    }

    /**
     * 修改密码
     * @return json 
     */
    public function pwd()
    {
        if (Request::isAjax()) {
            $res['code'] = 1;
            $admin_id = Session::get('admin_id');
            if (empty($admin_id)) {
                $res['msg'] = '请重新登录再修改';
            } else {
                $oldpwd = Request::param('oldpwd/s');
                $newpwd = Request::param('newpwd/s');
                $newpwds = Request::param('newpwds/s');
                if (empty($oldpwd)) {
                    $res['msg'] = '请输入原密码';
                } elseif (empty($newpwd)) {
                    $res['msg'] = '请输入新密码';
                } elseif (empty($newpwds)) {
                    $res['msg'] = '请再次输入新密码';
                } elseif ($newpwd !== $newpwds) {
                    $res['msg'] = '新密码不一致';
                } else {
                    $where['admin_id'] = $admin_id;
                    $where['password'] = md5($oldpwd);

                    $check = Db::name('admin')->where($where)->find();

                    if ($check) {
                        $data['password'] = md5($newpwds);
                        $data['update_time'] = time();

                        $update = Db::name('admin')->where('admin_id', $admin_id)->update($data);

                        if ($update) {
                            $res['code'] = 0;
                            $res['msg'] = '修改成功';
                        } else {
                            $res['msg'] = '修改失败';
                        }
                    } else {
                        $res['msg'] = '原密码错误';
                    }
                }
            }
            
            return json($res);
        }

    	return $this->fetch();
    }
}
