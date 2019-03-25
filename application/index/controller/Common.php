<?php

namespace app\index\controller;

use think\Controller;
use think\facade\Session;

class Common extends Controller
{
    public function initialize()
    {	
    	$this->isLogin();
    }

    /**
     * 是否登录
     * @return boolean 
     */
    public function isLogin()
    {
    	$is_login = Session::has('user_id');

    	if ($is_login) {
    		# code...
    	} else {
            action('login/sysexit');
    	}
    }
}
