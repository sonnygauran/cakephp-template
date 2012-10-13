<?php

$default= "//define('CAKE_CORE_INCLUDE_PATH', ROOT . DS . 'lib')";
$new    = "define('CAKE_CORE_INCLUDE_PATH', ROOT . DS . APP_DIR . DS . 'Vendor' . DS . 'cakephp' . DS . 'cakephp' . DS . 'lib')";


$filename = dirname(__FILE__)."/webroot/index.php";

$contents = file_get_contents(dirname(__FILE__)."/webroot/index.php");

$contents = str_replace($default, $new, $contents);

file_put_contents($filename, $contents);


