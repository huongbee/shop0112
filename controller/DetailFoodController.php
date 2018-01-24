<?php
include_once 'Controller.php';
class DetailFoodController extends Controller{
    function getDetail(){
        return $this->loadView('chitiet',"Chi tiết");
    }
}

?>