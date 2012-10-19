<?php

$default= "//define('CAKE_CORE_INCLUDE_PATH', ROOT . DS . 'lib')";
$new    = "define('CAKE_CORE_INCLUDE_PATH', ROOT . DS . APP_DIR . DS . 'Vendor' . DS . 'cakephp' . DS . 'cakephp' . DS . 'lib')";

$files = array(
    dirname(__FILE__)."/webroot/index.php",
    dirname(__FILE__)."/webroot/test.php"
);
foreach ($files as $filename) {
    $contents = file_get_contents($filename);
    $contents = str_replace($default, $new, $contents);
    file_put_contents($filename, $contents);
}

