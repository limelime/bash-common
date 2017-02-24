#!/bin/bash
set -e
# Description: Add environment path to .bashrc
#   -Depends on: bashrc-add.sh


# Prepare environment path.
  env_path=$1
  if [ ! -d "${env_path}" ]; then
    echo "Error: "${env_path}": no such directory. Aborted!"
    exit 1;
  fi    
  env_path=$(readlink -ev "${env_path}")
  env_path="PATH=\$PATH:${env_path}"


# Add environment path.
  bashrc-add "${env_path}"
