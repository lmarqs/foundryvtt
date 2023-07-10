#!/bin/bash -xe
VERSION="$1"

TENANT="$2"

if [ -z "${TENANT}" ]; then
  TENANT="default"
fi

rm -rf $HOME/foundryvtt/data/$TENANT

aws s3 cp s3://$GAME_S3_BUCKET/data/$TENANT/bkp-$TENANT-$VERSION.tar.gz $HOME/foundryvtt/tmp/bkp-$TENANT-$VERSION.tar.gz

tar -xzf $HOME/foundryvtt/tmp/bkp-$TENANT-$VERSION.tar.gz -C $HOME/foundryvtt/data

rm $HOME/foundryvtt/tmp/bkp-$TENANT-$VERSION.tar.gz
