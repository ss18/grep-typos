#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

tmp_file=$(mktemp)
awk '!seen[$0]++' ../data/typos.txt >> $tmp_file
mv $tmp_file ../data/typos.txt
rm -rf $tmp_file