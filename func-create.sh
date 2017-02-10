#!/bin/bash
set -e
# Description: Create standard function template.

FUNCTION_NAME=$1

# Error handling
  if [ -z "${FUNCTION_NAME}" ]; then
    echo "Error: FUNCTION_NAME can't be empty. Aborted!"
    exit 1;
  fi

# Create function file.
LIB_DIR=$(readlink -ev ./lib)
FUNCTION_NAME="func_${FUNCTION_NAME}"
sed "s/FUNCTION_NAME/${FUNCTION_NAME}/" template-func.sh > "${LIB_DIR}/${FUNCTION_NAME}.sh"

# Display result.
echo "Created: ${LIB_DIR}/${FUNCTION_NAME}.sh"