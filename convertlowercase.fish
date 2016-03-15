#! /usr/local/bin/fish

echo -n "Enter File Name : "
read fileName
 
if test ! -f $fileName
  echo "Filename $fileName does not exists"
  exit 1
end
 
tr '[A-Z]' '[a-z]' < $fileName >> small.txt
#tr "[:upper:]" "[:lower:]" < $fileName >> small.txt
