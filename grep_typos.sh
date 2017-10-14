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

declare -a wrong_words=(
	"absense"
	"abscence"
	"accross"
	"acheive"
	"apparantly"
	"appearence"
	"arguement"
	"basicly"
	"becuase"
	"begining"
	"beleive"
	"belive"
	"buisness"
	"calender"
	"catagory"
	"completly"
	"dissapear"
	"definately"
	"cunt"
	"foriegn"
	"finaly"
	"freind"
	"gaurd"
	"knowlege"
	"neccessary"
	"noticable"
	"succesful"
	"unfortunatly"
	"peice"
	"realy"
	"foward"
	"freind"
	"immediatly"
	"persistant"
	"peice"
	"recieve"
	"truely"
	)


pattern=${wrong_words[0]}

for i in "${wrong_words[@]:1}"
do
	pattern=$pattern"\|"$i
done

echo "Search typos in $path..."
grep --color -r "$pattern" $path
