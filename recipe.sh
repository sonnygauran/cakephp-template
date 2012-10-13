#!/bin/sh

PROJECT_NAME="project"

if [ $# -eq 0 ]; then
    echo "Enter project name: (eg. 'project')"
    read PROJECT_NAME
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

# Fix the Cakephp path
php prepare_cakephp.php
git add webroot/index.php
git commit -m 'Replaced CAKE_CORE_INCLUDE_PATH with path to composer-installed CakePHP'

rm README.md
rm recipe.sh
rm prepare_cakephp.php

echo "cd $PROJECT_NAME.git" | pbcopy

echo "cd '$PROJECT_NAME.git'    <----- Execute this and get started! (or just hit Paste)"