<?php
include_once 'Controller.php';
include_once 'helper/Cart.php';
include_once 'models/CheckoutModel.php';
include_once 'helper/functions.php';
include_once 'helper/mailer/mailer.php';

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
            $_SESSION['error'] = "1. Đặt hàng không thành công. Vui lòng kiểm ra lại";
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

        //var_dump($idBill);die;
        if(!$idBill){
            //xoá customer vừa insert
            $model->deleteRecentCustomer($idCustomer);
            $_SESSION['error'] = "2. Đặt hàng không thành công. Vui lòng kiểm ra lại";
            header('Location:checkout.php');
            return;
        }

        //luu detail
        foreach($cart->items as $idFood=>$food){
            $quantity = $food['qty'];
            $price = $food['price'];
            $billDetail = $model->insertBillDetail($idBill,$idFood,$quantity,$price);

            //var_dump($billDetail);die;
            if(!$billDetail){
                //delete? customer,bill,bill_detail?
                //xoá customer vừa insert
                $model->deleteRecentBillDetail($idBill);
                $model->deleteRecentBill($idBill);
                $model->deleteRecentCustomer($idCustomer);
                
                $_SESSION['error'] = "3. Đặt hàng không thành công. Vui lòng kiểm ra lại";
                header('Location:checkout.php');
                return;
            }
        }
        
        //gui mail
        $subject = "Xác nhận đơn hàng DH00".$idBill;

        $tokenTime = time($tokenDate);
        $link = "http://localhost/shop0112/accept-order/$token/$tokenTime";


        $tableContent = '
        <table border="1" cellspacing="0px" cellpadding="0px" width="800px">
            <thead style="background-color:#f3f3f3">
                <th>Thông tin sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng tiền</th>
            </thead>
            <tbody>';
        foreach($cart->items as $idFood=>$food){
        $tableContent .="
                <tr>
                    <td style='text-align:center;'>".$food['item']->name."</td>
                    <td style='text-align:right'>".$food['qty']."</td>
                    <td style='text-align:right'>".$food['item']->price."</td>
                    <td style='text-align:right'>".$food['price']."</td>
                </tr>";
        }
        $tableContent.="
                <tr>
                    <td style='text-align:right;' colspan='3'>Tổng cộng</td>
                    <td style='text-align:right'>".$cart->totalPrice."</td>
                </tr>";

        $tableContent.='</tbody></table>';
        $content = "
                    Chào bạn $name,<br/>
                    Cảm ơn bạn đã đặt hàng tại website của chúng tôi.<br/>
                    Vui lòng chọn vào link sau để xác nhận đơn hàng:
                    $link
                    <br/>
                    <h3>Thông tin đơn hàng của bạn:</h3>
                    <br/>
                    $tableContent                    
                    <br/>
                    Thanks and Best Regard.
                    ";
        mailer($email, $name,$subject, $content);

        unset($_SESSION['cart']);
        unset($cart);

        $_SESSION['message'] = "Đặt hàng thành công. Vui lòng kiểm ra email để xác nhận đơn hàng";
        header('Location:checkout.php');
        
    }


    function acceptOrder(){
        $token = $_GET['token'];
        $time = $_GET['time'];

        $model = new CheckoutModel;
        $bill = $model->findBillByToken($token);

        print_r($bill);

        if(!$bill)
            echo "Đường dẫn bạn nhập vào không tồn tại....";
    }
}


?>