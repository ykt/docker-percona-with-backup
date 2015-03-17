#!/bin/sh

if [ -z "$TARGET" ]; then
  echo "TARGET env not set"
  exit 1
fi

if [ -z "$TARGET_USER" ]; then
  echo "TARGET_USER env not set"
  exit 1
fi

if [ -z "$TARGET_PASS" ]; then
  echo "TARGET_PASS env not set"
  exit 1
fi


if [ -z "$SOURCE" ]; then
  echo "SOURCE env not set"
  exit 1
fi

echo SHELL=/bin/bash > /etc/crontab
echo PATH=$PATH >> /etc/crontab
echo TARGET=$TARGET >> /etc/crontab
echo TARGET_USER=$TARGET_USER >> /etc/crontab
echo TARGET_PASS=$TARGET_PASS >> /etc/crontab
echo SOURCE=$SOURCE >> /etc/crontab
cat /etc/crontab.schedule >> /etc/crontab
echo  >> /etc/crontab
