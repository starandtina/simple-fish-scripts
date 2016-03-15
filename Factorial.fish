#! /usr/local/bin/fish

echo "Enter The Number"
read a
set -l fact 1
while test $a -ne 0
  set fact (math $fact \* $a)
  set a (math $a - 1)
end
echo $fact
