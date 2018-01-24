<?php
class Controller{

    function loadView($view,$title = 'Home',$data=[]){
        include_once "views/layout.php";
    }
}

?>