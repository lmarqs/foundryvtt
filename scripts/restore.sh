#!/bin/bash -xe
TENANT="$1"

if [ -n "$1" ]
then
  TENANT="default"
fi

rm -rf $HOME/foundryvtt/data/$TENANT

aws s3 cp s3://$GAME_S3_BUCKET/data/$TENANT/$TENANT-$2.tar.gz $HOME/foundryvtt/tmp/$TENANT-$2.tar.gz

tar -xzf $HOME/foundryvtt/tmp/$TENANT-$VERSION.tar.gz $HOME/foundryvtt/data/$TENANT
