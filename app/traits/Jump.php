<?php

namespace app\traits;

trait Jump 
{

    /**
     * 操作成功跳转的快捷方法
     * @access protected
     * @param mixed  $msg    提示信息
     * @param string $url    跳转的 URL 地址
     * @param mixed  $data   返回的数据
     * @param int    $wait   跳转等待时间
     * @return void
     * @throws HttpResponseException
     */
    protected function success($msg = '', $url = null, $wait = 3) {
        if (is_null($url)) {
            $url = $_SERVER["HTTP_REFERER"];
        }

        $result = [
            'code'=>1,
            'msg' => $msg,
            'url' => $url,
            'wait' => $wait,
        ];
        $this->view->setVars($result);
        $this->view->render('public', 'jump');
        return FALSE;
    }

    /**
     * 操作错误跳转的快捷方法
     * @access protected
     * @param mixed  $msg    提示信息
     * @param string $url    跳转的 URL 地址
     * @param mixed  $data   返回的数据
     * @param int    $wait   跳转等待时间
     * @param array  $header 发送的 Header 信息
     * @return void
     * @throws HttpResponseException
     */
    protected function error($msg = '', $url = null, $wait = 3) {
        if (is_null($url)) {
            $url = $_SERVER["HTTP_REFERER"];
        }

        $result = [
            'code'=>0,
            'msg' => $msg,
            'url' => $url,
            'wait' => $wait,
        ];
        $this->view->setVars($result);
        $this->view->render('public', 'jump');
        return FALSE;
    }

}
