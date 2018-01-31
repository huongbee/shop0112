<?php
include_once 'Controller.php';
include_once 'models/DetailFoodModel.php';

class DetailFoodController extends Controller{
    function getDetail(){
        $id = $_GET['id'];
        $alias = $_GET['alias'];
        
        $model = new DetailFoodModel;
        $food = $model->getDetailFood($id,$alias);

        // echo "<pre>";
        // print_r($food);
        // echo "</pre>";
        $data = [
            'food'=>$food
        ];
        return $this->loadView('chitiet',"Chi tiết",$data);
    }
}

?>