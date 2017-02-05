#!/bin/sh
set -e
if [ ! -d /root/.ssh ]
then
    mkdir /root/.ssh
    chmod 700 /root/.ssh
fi

if [ -d /root/ssh-outside ]
then
    cp -rf /root/ssh-outside/* /root/.ssh
    chmod 600 /root/.ssh/*
fi

exec "$@"
