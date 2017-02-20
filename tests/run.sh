#!/bin/bash
set -e
# Description: Run all test scripts here.

source ../lib/func_cmd_exists.sh
./test-func_cmd_exists.sh

source ../lib/func_id.sh
./test-func_id.sh

source ../lib/func_link.sh
./test-func_link.sh
