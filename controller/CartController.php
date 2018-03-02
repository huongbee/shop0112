<?php
include_once 'models/CartModel.php';
include_once 'helper/Cart.php';

session_start();

class CartController {

    function addToCart(){
        $id = $_POST['id'];
        $qty = isset($_POST['quantity']) ?  $_POST['quantity'] : 1;

        $model = new CartModel;
        $food = $model->selectFoodById($id);

        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null; // kiem tra da co sp trong gio hang hay chua
        $cart = new Cart($oldCart); // new
        $cart->add($food,$qty); //them vao gio hang 

        $_SESSION['cart'] = $cart; //luu gio hang vao session

        echo $food->name;
        //print_r($_SESSION['cart']);
    }
}



?>