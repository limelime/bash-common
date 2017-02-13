# Description: Return identifier.
#   -Depends on: XXXX

function func_id()
{ 
SECONDS_SINCE_MIDNIGHT=$(($(date '+(%H*60+%M)*60+%S')))
SECONDS_SINCE_MIDNIGHT=$(printf "%05d" ${SECONDS_SINCE_MIDNIGHT})
ID_SHORT=$(date +"%Y%m%d.")${SECONDS_SINCE_MIDNIGHT}
ID_MEDIUM=$(date +"%Y-%m-%d.")${SECONDS_SINCE_MIDNIGHT}
ID_LONG=$(date +"%Y-%m-%d.%0k.%M.%S")
echo S:${ID_SHORT} 
echo M:${ID_MEDIUM}    
echo L:${ID_LONG}     
date +"O:%Y%m%d%0k%M%S"

echo $(($(date '+(%H*60+%M)*60+%S')))
  
  local TYPE=$1
  TYPE=$( echo "${TYPE}" | tr '[:upper:]' '[:lower:]' )
  case "${TYPE}" in
      sec-short)
      
      ;;
  esac
}  
export -f func_id

# Test: XXXX