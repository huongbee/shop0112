<?php
include_once 'Controller.php';
include_once 'models/TypeModel.php';

class TypeController extends Controller{
    function getIndex(){
        $model = new TypeModel;
        $types = $model->getAllType();

        $foodsFirstType = $model->getFoodsFirstType();
        $data = [
            'types'=>$types,
            'foodsFirstType'=>$foodsFirstType
        ];
        return $this->loadView('mon-an-theo-loai','Món ăn theo loại',$data);
    }

    function getFoodsByType(){
        $idType = $_GET['id'];
        $model = new TypeModel;
        $result = $model->selectFoodsByType($idType);
        //print_r($result);
        return $this->callViewAjax('type',$result);
    }
}

?>