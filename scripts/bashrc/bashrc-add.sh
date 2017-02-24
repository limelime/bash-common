#!/bin/bash
set -e
# Description: Add line to .bashrc

line="$1"
if ! grep -q "${line}" ~/.bashrc; then
  echo "${line}" >> ~/.bashrc
  source ~/.bashrc
  echo "~/.bashrc: Added: ${line}."
fi  
