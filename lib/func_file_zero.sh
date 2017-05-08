# Description: XXXX
#   -Depends on: XXXX

function func_file_zero()
{ 
  filename=$1
  if [ -s "${filename}" ] && [ ! -L "${filename}" ]; then
    rm -f "${filename}"
    touch "${filename}"
    echo "Warning: Zero out file: ${filename}."
  else
    echo "Error: ${filename} is not a valid file: Not a symbolic link & size > 0."
    return 1;
  fi  
}  
export -f func_file_zero
