#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

# Part 1, test whole word matching
tmp_file=$(mktemp)
./grep_typos.sh ./data/common_misspellings.txt >> $tmp_file
count_from_grep=$(wc -l < $tmp_file)
count_from_file=$(wc -l < ./data/common_misspellings.txt)
#rm -rf $tmp_file

# always one more string "Search typos in $path"
tests_total=$((count_from_file+1))

if [ "$count_from_grep" -eq "$tests_total" ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Test of whole word matching failed. count_from_grep=$count_from_grep,count_from_file=$count_from_file";
  exit 1;  
fi


# Part 2, test --substrings
tmp_file=$(mktemp)
./grep_typos.sh --substrings ./data/typos.txt >> $tmp_file
count_from_grep=$(wc -l < $tmp_file)
count_from_file=$(wc -l < ./data/typos.txt)
rm -rf $tmp_file

# always one more string "Search typos in $path"
tests_total=$((count_from_file+1))

if [ "$count_from_grep" -eq "$tests_total" ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Test of --substrings failed. count_from_grep=$count_from_grep,count_from_file=$count_from_file";
  exit 1;  
fi


# Part 3, testing exclude
tmp_file=$(mktemp)
./grep_typos.sh . --exclude='*.txt' >> $tmp_file
count_from_grep=$(wc -l < $tmp_file)
rm -rf $tmp_file

if [ "$count_from_grep" -eq 0 ];then
  echo "Tests passed.";
  exit 0;
else
  echo "Test of --exclude failed. count_from_grep=$count_from_grep, but should be 0";
  exit 1;  
fi