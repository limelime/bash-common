# Description: Return identifier.
#   -Depends on: XXXX

function func_id()
{ 

#date +"O:%Y%m%d%0k%M%S"

#echo $(($(date '+(%H*60+%M)*60+%S')))
  
  local TYPE=$1
  TYPE=$( echo "${TYPE}" | tr '[:upper:]' '[:lower:]' )

  local ID=""
  local SECONDS_SINCE_MIDNIGHT=""
  SECONDS_SINCE_MIDNIGHT=$(($(date '+(%H*60+%M)*60+%S')))
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
  esac
  
  echo "${ID}" 
}  
export -f func_id


function func_id_options()
{ 
  local types=(sec-short sec-medium)
  types+=(sec-long)
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