#! /usr/local/bin/fish

echo "Enter A Number"
read n

set -l arm 0
set -l temp $n

while test $n -ne 0
  set r (math $n \% 10)
  set arm (math $arm + $r \* $r \* $r)
  set n (math $n / 10)
end
echo $arm

if test $arm -eq $temp
  echo "Armstrong"
else
  echo "Not Armstrong"
end
