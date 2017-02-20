#!/bin/bash
set -e
# Description: Test func_id.

. assert.sh

assert_raises "func_id" 1

assert_raises "func_id sec-short"
assert_raises "func_id sec-medium"
assert_raises "func_id sec-long"
assert_raises "func_id sec-full"



assert_end func_id