#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
#          TODO: write me
# ------------------------------------------------------------------

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please provide path."
    echo "Usage: $0 path"
    exit 1
fi

readonly path=$1

wrong_words=()
while IFS= read -r line
do
	wrong_words+=("$line")
done < "typos.txt"

pattern=${wrong_words[0]}

for i in "${wrong_words[@]:1}"
do
	pattern=$pattern"\|"$i
done

echo "Search typos in $path..."
grep --color -r "$pattern" $path
