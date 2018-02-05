<?php
class Controller{

    function loadView($view,$title = 'Home',$data=[]){
        include_once "views/layout.php";
    }

    function callViewAjax($view,$result){
        include_once "views/ajax/$view.php";
    }
}

?>