#!/bin/bash
set -e
# Description: Test func_file_zero.

. assert.sh

# (-): No file input
  assert_raises "func_file_zero" 1

# (-): Symbolic link
  tmp_symbolic_file="$0_$(date +%N).tmp"
  echo "test symbolic" > "${tmp_symbolic_file}"
  ln -s "${tmp_symbolic_file}" "${tmp_symbolic_file}.ln"
  assert_raises "func_file_zero ${tmp_symbolic_file}.ln" 1
  rm -f "${tmp_symbolic_file}.ln" "${tmp_symbolic_file}"

# (+): Normal file
  tmp_normal_file="$0_$(date +%N).tmp"
  echo "test normal" > "${tmp_normal_file}"
  assert_raises "func_file_zero ${tmp_normal_file}" 0
  rm -f "${tmp_normal_file}"


assert_end func_file_zero