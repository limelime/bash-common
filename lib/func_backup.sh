# Description: Backup TARGET_DIR path
#   -Depends on: func_id.sh

function func_backup()
{
  local TARGET_DIR=$1
  if [ ! -e "${TARGET_DIR}" ]; then
    echo "Error: ${TARGET_DIR}: no such file or directory. Aborted!"
    echo "  $0 FILE_OR_DIRECTORY"
    return 1;
  fi
  TARGET_DIR=$(readlink -ev "${TARGET_DIR}")
  
  # Backup
  local DATE_STRING=$(func_id sec-medium)
  local INPUT_BASE_DIR="$(dirname "${TARGET_DIR}")"
  local INPUT="$(basename "${TARGET_DIR}")"
  local OUTPUT_ARCHIVE="${INPUT_BASE_DIR}/${INPUT}_${DATE_STRING}.tar.bz2"
  
  tar -jcf "${OUTPUT_ARCHIVE}" -C "${INPUT_BASE_DIR}" "${INPUT}"
  # List content: tar -tvf archive.tar.bz2
  # Extract content: tar -xvjf archive.tar.bz2
  
  echo "Backup to: ${OUTPUT_ARCHIVE}"
}  
export -f func_backup


function func_backup_del_old()
{
  local archive_prefix=$1
  
  local archive_list=$(ls -1 ${archive_prefix}*????-??-??.?????.tar.bz2 | sort -r)
  archive_list=$(echo "${archive_list}" | tail -n +2 ) # Remove first line
  archive_list=$(echo "${archive_list}" | head -n -1 ) # Remove last line

  #echo "${archive_list}"
  
  local counter=0
  local del_after_days=7
  while [ $counter -lt ${del_after_days} ]; do
    local day_exclude=$(date --date="-${counter} days" +%Y-%m-%d)
    archive_list=$(echo "${archive_list}" | grep -vF "${day_exclude}" )
    counter=$[$counter+1]
  done  
  
  if [ -z "${archive_list}" ]; then
    echo "Nothing to delete!"
  else
    echo "${archive_list}" | xargs rm -f
  fi
}  
export -f func_backup_del_old