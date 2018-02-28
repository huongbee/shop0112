<?php
include_once 'models/CartModel.php';


class CartController {

    function addToCart(){
        $id = $_POST['id'];

        $model = new CartModel;
        $food = $model->selectFoodById($id);

        print_r($food);
    }
}



?>