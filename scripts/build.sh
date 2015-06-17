#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR
cd ../frontend
npm install -g bower &&
npm install &&
npm install -g grunt-cli &&


bower --allow-root install &&
grunt production build --force
