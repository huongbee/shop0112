<?php
require_once 'DBConnect.php';
class CheckoutModel extends DBConnect{

    function insertCustomer($name,$email,$phone,$address){
        $sql = "INSERT INTO customers(name,email,phone,address)
                VALUES('$name','$email','$phone','$address')";
        $this->executeQuery($sql); 
        return $this->getLastId();
    }

    function insertBill($idCustomer,$dateOrder,$total,$token,$tokenDate){
        $sql = "INSERT INTO bills(id_customer,date_order,total,token,token_date)
                VALUES($idCustomer,'$dateOrder',$total,'$token','$tokenDate')";
        $this->executeQuery($sql); 
        return $this->getLastId();
    }

    function insertBillDetail(){
        
    }
}


?>