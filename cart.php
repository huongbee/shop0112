<?php
include_once 'controller/CartController.php';

$c = new CartController;
return isset($_POST['action']) && $_POST['action'] == "update" ? 
        $c->updateCart() : 
        (isset($_POST['action']) && $_POST['action'] == "delete" ? 
        $c->deleteCart(): $c->addToCart());

        // $a>$b?$a:($b>$c?$b:$c);
?>