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
    echo "Usage: $0 path"
    exit 1
fi

readonly path=$1

# read from file
wrong_words=()
while IFS= read -r line
do
	wrong_words+=("$line")
done < "data/typos.txt"

# sort alphabetically
wrong_words=($(for l in ${wrong_words[@]}; do echo $l; done | sort))

pattern=${wrong_words[0]}

for i in "${wrong_words[@]:1}"
do
	pattern=$pattern"\|"$i
done

# pattern is ready -> do actual grep
echo "Search typos in $path"
if ! grep --color -r "$pattern" $path
then
	echo "No typos found."
fi
