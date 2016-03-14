#! /usr/local/bin/fish

set -l MAX 95
set -l EMAIL USER@domain.com
set -l PART /dev/disk1

set -l USE (df -h | grep $PART | awk '{ print $5 }' | cut -d'%' -f1)

if test $USE -gt $MAX
  echo "Percent used: $USE"; and mail -s "Running out of disk space" $EMAIL
end
