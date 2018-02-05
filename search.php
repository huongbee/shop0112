<?php
include_once './controller/HomeController.php';

$c = new HomeController;
return isset($_POST['keyword']) ? $c->postSearch() : $c->getSearch();