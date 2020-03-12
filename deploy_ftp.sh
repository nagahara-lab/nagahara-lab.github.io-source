#!/bin/bash -eu
lftp -c "set ftp:use-mdtm off;set ftp:ssl-allow no; open -u $FTP_USER,$FTP_PASS $FTP_SERVER; mirror -Re -x .git -x .ssh --verbose=3 --ignore-time _site $FTP_DIR --parallel=20" &
pid=$! # Process Id of the previous running command

spin='-\|/'

i=0
while kill -0 $pid 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .1
done
