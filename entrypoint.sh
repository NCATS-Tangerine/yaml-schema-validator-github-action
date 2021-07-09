#!/bin/bash
set -eux

strict=''
schema=${INPUT_SCHEMA:-$1}
target=${INPUT_TARGET:-$2}

if [ "${INPUT_STRICT:-}" ]
then
  strict='--no-strict'
fi

#if [ ! -e ${schema} ]
#then
#  >&2 echo "Schema does not exist: $schema"
#  exit 1
#fi

if [ ! -e ${target} ]
then
  >&2 echo "Target does not exist: $target"
  exit 1
fi

yamale --schema=${schema} $target $strict
