#!/bin/sh
# jenkins build helper script for asn1c.  This is how we build on jenkins.osmocom.org

set -ex

osmo-clean-workspace.sh

set +x
echo
echo
echo
echo " =============================== asn1c ==============================="
echo
set -x

./configure # CFLAGS="-Werror" CPPFLAGS="-Werror" #-Werror currently broken
$MAKE $PARALLEL_MAKE
$MAKE check
#$MAKE distcheck # distcheck currently broken

osmo-clean-workspace.sh
