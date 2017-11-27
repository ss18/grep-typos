#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

tmp_file=$(mktemp)
./grep_typos.sh . >> $tmp_file
count_from_grep=$(wc -l < $tmp_file)
count_from_file=$(wc -l < ./data/typos.txt)
rm -rf $tmp_file

# Extra typos in test data: 1984.txt, diary.txt
extra=2

# always one more string "Search typos in $path"
tests_total=$((count_from_file+1+$extra))

if [ "$count_from_grep" -eq "$tests_total" ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Tests faild. count_from_grep=$count_from_grep,count_from_file=$count_from_file";
  exit 1;  
fi
