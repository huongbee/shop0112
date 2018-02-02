<?php
include_once 'Controller.php';
include_once 'models/TypeModel.php';

class TypeController extends Controller{
    function getIndex(){
        $model = new TypeModel;
        $types = $model->getAllType();

        $data = [
            'types'=>$types
        ];
        return $this->loadView('mon-an-theo-loai','Món ăn theo loại',$data);
    }
}

?>