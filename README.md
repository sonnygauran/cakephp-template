# CakePHP Template

To start a CakePHP project, execute the following:

    curl -L https://raw.github.com/sonnygauran/cakephp-template/master/create.sh | sh -x

This will create a folder `project.git`. Just rename the folder to your initial project name.

That's it.


## Details

This installs the following:

* CakePHP (via composer)
* Croogo (via separate branch)
* PHPUnit (via composer)


use `./cake` to execute the cake shell.

use `./test` to run your non-cake test cases.


## Environment
* The file `.sh` contains locally-specific configurations for the script. Modify as required. This may need to be added to `.gitignore`.
* The php.ini entry `date.timezone` is set during runtime. Defaults value is UTC.
* The `CAKE_CORE_INCLUDE_PATH` is already adjusted to use the CakePHP build from the composer install.

## Executables
* `./cake test` to run CakePHP tests.
  * Run `./cake test core Basics` to check PHPUnit and run a CakePHP test.
* `./test Vendor/phpunit/phpunit/Tests/Framework/SuiteTest.php` to verify that PHPUnit is working.

## The `phpunit.xml`
  * This file is used by both `./cake test` and `./test` test runners.
  * The file `.testBootstrap.php` is the bootstrap file defined on `phpunit.xml`
