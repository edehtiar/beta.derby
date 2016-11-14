<?php
if ($_GET['Result']){
	header( 'Location: http://'.$_SERVER['HTTP_HOST']  . '/index.php?route=payment/kaznachey/success&Result='.$_GET['Result'].'&OrderId='.$_GET['OrderId'], true, 301 );
}

?>
