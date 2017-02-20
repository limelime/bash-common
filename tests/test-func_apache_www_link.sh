#!/bin/bash
set -e
# Description: Test func_apache_www_link.

. assert.sh

# Test empty parameter.
  assert_raises "func_apache_www_link"            1
  assert_raises "func_apache_www_link 1parameter" 1
  assert_raises "func_apache_www_link ${HOME} ${HOME}/somepath" 1


# Test link www
  TARGET_NAME=test-data/www/local_drupal
  mkdir -p ${TARGET_NAME}
  LINK_NAME=drupal986523
  assert_raises "func_apache_www_link ${TARGET_NAME} ${LINK_NAME}"
  rm -f /var/www/html/${LINK_NAME}
  
assert_end func_apache_www_link