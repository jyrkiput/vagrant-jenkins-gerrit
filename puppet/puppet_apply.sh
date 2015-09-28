#!/bin/bash

basedir="$( dirname $( readlink -f "${0}" ) )"

exec puppet apply \
    --hiera_config ${basedir}/manifests/hiera.yaml \
    --modulepath ${basedir}/modules \
    ${basedir}/manifests/default.pp
