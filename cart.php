<?php
include_once 'controller/CartController.php';

$c = new CartController;
return isset($_POST['action']) && $_POST['action'] == "update" ? 
        $c->updateCart() : $c->addToCart();

?>