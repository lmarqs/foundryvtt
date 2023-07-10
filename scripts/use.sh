#!/bin/bash -xe
mkdir -p $HOME/foundryvtt/bin

rm -rf $HOME/foundryvtt/bin

mkdir -p $HOME/foundryvtt/bin

unzip -q $HOME/foundryvtt/releases/FoundryVTT-$1.zip -d $HOME/foundryvtt/bin
