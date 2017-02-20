#!/bin/bash
set -e
# Description: Load all *.sh from lib/

LIB_DIR=$(readlink -ev ./lib)
source <(cat ${LIB_DIR}/*.sh)

