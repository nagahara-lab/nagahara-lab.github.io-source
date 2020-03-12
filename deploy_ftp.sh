lftp -u $FTP_USER,$FTP_PASS $FTP_SERVER <<END_SCRIPT
rm -r nagahara
mirror -R _site nagahara
END_SCRIPT
