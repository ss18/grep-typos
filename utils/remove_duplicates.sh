#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

tmp_file=$(mktemp)
awk '!seen[$0]++' ../typos.txt >> $tmp_file
mv $tmp_file ../typos.txt
rm -rf $tmp_file