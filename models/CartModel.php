<?php
require_once 'DBConnect.php';
class CartModel extends DBConnect{

    function selectFoodById($id){
        $sql = "SELECT *
                FROM foods 
                WHERE id=$id";
        return $this->loadOneRow($sql);
    }
}


?>