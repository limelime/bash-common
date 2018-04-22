# Description: Create soft symbolic link: TARGET_NAME -> LINK_NAME

function func_link()
{ # Warning: LINK_NAME will be destroyed. 
  local TARGET_NAME=$1
  local LINK_NAME=$2
  if [ $# -ne 2 ]; then
    echo "Error: Missing arguments. Aborted!"
    echo "  ${FUNCNAME[0]} TARGET_NAME LINK_NAME"
    echo "  ${FUNCNAME[0]} /backup/data/google-chrome  /root/.config/google-chrome"
    return 1;
  fi

  # Copy original link_name if target name doesn't exist
  if [ ! -e "${TARGET_NAME}" ]; then
    if [ -e "${LINK_NAME}" ]; then
      cp -av "${LINK_NAME}" "${TARGET_NAME}"
    fi
  fi
  
  # Link
  TARGET_NAME=$(readlink -ev "${TARGET_NAME}") &&  rm -rf "${LINK_NAME}"
  ln -s "${TARGET_NAME}" "${LINK_NAME}"
  ls -l "${LINK_NAME}"  
}  
export -f func_link

# Test: XXXX
