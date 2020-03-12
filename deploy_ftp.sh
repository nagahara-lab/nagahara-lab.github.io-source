#!/bin/bash -eu
rm -rf _site
cat _config.yml | sed -e 's/baseurl: "/baseurl: "\/nagahara/' | sed -e 's/https:\/\/nagahara-lab.github.io/http:\/\/ids.osaka-u.ac.jp/' > _config.yml
bundle exec jekyll build
rm -rf _site/deploy*

lftp -u $FTP_USER,$FTP_PASS $FTP_SERVER <<END_SCRIPT
rm -r nagahara
mirror -R _site nagahara
END_SCRIPT
