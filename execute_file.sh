#!/bin/bash
echo $(pwd)
wget $1 
# https://raw.githubusercontent.com/MaastrichtU-IDS/data2services-download/master/datasets/stitch-sample/download.sh
#mkdir input
#cd input
for filename in *.sh; do
  source ${filename}
done



# POSITIONAL=()
# while [[ $# -gt 0 ]]
# do
# key="$1"

# case $key in
#     -d|--download-datasets)
#     DOWNLOAD_DATASETS="$2"
#     shift # past argument
#     shift # past value
#     ;;
#     -p|--working-path)
#     WORKING_PATH="$2"
#     shift # default is /data
#     shift 
#     ;;
#     -un|--username)
#     USERNAME="$2"
#     shift 
#     shift 
#     ;;
#     -pw|--password)
#     PASSWORD="$2"
#     shift 
#     shift 
#     ;;
#     --clean)
#     DELETE_PREVIOUS_DDL=true
#     shift 
#     ;;
#     *)    # unknown option
#     POSITIONAL+=("$1") # save it in an array for later
#     shift # past argument
#     ;;
# esac
# done
# set -- "${POSITIONAL[@]}" # restore positional parameters

