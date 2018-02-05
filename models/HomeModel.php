<?php
require_once 'DBConnect.php';
class HomeModel extends DBConnect{

    function getFoodsToday(){
        $sql = "SELECT f.*, p.url        
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id
                WHERE today=1";
        return $this->loadMoreRows($sql);
    }
    function getAllFoods($vitri, $soluong = 9){
        $sql = "SELECT f.*, p.url        
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id
                LIMIT $vitri,$soluong";
        return $this->loadMoreRows($sql);
    }
    function countSP(){
        $sql = "SELECT count(id) as tongSP FROM foods";
        return $this->loadOneRow($sql);
    }

    // page search
    function selectPromotionFoods(){
        $sql = "SELECT f.*, p.url        
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id
                WHERE f.promotion_price < f.price 
                AND f.promotion_price!=0";
        return $this->loadMoreRows($sql);
    }

    function searchFoods($keyword){
        $sql = "SELECT f.*, p.url 
                FROM foods f
                INNER JOIN page_url p
                ON f.id_url = p.id 
                WHERE f.name LIKE '%$keyword%'
                OR f.detail LIKE '%$keyword%'
                OR f.price = '$keyword'
                "; //OR f.promotion_price = '$keyword'
        return $this->loadMoreRows($sql);
    }
}
?>