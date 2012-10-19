#!/bin/bash

php -d date.timezone=UTC Vendor/cakephp/cakephp/lib/Cake/Console/cake.php -app `pwd` $*
