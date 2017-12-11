#!/usr/bin/env bash

basepath=$(cd `dirname $0`; pwd)

pushd $basepath

git config user.name "ytlm"
git config user.email "ytlm1314@gmail.com"

git status > /tmp/status.log
git diff > /tmp/diff.log

if [[ `wc -l /tmp/diff.log | awk '{print $1}'` -eq 0 ]]
then
    exit 0
fi

git add *

git commit -m "[auto backup] update config"

git push origin master

popd

#
# crontab
#
# 0 17 * * 5 sh $basepath/backup.sh
#
# every friday at five o'clock for backup
#
