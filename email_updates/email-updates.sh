#!/bin/sh

updates=$(checkupdates)
numupdates=$(echo "$updates"|wc -l)
host=$(hostname)

if [[ $numupdates -gt 0 ]]; then
    sendmail -t <<.
To: root
From: root
Subject: checkupdates: $numupdates available updates on $host

$updates

.
fi

exit $?
