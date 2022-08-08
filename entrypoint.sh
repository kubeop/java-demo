#!/bin/bash

msg(){
    echo "`date +'%F %T'` $1"
}

if [ -z "$@" ]
then
    msg "Start ${app_name} of ${app_env}."
    cd /opt
    exec java ${java_opts} \
              -Denv=${app_env} \
              -Dfile.encoding=utf-8 \
              -XX:+UseContainerSupport \
              -XX:InitialRAMPercentage=50.0 \
              -XX:MaxRAMPercentage=80.0 \
              -XX:+HeapDumpOnOutOfMemoryError \
              -XX:HeapDumpPath=/tmp \
              -jar -Duser.timezone=GMT+08 \
              /opt/${app_name}.jar

    msg "ERROR: ${app_name} exited with code $?"   && exit 1
else
    "$@"
fi
