#! /usr/local/bin/fish

echo "Enter The Number" 
read n 
set -l num (math $n \% 2)
if test $num -eq 0
  echo "$n is a Even Number" 
else 
  echo "$n is a Odd Number" 
end


