<?php
function mailer($emailReceiver, $nameReceiver,$subject, $content){
    require 'src/PHPMailer.php';
    $mail = new PHPMailer(true);                        
    try {
        $mail->CharSet = "UTF-8";

        $mail->SMTPDebug = 0;                              
        $mail->isSMTP();                                  
        $mail->Host = 'smtp.gmail.com';  
        $mail->SMTPAuth = true;                         
        $mail->Username = 'huonghuong08.php@gmail.com';                 
        $mail->Password = '0123456789000';                        
        $mail->SMTPSecure = 'tls';                           
        $mail->Port = 587;                              
        
        $mail->setFrom('huonghuong08.php@gmail.com', 'SHOP 0112');
        $mail->addAddress($emailReceiver, $nameReceiver);     
        $mail->addReplyTo('huonghuong08.php@gmail.com', 'SHOP 0112');
        
        $mail->isHTML(true);                   
        $mail->Subject = $subject;
        $mail->Body    = $content;

        $mail->send();
        return true;
    } 
    catch (Exception $e) {
        echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        return false;
    }
}
