#!/bin/bash
set -e
# Description: Return identifier.
#   -Depends on: XXXX

type=$1
type=$( echo "${type}" | tr '[:upper:]' '[:lower:]' )

id=""
seconds_since_midnight=""
seconds_since_midnight=$(($(date '+(%H*60+%M)*60+%S')))
seconds_since_midnight=$(printf "%05d" ${seconds_since_midnight})  
  
case "${type}" in
  sec-short)
    id=$(date +"%Y%m%d.")${seconds_since_midnight}
    ;;
  sec-medium)
    id=$(date +"%Y-%m-%d.")${seconds_since_midnight}
    ;;
  sec-long)
    id=$(date +"%Y-%m-%d.%0k.%M.%S")
    ;;
  sec-full)
    id=$(date +"%Y%m%d%0k%M%S")
    ;;
  *)
    echo "Error: [${type}] is unknown type. Aborted!"
    echo " Run sID-options for all available types."
    exit 1;
esac

echo "${id}" 

