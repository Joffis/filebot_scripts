#!/bin/bash

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

PATH=$1
NAME=$2
LABEL=$3

# Settings
SKIP_EXTRACT=n
MUSIC=n

# Ignored labels
if [ "$LABEL" = "ignore" ] || [ "$LABEL" = "S" ] || [ "$LABEL" = "M" ]; then
   exit
else
filebot -script "$HOME/scripts/amc_custom.groovy" \
    --output "$HOME/media" \
    -non-strict --encoding utf8 --log all --log-file "$HOME/scripts/amc.log" --action duplicate --conflict override \
    --def tmdbTV=y clean=y artwork=false ut_kind=multi "ut_dir=$PATH" "ut_title=$NAME" "ut_label=$LABEL" \
        extractFolder="$HOME/fiels/unpack" ignore="ignore" music=$MUSIC skipExtract=$SKIP_EXTRACT &
fi
