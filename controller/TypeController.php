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
}

?>