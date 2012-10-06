#!/bin/bash

php -d date.timezone=Asia/Manila Vendor/cakephp/cakephp/lib/Cake/Console/cake.php -app `pwd` $*