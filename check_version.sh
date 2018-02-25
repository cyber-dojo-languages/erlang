#!/bin/bash
set -e

readonly EXPECTED=$(cat README.md | grep Version | cut -d'=' -f2 | cut -d']' -f1)
readonly ACTUAL=$(docker run --rm -it cyberdojofoundation/erlang sh -c 'erl -eval "erlang:display(erlang:system_info(otp_release)), halt()." -noshell')

if echo ${ACTUAL} | grep -q ${EXPECTED}; then
  echo "VERSION CONFIRMED as ${EXPECTED}"
else
  echo "VERSION EXPECTED: ${EXPECTED}"
  echo "VERSION   ACTUAL: ${ACTUAL}"
  exit 1
fi
