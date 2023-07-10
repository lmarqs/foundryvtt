#!/bin/bash -xe
rm -rf $HOME/foundryvtt/bin/*

unzip -q $HOME/foundryvtt/releases/FoundryVTT-$1.zip -d $HOME/foundryvtt/bin
