#!/bin/bash
echo $(pwd)

if [ -z "$2" ]
then
  # Create and change dir if output path provided
  echo "Output path: $(pwd)"
else
  mkdir -p $2
  cd $2
  echo "Output path: $(pwd)"
fi

if [[ $1 == /*.sh ]]; then 
  # If user provides direct .sh file (and pass args 2 to 5)
  source $1 $2 $3 $4 $5
else 
  wget $1 
  # https://raw.githubusercontent.com/MaastrichtU-IDS/d2s-transform-template/master/datasets/stitch/download/download.sh
  #mkdir input
  #cd input
  for filename in *.sh; do
    source ${filename} $2 $3 $4 $5
  done
fi

# if [[ "/var/vwd/wd/download.sh" == /*.sh ]]; then echo "yes" ; else echo "no" ; fi

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

