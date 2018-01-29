<?php
include_once 'Controller.php';
include_once 'models/HomeModel.php';

class HomeController extends Controller{

    function getIndex(){  
        $model = new HomeModel;
        $foods = $model->getFoodsToday();

        $page = isset($_GET['page'])
                && is_numeric($_GET['page']) 
                && $_GET['page'] != 0 ? abs($_GET['page']) : 1;
            
        // $page = 1;
        // if(isset($_GET['page'])
        //     && is_numeric($_GET['page']) 
        //     && $_GET['page'] != 0)
        // {
        //     $page = abs($_GET['page']);
        // }
        
        $soluong = 9;
        $vitri = ($page-1)*$soluong;

        $tongSoSP = $model->countSP();
        $tongSoSP = $tongSoSP->tongSP;

        $tongSoTrang = ceil($tongSoSP/$soluong);
        
        $allFoods = $model->getAllFoods($vitri,$soluong);

        /**
         * page =1  0,9
         * page =2  9,9
         * page =3  18,9
         * page =4  27,9
         *       5  36
         *       6  45
         *       7  54,9  54,55,56...62
         */

        $data = [
            'foods'=>$foods,
            'allFoods'=>$allFoods,
            'tongSoTrang'=>$tongSoTrang
        ];
        // echo "<pre>";
        // print_r($foods);
        // echo "</pre>";
        // die;
        return $this->loadView('trangchu',"Trang chủ",$data);
    }

}



?>