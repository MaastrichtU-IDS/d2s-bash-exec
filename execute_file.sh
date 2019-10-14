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

if [ -z "$3" ]
then
  args=""
else
  # If args provided as a string
  args=$3
fi

if [[ $1 == /*.sh ]]; then 
  # If user provides direct .sh file
  source $1 $args
else 
  wget $1 
  # https://raw.githubusercontent.com/MaastrichtU-IDS/data2services-download/master/datasets/stitch-sample/download.sh
  #mkdir input
  #cd input
  for filename in *.sh; do
    source ${filename} $args
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

