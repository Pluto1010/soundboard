#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
cd ../frontend
npm install -g grunt-cli &&
npm install -g bower &&
npm install &&
bower --allow-root install &&
grunt production build --force
