<?php
include_once 'Controller.php';
include_once 'helper/Cart.php';
include_once 'models/CheckoutModel.php';
include_once 'helper/functions.php';

if(!isset($_SESSION)) session_start();

class CheckoutController extends Controller{
    
    function __construct(){
        date_default_timezone_set('Asia/Ho_Chi_Minh');
    }
    function getCheckout(){
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;

        $cart = new Cart($oldCart);
        // print_r($cart);
        // die;
        return $this->loadView('giohang','Giỏ hàng của bạn',$cart);
    }

    function postCheckout(){
        $name = $_POST['fullname'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $note = $_POST['note'];

        $model = new CheckoutModel;
        //luu khach hang
        $idCustomer = $model->insertCustomer($name,$email,$phone,$address);
        if(!$idCustomer){
            $_SESSION['message'] = "Đặt hàng không thành công. Vui lòng kiểm ra lại";
            header('Location:checkout.php');
            return;
        }

        // luu hoa don
        $dateOrder = date('Y-m-d',time());
        $oldCart = isset($_SESSION['cart']) ? $_SESSION['cart'] : null;
        $cart = new Cart($oldCart);
        $total = $cart->totalPrice;

        $token = createToken();
        $tokenDate = date('Y-m-d H:i:s',time());
        $idBill = $model->insertBill($idCustomer,$dateOrder,$total,$token,$tokenDate,$note);

        if(!$idBill){
            //xoá customer vừa insert
            $model->deleteRecentCustomer($idCustomer);
            $_SESSION['message'] = "Đặt hàng không thành công. Vui lòng kiểm ra lại";
            header('Location:checkout.php');
            return;
        }

        //luu detail
        foreach($cart->items as $idFood=>$food){
            $quantity = $food['qty'];
            $price = $food['price'];
            $model->insertBillDetail($idBill,$idFood,$quantity,$price);
        }
        unset($_SESSION['cart']);
        unset($cart);

        //gui mail

        $_SESSION['message'] = "Đặt hàng thành công. Vui lòng kiểm ra email để xác nhận đơn hàng";
        header('Location:checkout.php');
        
    }
}


?>