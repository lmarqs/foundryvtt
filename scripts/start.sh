#!/bin/bash -xe
TENANT="$1"

if [ -n "$1" ]
then
  TENANT="default"
fi

mkdir -p $HOME/foundryvtt/data/$TENANT

node $HOME/foundryvtt/bin/resources/app/main.js --dataPath=$HOME/foundryvtt/data/$TENANT --port=8080
