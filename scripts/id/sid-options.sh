#!/bin/bash
set -e
# Description: Display all available identifiers.
#   -Depends on: XXXX

types=(sec-short sec-medium sec-long)
types+=(sec-full)

printf "%-10s  %-6s %-25s\n" 'Type' 'Length' 'Output'
echo "============================="
for type in "${types[@]}"
do
  id_result=$(sID "${type}")
  printf "%-10s  %-6s %-25s\n" "${type}" "${#id_result}" "${id_result}" 
done  

