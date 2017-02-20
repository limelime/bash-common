#!/bin/bash
set -e
# Description: Test func_dir_get_executing_path.

. assert.sh

# Test current directory.
  assert "func_dir_get_executing_path" "$(readlink -ev .)"

# Test call from different directory path.
  echo 'func_dir_get_executing_path' > ${HOME}/executing_path.sh
  chmod +x ${HOME}/executing_path.sh
  assert "${HOME}/executing_path.sh" "${HOME}"
  
assert_end func_dir_get_executing_path