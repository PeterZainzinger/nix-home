#!/usr/bin/env bash
release=/home/yrashk/Projects/sit-fyi/sit/target/release/sit-web
debug=/home/yrashk/Projects/sit-fyi/sit/target/debug/sit-web
release_ts=$(echo -n $(stat -c "%Y" $release 2>/dev/null || echo 0))
debug_ts=$(echo -n $(stat -c "%Y" $debug 2>/dev/null || echo 0))

argv=""

for arg in "$@"
do
  argv="${argv} \"${arg}\""
done

if [ $release_ts -ge $debug_ts ]; then
        exec $(/usr/bin/env which bash) -c "$release $argv"
else
        exec $(/usr/bin/env which bash) -c "$debug $argv"
fi
