<?php
//https://github.com/huongnguyen08/restaurant-template

include_once 'controller/HomeController.php';

$c = new HomeController;
return $c->getIndex();


?>