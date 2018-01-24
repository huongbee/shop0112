<?php
include_once 'Controller.php';
class HomeController extends Controller{

    function getIndex(){    
        return $this->loadView('trangchu');
    }
}



?>