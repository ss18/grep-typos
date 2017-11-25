#!/bin/bash
# ------------------------------------------------------------------
# [Author] Semen Zhydenko
# ------------------------------------------------------------------

tmp_file=$(mktemp)
sort ../typos.txt >> $tmp_file
mv $tmp_file ../typos.txt
rm -rf $tmp_file