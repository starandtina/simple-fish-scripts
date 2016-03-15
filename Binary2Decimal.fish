#! /usr/local/bin/fish

echo "Enter a number :"
read Binary

if test $Binary -eq 0
  echo "Enter a valid number "
else
  while test $Binary -ne 0
    set Decimal 0
    set power 1
    while test $Binary -ne 0
      set rem (math $Binary \% 10)
      set tmp (math $rem \* $power)
      set Decimal (math $Decimal + $tmp)
      set power (math $power \* 2)
      set Binary (math $Binary / 10)
    end
    echo " $Decimal"
  end
end
