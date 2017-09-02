#!/bin/sh

updates=$(checkupdates)
numupdates=$(echo "$updates"|wc -l)
host=$(hostname)

if [[ $updates ]]; then
    sendmail -t <<.
To: root
From: root
Subject: checkupdates: $numupdates available updates on $host

$updates

.
fi

exit $?
