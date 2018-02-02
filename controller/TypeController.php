<?php
include_once 'Controller.php';

class TypeController extends Controller{
    function getIndex(){
        return $this->loadView('mon-an-theo-loai','Món ăn theo loại');
    }
}

?>