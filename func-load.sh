#!/bin/bash
set -e
# Description:

LIB_DIR=$(readlink -ev ./lib)
#find "${LIB_DIR}" -maxdepth 1 -name '*.sh' -execdir . {} \;

#source <(cat ${LIB_DIR}/*.sh)
#for f in ${LIB_DIR}/*.sh; do source $f; done

source ${LIB_DIR}/func_apache_www_link.sh
source ${LIB_DIR}/func_backup.sh
source ${LIB_DIR}/func_bashrc_add_path.sh
source ${LIB_DIR}/func_bashrc_add.sh
source ${LIB_DIR}/func_dir_get_executing_path.sh
source ${LIB_DIR}/func_get_current_dir.sh
source ${LIB_DIR}/func_link.sh
