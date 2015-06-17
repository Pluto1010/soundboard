#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
cd ../frontend
export NODE_ENV=development

echo "###############################" &&
echo "INSTALLING GRUNT-CLI" &&
echo "###############################" &&
npm install -g grunt-cli &&
echo "###############################" &&
echo "INSTALLING BOWER" &&
echo "###############################" &&
npm install -g bower &&
echo "###############################" &&
echo "RUNNING NPM INSTALL" &&
echo "###############################" &&
npm install &&
echo "###############################" &&
echo "RUNNING BOWER INSTALL" &&
echo "###############################" &&
bower --allow-root install &&
echo "###############################" &&
echo "BUILDING, TEHEE" &&
echo "###############################" &&
grunt production build --force

rm npm-debug.log
