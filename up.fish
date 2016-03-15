#! /usr/local/bin/fish

set -l LEVEL $argv[1]
set CDIR .

for i in (seq $LEVEL)
  set CDIR ../$CDIR
end
cd $CDIR

echo "You are in: "$PWD
exec /usr/local/bin/fish
