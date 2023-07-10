#!/bin/bash -xe
mkdir -p $HOME/foundryvtt/bin
mkdir -p $HOME/foundryvtt/data
mkdir -p $HOME/foundryvtt/releases

aws s3 sync s3://$GAME_S3_BUCKET/releases $HOME/foundryvtt/releases

sudo cp $HOME/foundryvtt/scripts/nginx.conf /etc/nginx/sites-available/default

sudo service nginx restart

npm install pm2@latest -g
