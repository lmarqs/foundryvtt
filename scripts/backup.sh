#!/bin/bash -xe
TENANT="$1"

if [ -n "$1" ]
then
  TENANT="default"
fi

VERSION=$(date +'%Y%m%d%H%M%S')

tar -czvf $HOME/foundryvtt/tmp/$TENANT-$VERSION.tar.gz $HOME/foundryvtt/data/$TENANT

aws s3 cp $HOME/foundryvtt/tmp/$TENANT-$VERSION.tar.gz s3://$GAME_S3_BUCKET/data/$TENANT/$TENANT-$VERSION.tar.gz

rm $HOME/foundryvtt/tmp/$TENANT-$VERSION.tar.gz
