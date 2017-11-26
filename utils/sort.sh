#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

tmp_file=$(mktemp)
sort ../data/typos.txt >> $tmp_file
mv $tmp_file ../data/typos.txt
rm -rf $tmp_file