#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/kraken-download/datasets"
  exit 1
fi

mkdir -p $1
cd $1
rm -rf *

BASE_URL=http://rsync.wwpdb.org/pub/pdb/data/structures/divided/XML/

# A csv file and release.html
wget -a download.log $BASE_URL

dir_array=( $(cat index.html | sed -r -n 's/.*href="([a-zA-Z0-9]*\/)".*/\1/p') )

#cat index.html.1 | sed -r -n 's/.*href="([a-z0-9]*\/)".*/\1/p')

for dir in "${dir_array[@]}"
do
  echo "Downloading... ${dir}"
  mkdir -p ${dir}
  cd ${dir}
  wget -a download.log -O index.html  $BASE_URL${dir}
  file_array=( $(cat index.html | sed -r -n 's/.*href="([a-zA-Z0-9]*?(\.zip|\.gz|\.csv|\.tsv|\.tar))".*/\1/p') )

  for file in "${file_array[@]}"
  do
    wget -a download.log $BASE_URL${dir}${file}
  done

  #<a href="10gs.xml.gz"
done

find . -name "*.gz" -exec gzip -d  {} +