<?php
include_once 'model/DBConnect.php';
class TypeModel extends DBConnect{
    function getAllType(){
        $sql = "SELECT * FROM food_type";
        return $this->loadMoreRows($sql);
    }
}


?>