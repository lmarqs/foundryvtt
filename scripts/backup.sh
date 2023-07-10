#!/bin/bash -xe
TENANT="$1"

if [ -z "${TENANT}" ]; then
  TENANT="default"
fi

VERSION=$(date +'%Y%m%d%H%M%S')

mkdir -p $HOME/foundryvtt/tmp

tar -czf $HOME/foundryvtt/tmp/bkp-$TENANT-$VERSION.tar.gz -C $HOME/foundryvtt/data $TENANT

aws s3 cp $HOME/foundryvtt/tmp/bkp-$TENANT-$VERSION.tar.gz s3://$GAME_S3_BUCKET/data/$TENANT/bkp-$TENANT-$VERSION.tar.gz

rm $HOME/foundryvtt/tmp/bkp-$TENANT-$VERSION.tar.gz
