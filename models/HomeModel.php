<?php
require_once 'DBConnect.php';
class HomeModel extends DBConnect{

    function getFoodsToday(){
        $sql = "SELECT * FROM foods WHERE today=1";
        return $this->loadMoreRows($sql);
    }
    function getAllFoods(){
        $sql = "SELECT * FROM foods";
        return $this->loadMoreRows($sql);
    }
}
?>