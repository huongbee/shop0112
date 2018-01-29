<?php
require_once 'DBConnect.php';
class HomeModel extends DBConnect{

    function getFoodsToday(){
        $sql = "SELECT * FROM foods WHERE today=1";
        return $this->loadMoreRows($sql);
    }
    function getAllFoods($vitri, $soluong = 9){
        $sql = "SELECT * FROM foods LIMIT $vitri,$soluong";
        return $this->loadMoreRows($sql);
    }
    function countSP(){
        $sql = "SELECT count(id) as tongSP FROM foods";
        return $this->loadOneRow($sql);
    }
}
?>