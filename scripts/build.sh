#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
cd ../frontend
npm install &&
npm install grunt-cli &&
npm install bower &&
bower --allow-root install &&
grunt production build --force
