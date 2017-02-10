# Description: Return directory path where this function is called.

function func_get_current_dir()
{ 
  local CURRENT_DIR=$(dirname "$0")           # relative
  CURRENT_DIR=$( cd "${CURRENT_DIR}" && pwd ) # absolutized and normalized
  if [ -z "${CURRENT_DIR}" ]; then
    # error; for some reason, the path is not accessible
    # to the script (e.g. permissions re-evaled after suid)
    return 1  # fail
  fi
  
  echo "${CURRENT_DIR}"
}  
export -f func_get_current_dir

# TEST:
# cd $HOME
# echo "func_get_current_dir" > /tmp/test_func_get_current_dir
# chmod +x /tmp/test_func_get_current_dir
# /tmp/test_func_get_current_dir
# [Show /tmp]