#!/bin/sh

PROJECT_NAME="project"

if [ $# -eq 0 ]; then
    echo "Enter project name: (eg. 'project')"
    read PROJECT_NAME
fi

if [ "$PROJECT_NAME" == "" ]; then
    echo "Using 'project' as project name..."
    PROJECT_NAME="project"
fi

# Get the template files
git clone https://github.com/sonnygauran/cakephp-template.git $PROJECT_NAME.git
cd $PROJECT_NAME.git

# Re-initialize the git repository
rm -rf .git
git init
git add composer.json cake
git commit -m 'Added composer.json and app cake shell'

# Retrieve Croogo
git remote add croogo https://github.com/croogo/croogo.git
git fetch croogo
git checkout -b croogo croogo/master
git checkout master
git rebase croogo

# Disregard initial composer libraries
cat .gitignore.template >> .gitignore
git add .gitignore
git commit -m 'Disregarding composer libraries via .gitignore'
rm .gitignore.template

# Retrieve project dependencies
composer install

# Finalize the project
git add composer.lock
git commit -m 'Adding lock on composer libraries'

# Add composer autoload to bootstrap
echo "\n\trequire ROOT . DS . APP_DIR . DS . 'Vendor' . DS . 'autoload.php';" >> Config/bootstrap.php
git add Config/bootstrap.php
git commit -m 'Added composer autoload file to bootstrap'

# Fix the Cakephp path
php prepare_cakephp.php
git add webroot/index.php
git add webroot/test.php
git commit -m 'Replaced CAKE_CORE_INCLUDE_PATH with path to composer-installed CakePHP'

rm README.md
rm create.sh
rm prepare_cakephp.php

git add .testBootstrap.php phpunit.xml test
git commit -m 'Added local test runner with configurations'

echo "cd $PROJECT_NAME.git" | pbcopy

echo "cd '$PROJECT_NAME.git'    <----- Execute this and get started! (or just hit Paste)"
echo ""
echo "Notes:"
echo " *  \`.sh\` is a local file loaded/source by \`./cake\` and \`./test\`."
echo "        \`echo \".sh\" >> .gitignore\` when required."
echo ""
echo "Enjoy!"
