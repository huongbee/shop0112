<?php
include_once './controller/DetailFoodController.php';
$c = new DetailFoodController;
return $c->getDetail();

?>