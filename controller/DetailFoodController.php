<?php
include_once 'Controller.php';
class DetailFoodController extends Controller{
    function getDetail(){
        $id = $_GET['id'];
        $alias = $_GET['alias'];
        echo $id;
        echo $alias;
        //return $this->loadView('chitiet',"Chi tiết");
    }
}

?>