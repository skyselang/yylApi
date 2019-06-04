<?php

namespace app\admin\controller;

use think\Controller;
use think\facade\Session;

class Index extends Base
{
    public function index()
    {
    	
        return $this->fetch();
    }
    
    public function indexs()
    {
        return $this->fetch();
    }
}
