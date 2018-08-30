#!/usr/bin/env bash

basepath=$(cd `dirname $0`; pwd)

pushd $basepath

git config user.name "ytlm"
git config user.email "ytlm.lv@gmail.com"

git checkout master

    pushd $basepath/screenFetch
        git checkout master
        git pull --all > /dev/null 2>&1
    popd

git pull --all > /dev/null 2>&1

git status > /tmp/status.log 2>&1
git diff > /tmp/diff.log 2>&1

if [[ `wc -l /tmp/diff.log | awk '{print $1}'` -eq 0 ]]
then
    exit 0
fi

git add *

git commit -am "[auto backup] update config"

git push origin master

popd

#
# crontab
#
# 0 17 * * 5 sh $basepath/backup.sh
#
# every friday at five o'clock for backup
#
