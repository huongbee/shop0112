<?php
include_once 'models/DBConnect.php';

class TypeModel extends DBConnect{
    function getAllType(){
        $sql = "SELECT * FROM food_type ORDER BY id ASC";
        return $this->loadMoreRows($sql);
    }
    function getFoodsFirstType(){
        $sql = "SELECT f.*, p.url 
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id  
                WHERE id_type=(SELECT t.id FROM food_type t ORDER BY t.id ASC LIMIT 0,1)";
        return $this->loadMoreRows($sql);
    }

    function selectFoodsByType($idType){
        $sql = "SELECT f.*, p.url 
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id 
                WHERE f.id_type=$idType";
        return $this->loadMoreRows($sql);
    }
}


?>