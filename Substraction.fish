#! /usr/local/bin/fish

echo .Enter the First Number: . 
read a 
echo .Enter the Second Number: . 
read b 
set -l x (math $a - $b) 
echo $a - $b = $x


