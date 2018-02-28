<?php
include_once 'Controller.php';
include_once 'helper/Cart.php';
if(!isset($_SESSION)) session_start();

class CheckoutController extends Controller{
    
    function getCheckout(){
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;

        $cart = new Cart($oldCart);
        // print_r($cart);
        // die;
        return $this->loadView('giohang','Giỏ hàng của bạn',$cart);
    }
}


?>