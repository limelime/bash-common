# Description: Backup TARGET_DIR path
#   -Depends on: XXXX

function func_backup()
{
  TARGET_DIR=$1
  if [ ! -e "${TARGET_DIR}" ]; then
    echo "Error: ${TARGET_DIR}: no such file or directory. Aborted!"
    echo "  $0 FILE_OR_DIRECTORY"
    return 1;
  fi
  TARGET_DIR=$(readlink -ev "${TARGET_DIR}")
  
  # Backup
  DATE_STRING=$(date +"%Y-%m-%d.%0k.%M.%S")
  INPUT_BASE_DIR="$(dirname "${TARGET_DIR}")"
  INPUT="$(basename "${TARGET_DIR}")"
  OUTPUT_ARCHIVE="${INPUT_BASE_DIR}/${INPUT}_${DATE_STRING}.tar.bz2"
  
  tar -jcf "${OUTPUT_ARCHIVE}" -C "${INPUT_BASE_DIR}" "${INPUT}"
  # List content: tar -tvf archive.tar.bz2
  # Extract content: tar -xvjf archive.tar.bz2
}  
export -f func_backup

# Test: XXXX