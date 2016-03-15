#! /usr/local/bin/fish

clear
set -l sum 0
set -l i "y"

echo " Enter one no."
read n1
echo "Enter second no."
read n2
while test $i = "y"
  echo "1.Addition"
  echo "2.Subtraction"
  echo "3.Multiplication"
  echo "4.Division"
  echo "Enter your choice"
  read ch
  switch $ch
  case 1
      echo "Sum =" (math $n1 + $n2)
  case 2
      echo "Sum =" (math $n1 + $n2)
  case 3
      echo "Sum =" (math $n1 \* $n2)
  case 4
      echo "Sum =" (math $n1 / $n2)
  case '*'
      echo "Invalid choice"
  end

  echo "Do u want to continue (y/n)) ?"
  read i
  if test $i != "y"
    exit
  end
end

