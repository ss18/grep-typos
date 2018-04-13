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
tests_total=$((count_from_file+1))

if [ "$count_from_grep" -eq "$tests_total" ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Tests faild. count_from_grep=$count_from_grep,count_from_file=$count_from_file";
  exit 1;  
fi

# Part 2, testing exclude
tmp_file=$(mktemp)
./grep_typos.sh . --exclude='*.txt' >> $tmp_file
count_from_grep=$(wc -l < $tmp_file)
rm -rf $tmp_file

if [ "$count_from_grep" -eq 0 ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Tests faild. count_from_grep=$count_from_grep, but should be 0";
  exit 1;  
fi