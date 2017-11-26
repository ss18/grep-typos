#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

tmp_file=$(mktemp)
./grep_typos.sh . >> $tmp_file
count_from_grep=$(wc -l < $tmp_file)
count_from_file=$(wc -l < ./data/typos.txt)
rm -rf $tmp_file

# always one more string "Search typos in $path"
count_from_file=$((count_from_file+1))

if [ "$count_from_grep" -eq "$count_from_file" ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Tests faild.";
  exit 1;  
fi
