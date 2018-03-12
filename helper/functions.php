<?php
function createToken(){
    $string = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789"; //0-61

    $stringLength = strlen($string);//62
    //30
    $token = '';

    for($i=1;$i<=30;$i++){
        $start = rand(0,$stringLength-1);
        $token.=substr($string,$start,1);
    }
    return $token;
}

//iqY2waHBqthJJQtRCHznqCM55JWo0i
//WNGlUVpYzgKQFxmgIIn8mRBCROxT7Y
//twzQEIeWuTLfsX4X1Q9nlv4tcJ1y9t
?>