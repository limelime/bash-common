#!/bin/bash
set -e
# Description:

. assert.sh


assert_raises "func_cmd_exists bash"
assert_raises "func_cmd_exists" 1
assert_raises "func_cmd_exists invalidCommand" 1


assert_end examples