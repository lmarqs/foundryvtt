#!/bin/bash -xe
TENANT="${1:=default}"

mkdir -p $HOME/foundryvtt/data/$TENANT

node $HOME/foundryvtt/bin/resources/app/main.js --dataPath=$HOME/foundryvtt/data/$TENANT --port=8080
