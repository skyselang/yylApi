<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Config;
use think\facade\Session;
use think\facade\Cookie;

class Login extends Controller {
	/**
	 * 登录页面
	 * @return
	 */
	public function index() {
		$this->redirect('login/login');
	}
	/**
	 * 登录页面
	 * @return
	 */
	public function login() 
	{
		$is_verify = config::get('app.is_verify');
		$this->assign('is_verify', $is_verify);

		return $this->fetch();
	}

	/**
	 * 登录验证
	 * @return json 验证结果
	 */
	public function check() 
	{
		$is_verify = config::get('app.is_verify'); //是否开启验证码
		$username = $this->request->param('username/s');
		$password = $this->request->param('password/s');
		$verify = $this->request->param('verify/s');
		$device = $this->request->param('device/s');

		if ($username == '' || $username == null || $username == 'undefined') {
			$res['code'] = 1;
			$res['msg'] = '请输入账号！';
		} elseif ($password == '' || $password == null || $password == 'undefined') {
			$res['code'] = 1;
			$res['msg'] = '请输入密码！';
		} elseif (($is_verify) && ($verify == '' || $verify == null || $verify == 'undefined')) {
			$res['code'] = 1;
			$res['msg'] = '请输入验证码！';
		} elseif (!captcha_check($verify) && $is_verify) {
			$res['code'] = 1;
			$res['msg'] = '验证码错误！';
		} else {
			$where['username'] = $username;
			$where['password'] = md5($password);

			$user = Db::name('user')
				->where($where)
				->find();
			if (empty($user)) {
				$user = Db::name('user')->where(['username'=>$username, 'password'=>$password])->find();
			}

			if ($user) {
				$user_id = $user['user_id'];
				$login_ip = $this->request->ip();
				$this->update($user_id, $login_ip, $device);

				Session::set('user_id', $user_id);
				Session::set('username', $user['username']);
				Cookie::set('username', $user['username']);
				Cookie::set('password', $user['password']);

				$res['code'] = 0;
				$res['msg'] = '登录成功！';
				$res['url'] = url('index/index');
			} else {
				$res['code'] = 1;
				$res['msg'] = '账号或密码错误！';
			}
		}

		return json($res);
	}

	/**
	 * 更新登录信息
	 * @param  string  $user_id 账号id
	 * @param  string  $login_ip 登录ip
	 * @param  integer $device   登录环境
	 * @return null
	 */
	public function update($user_id = '', $login_ip = '0.0.0.0', $device = 0) 
	{
		if ($user_id) {
			$data['login_ip'] = $login_ip;
			$data['device'] = $device;
			$data['login_time'] = date('Y-m-d H:i:s');
			$update = Db::name('user')
				->where('user_id', $user_id)
				->update($data);

			$login_num = Db::name('user')
				->where('user_id', $user_id)
				->setInc('login_num');
		}
	}

	/**
	 * 退出系统
	 * @return
	 */
	public function sysexit() 
	{
		$user_id = Session::get('user_id');

		if ($user_id) {
			$data['exit_time'] = date('Y-m-d H:i:s');

			$exit_time = Db::name('user')
				->where('user_id', $user_id)
				->update($data);
		}

		Session::clear(); //清除session（当前作用域）
		echo "<script>parent.location.href='" . url('index/login/login') . "'</script>"; //js父级页面跳转
	}
}

