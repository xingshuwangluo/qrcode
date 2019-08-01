<?php

namespace app\model;

use Phalcon\Mvc\Model;


/**
 * Class Qrcode
 * @package app\traits
 */
class Qrcode extends Model
{

    public function beforeSave()
    {
        // Convert the array into a string
        $this->yuan = base64_encode($this->yuan);
    }

    public function afterFetch()
    {
        // Convert the string to an array
        $this->yuan = base64_decode($this->yuan);
    }

}