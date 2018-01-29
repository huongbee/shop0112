<?php
include_once 'Controller.php';
include_once 'models/HomeModel.php';
include_once 'helper/Pager.php';


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

        $pager = new Pager($tongSoSP,$page,$soluong,5);
        $pagination = $pager->showPagination();

        $allFoods = $model->getAllFoods($vitri,$soluong);
        $data = [
            'foods'=>$foods,
            'allFoods'=>$allFoods,
            'pagination'=>$pagination
        ];
        // echo "<pre>";
        // print_r($foods);
        // echo "</pre>";
        // die;
        return $this->loadView('trangchu',"Trang chủ",$data);
    }

}



?>