<?php

namespace app\controllers;

use app\model\Qrcode;
use Phalcon\Mvc\Controller;

class Index extends Controller
{
    
    use \app\traits\Jump;

    public function index()
    {
        return $this->view->render('index','index2');
    }

    public function qrcode()
    {
        $yuan = $this->request->getPost('yuan');
        $duan = uniqid();
        $data =[
            'duan'=>$duan,
            'yuan'=>$yuan,
            'create_time'=>time(),
            'update_time'=>time()
        ];
        $model = new Qrcode();
        if($model->save($data)){
          return  $this->success('生成成功!',$this->url->get('/index/info/'.$duan));
        }
        return $this->error("失败!");
    }

    public function info()
    {
        $duan = $this->dispatcher->getParam(0);
        $info = Qrcode::findFirst([
            'duan = :duan:',
            'bind'=>[
                'duan'=>$duan
            ]
        ]);
        if(!$info){
            return $this->error('不存在的信息','/');
        }
        $this->view->setVar('info',$info);
        return $this->view->render('index','info');

    }


    public function list1()
    {
        $list = Qrcode::find([
            'limit' => 10,
            'order' => 'id desc',
        ]);

        $this->view->setVar('list', $list);
        return $this->view->render('index', 'list');
    }







}
