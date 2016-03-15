#! /usr/local/bin/fish

set Probablity[1] 1

for i in (seq 32)
  set r 1
  for j in (seq $i)
    set r (math $r \* 2)
  end
  set index (math $i + 1)
  set Probablity[$index] $r
end

test (count $argv) -eq 0; and begin echo -e "Usage \n \t $0 numbers"; exit 1; end

echo -en "Decimal\t\tBinary\n" 

for input_int in $argv
  echo $input_int
  set s 0
  if test (echo -n 123 | wc -c) -gt 11
    echo "Support Upto 10 Digit number :: skiping \"$input_int\""; 
    continue; 
  end
  
  printf "%-10s\t" "$input_int" 

  for n in $Probablity[-1..1]
    if test $input_int -lt $n
      test $s -eq 1; and echo -n 0
    else
      echo -n 1
      set s 1
      set input_int (math $input_int - $n)
    end
  end
echo -e
end
