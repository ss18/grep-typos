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
    echo "Usage: $0 [OPTION]... PATH"
    echo "Options:"
    echo "--exclude=[EXCLUSIONS]    Exclude specified files from processing."
    echo "--substrings              Match data/typos.txt against substrings. Default behavior is to"
    echo "                          match data/common_misspellings.txt against whole words only."
    exit 1
fi

# No exclude by default
exclude_mask=''

# Default to whole word matching
match_substrings=false

exit_status=0


for argument in "$@"
do
  case $argument in
    --exclude=*)
    exclude_mask=`cut -d "=" -f 2 <<< "$argument"`
    shift
    ;;
    --substrings)
    match_substrings=true
    shift
    ;;
    *)
    path=$argument
    ;;
  esac
done


if [ "$match_substrings" == true ];then
  data_file="data/typos.txt"
else
  data_file="data/common_misspellings.txt"
fi


# read from file
wrong_words=()
while IFS= read -r line
do
	wrong_words+=("$line")
done < "$data_file"

echo "Search typos in $path"

pattern_size=512
counter=0
pattern=""

for i in "${wrong_words[@]}"
do
  if [ "$counter" -eq "0" ];then 
    if [ "$match_substrings" == true ];then
      pattern=$i
    else
      pattern="\b${i}\b"
    fi
  elif [ "$counter" -eq "$pattern_size" ];then
    if grep --color -r --exclude=$exclude_mask -I "$pattern" $path; then
      exit_status=1
    fi
    pattern=$i
    counter=0
  else
    if [ "$match_substrings" == true ];then
      pattern=$pattern"\|"$i
    else
      pattern="${pattern}\\|\b${i}\b"
    fi
  fi
  counter=$((counter+1))
done

if grep --color -r --exclude=$exclude_mask -I "$pattern" $path; then
  exit_status=1
fi

exit $exit_status
