# Description: Return identifier.
#   -Depends on: XXXX

function func_id()
{ 

  local TYPE=$1
  TYPE=$( echo "${TYPE}" | tr '[:upper:]' '[:lower:]' )

  local ID=""
  local time_str=$(date '+%H:%M:%S')
  local hours=$(echo $time_str | cut -d':' -f1 | sed 's/^0//')
  local minutes=$(echo $time_str | cut -d':' -f2 | sed 's/^0//')
  local seconds=$(echo $time_str | cut -d':' -f3 | sed 's/^0//')
  local SECONDS_SINCE_MIDNIGHT=""
  SECONDS_SINCE_MIDNIGHT=$(( ($hours*60 + $minutes)*60 + $seconds ))
  SECONDS_SINCE_MIDNIGHT=$(printf "%05d" ${SECONDS_SINCE_MIDNIGHT})  
    
  case "${TYPE}" in
      sec-short)
        ID=$(date +"%Y%m%d.")${SECONDS_SINCE_MIDNIGHT}
        ;;
      sec-medium)
        ID=$(date +"%Y-%m-%d.")${SECONDS_SINCE_MIDNIGHT}
        ;;
      sec-long)
        ID=$(date +"%Y-%m-%d.%0k.%M.%S")
        ;;
      sec-full)
        ID=$(date +"%Y%m%d%0k%M%S")
        ;;
      *)
        echo "Error: unknown ${TYPE} type. Aborted!"
        echo " Run func_id_options for all available types."
        return 1;
  esac
  
  echo "${ID}" 
}  
export -f func_id


function func_id_options()
{ 
  local types=(sec-short sec-medium sec-long)
  types+=(sec-full)
  
  printf "%-10s  %-6s %-25s\n" 'Type' 'Length' 'Output'
  echo "============================="
  for type in "${types[@]}"
  do
    ID_RESULT=$( func_id "${type}")
    printf "%-10s  %-6s %-25s\n" "${type}" "${#ID_RESULT}" "${ID_RESULT}" 
  done  
}  
export -f func_id_options

# Test: XXXX