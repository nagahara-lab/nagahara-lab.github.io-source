#!/bin/bash -eu
cd _site
rm -rf deploy* secrets.tar*
git init
git add .
git commit -m "Publishing site on `date "+%Y-%m-%d %H:%M:%S"`"
git push -f git@github.com.io:nagahara-lab/nagahara-lab.github.io.git master:master
