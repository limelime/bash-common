# Description: Add environment path to bashrc
#   -Depends on: func_bashrc_add.sh

function func_bashrc_add_path()
{ 
  local ENV_PATH=$1
  ENV_PATH=$(readlink -ev "${ENV_PATH}")
  ENV_PATH="PATH=\$PATH:${ENV_PATH}"
  func_bashrc_add "${ENV_PATH}"
}  
export -f func_bashrc_add_path

# Test: XXXX