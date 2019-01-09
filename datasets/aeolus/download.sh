#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/download"
  exit 1
fi
mkdir -p $1
cd $1
rm -rf *

########## Download files

wget -a download.log https://datadryad.org/bitstream/handle/10255/dryad.105332/aeolus_v1.zip

########## UNCOMPRESS

# ZIP
# Recursive in subdir
find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`/${filename%.*}" "$filename"; done;

### TODO

# Then the TSV files need to be loaded into a MySQL database
# See instructions in the README.txt
# The SQL script used to load the data can be found in this directory as load_database.sql