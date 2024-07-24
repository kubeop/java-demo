#!/bin/bash

msg(){
    echo "`date +'%F %T'` $1"
}

if [ -z "$@" ]
then
    msg "Start ${APP_NAME} of ${APP_ENV}."

    test -z "$RUN_COMMAND" && RUN_COMMAND="/opt/${APP_NAME}"
    exec ${RUN_COMMAND}

    msg "ERROR: ${APP_NAME} exited with code $?"   && exit 1
else
    "$@"
fi
