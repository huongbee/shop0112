<?php
include_once 'Controller.php';
include_once 'models/HomeModel.php';

class HomeController extends Controller{

    function getIndex(){  
        $model = new HomeModel;
        $foods = $model->getFoodsToday();
        $allFoods = $model->getAllFoods();

        $data = [
            'foods'=>$foods,
            'allFoods'=>$allFoods
        ];
        // echo "<pre>";
        // print_r($foods);
        // echo "</pre>";
        // die;
        return $this->loadView('trangchu',"Trang chủ",$data);
    }

}



?>