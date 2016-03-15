#! /usr/local/bin/fish

echo .Enter The Number upto which you want to Print Table: . 
read n

set -l i 1
while test $i -ne 10
  set i (math $i + 1)
  set table (math $i \* $n)
  echo $table
end
