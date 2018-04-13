#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
#          TODO:
# 				- optimize search
# 				- add more typos
#         - use https://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings
#
# ------------------------------------------------------------------

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please provide path."
    echo "Usage:"
    echo "$0 path"
    echo "$0 path --exclude='*.po'"
    exit 1
fi

readonly path=$1

# No exclude by default
exclude_mask=''

if [ $# -eq 2 ]
  then
  if [[ $2 == --exclude* ]]
    then
    exclude_mask=`cut -d "=" -f 2 <<< "$2"`
  fi
fi


# read from file
wrong_words=()
while IFS= read -r line
do
	wrong_words+=("$line")
done < "data/typos.txt"

echo "Search typos in $path"

pattern_size=512
counter=0
pattern=""

for i in "${wrong_words[@]}"
do
  if [ "$counter" -eq "0" ];then 
    pattern=$i
  elif [ "$counter" -eq "$pattern_size" ];then
    grep --color -r --exclude=$exclude_mask -I "$pattern" $path
    pattern=$i
    counter=0
  else
    pattern=$pattern"\|"$i
  fi
  counter=$((counter+1))
done

grep --color -r --exclude=$exclude_mask -I "$pattern" $path
