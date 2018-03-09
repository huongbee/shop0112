<?php
require_once 'DBConnect.php';
class CheckoutModel extends DBConnect{

    function insertCustomer($name,$email,$phone,$address){
        $sql = "INSERT INTO customers(name,email,phone,address)
                VALUES('$name','$email','$phone','$address')";
        $this->executeQuery($sql); 
        return $this->getLastId();
    }

    function insertBill($idCustomer,$dateOrder,$total,$token,$tokenDate,$note){
        $sql = "INSERT INTO bills(id_customer,date_order,total,token,token_date,note)
                VALUES($idCustomer,'$dateOrder',$total,'$token','$tokenDate','$note')";
        $this->executeQuery($sql); 
        return $this->getLastId();
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
}


?>