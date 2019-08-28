#!/bin/bash
set -e

# be sure to be in a place we have permissions to be
# (useful after sudo or find complains)
cd

LOCKFILE="/tmp/rpmimport.lock"
lockfile -r 40 ${LOCKFILE} || exit -1

for IFILE in $(find {{ document_root }} -name .import); do
  createrepo_c $(dirname ${IFILE}) --no-database
  rm -f ${IFILE}
done

trap 'rm -f ${LOCKFILE}' INT TERM EXIT
