<?php
require_once 'DBConnect.php';
class CheckoutModel extends DBConnect{

    function insertCustomer($name,$email,$phone,$address){
        $sql = "INSERT INTO customers(name,email,phone,address)
                VALUES('$name','$email','$phone','$address')";
        $r = $this->executeQuery($sql); 
        return $r ? $this->getLastId(): false;
    }

    function insertBill($idCustomer,$dateOrder,$total,$token,$tokenDate,$note){
        $sql = "INSERT INTO bills(id_customer,date_order,total,token,token_date,note)
                VALUES($idCustomer,'$dateOrder',$total,'$token','$tokenDate','$note')";
        $r = $this->executeQuery($sql); 
        return $r ? $this->getLastId(): false;
    }

    function insertBillDetail($idBill,$idFood,$quantity,$price){
        $sql = "INSERT INTO bill_detail(id_bill,id_food,quantity,price)
                VALUES($idBill,$idFood,$quantity,$price)";
        return $this->executeQuery($sql); 
    }

    function deleteRecentCustomer($idCustomer){
        $sql = "DELETE FROM customers WHERE id=$idCustomer";
        return $this->executeQuery($sql);
    }

    function deleteRecentBill($idBill){
        $sql = "DELETE FROM bills WHERE id=$idBill";
        return $this->executeQuery($sql);
    }

    function deleteRecentBillDetail($idBill){
        $sql = "DELETE FROM bill_detail WHERE id_bill=$idBill";
        return $this->executeQuery($sql);
    }


}


?>