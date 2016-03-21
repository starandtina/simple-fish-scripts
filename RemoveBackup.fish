#! /usr/local/bin/fish

rsync -avz -e ssh --progress /path/to/yourfile user@backupserver.com:/backup/
echo "backup for "(date); and mail -s "backup complete" user@youremail.com
