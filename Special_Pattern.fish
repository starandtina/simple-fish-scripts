#! /usr/local/bin/fish

set -l MAX_NO 0

echo -n "Enter Number between (5 to 9) : "
read MAX_NO

if test ! $MAX_NO -ge 5 -a $MAX_NO -le 9
   echo "WTF... I ask to enter number between 5 and 9, Try Again"
   exit 1
end

clear

for i in (seq $MAX_NO)
  for s in (seq $MAX_NO $i)
    echo -n " "
  end
  for j in (seq $i)
    echo -n " ." 
  end
  echo ""
end
###### Second stage ######################
for i in (seq $MAX_NO 1)
  for s in (seq $i $MAX_NO)
    echo -n " "
  end
  for j in (seq $i)
    echo -n " ."
  end
  echo ""
end
echo -e "\n\n\t\t\t Whenever you need help, Tecmint.com is always there"
