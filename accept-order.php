<?
include_once 'controller/CheckoutController.php';
$c = new CheckoutController;
return $c->acceptOrder();

?>