#!/bin/sh

PROJECT_NAME="project";

if [ $# -eq 1 ]; then
    PROJECT_NAME=$1
fi

echo $PROJECT_NAME | pbcopy

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

echo "cd '$PROJECT_NAME.git'    <----- Execute this and get started!"