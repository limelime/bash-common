#!/bin/bash
set -e
# Description: Test func_sizeof_kb.

. assert.sh

# Test none-file nor none-directory.
  assert_raises "func_sizeof_kb /dev/null" 1

# Test no parameter
  assert_raises "func_sizeof_kb" 0

# Test with specific file size.
  FILE_1M=file_1mb.txt
  dd if=/dev/null of=${FILE_1M} bs=1 count=0 seek="1M" 1> /dev/null 2>&1 
  assert "func_sizeof_kb ${FILE_1M}" "1024"

assert_end func_sizeof_kb