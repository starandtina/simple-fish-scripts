#! /usr/local/bin/fish

echo "How many numbers do you want of Fibonacci series ?"
read total

set x 0
set y 1
set i 2

echo "Fibonacci Series up to $total terms :: "
echo $x
echo $y

while test $i -lt $total
  set i (math $i + 1)
  set z (math $x + $y)
  echo $z
  set x $y
  set y $z
end
