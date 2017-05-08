#!/bin/bash
set -e
# Description: Update scripts to Cust-Live-Deb

src_dir=$(readlink -ev lib)
dest_dir=$(readlink -ev "/media/master/github/firstboot")
rsync -rv --exclude=.git "${src_dir}" "${dest_dir}"