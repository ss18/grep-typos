#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
#
# Provide https or ssh path to check git repo for typos
# ------------------------------------------------------------------

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please provide web url path to the repo."
    echo "Usage: $0 path"
    exit 1
fi

readonly github_path=$1
eval tmp_path=`mktemp -d`
git clone $github_path $tmp_path
./grep_typos.sh $tmp_path
rm -rf $tmp_path
