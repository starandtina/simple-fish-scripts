#! /usr/local/bin/fish

echo "Enter Any Number"
read n

set -l i 1
set -l c 1

while test $i -le $n
  set i (math $i + 1)
  set r (math $n \% $i)
  if test $r -eq 0
    set c (math $c + 1)
  end
end

if test $c -eq 2
  echo "Prime"
else
  echo "Not Prime"
end
