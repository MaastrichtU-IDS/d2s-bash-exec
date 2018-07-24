#!/bin/bash
if [[ -z "$1" ]]; then
  echo "Provide a target directory to store downloaded files as argument. E.g.: /data/kraken-download/datasets"
  exit 1
fi
mkdir -p $1
cd $1
rm -rf *

# Download interpro https://www.ebi.ac.uk/interpro/download.html
wget -a download.log ftp://ftp.ebi.ac.uk/pub/databases/interpro/interpro.xml.gz

find . -name "*.gz" -exec gzip -d  {} +