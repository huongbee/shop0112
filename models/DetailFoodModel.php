<?php
require_once 'DBConnect.php';
class DetailFoodModel extends DBConnect{
    function getDetailFood($id,$alias){
        $sql = "SELECT f.*, p.url 
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id
                WHERE f.id=$id
                AND url= '$alias' ";
        return $this->loadOneRow($sql);
    }
    function selectFoodSameType($id_type){
        $sql = "SELECT f.*, p.url 
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id 
                WHERE id_type=$id_type";
                
        return $this->loadMoreRows($sql);
    }
}