#!/bin/bash -xe
mkdir -p $HOME/foundryvtt/bin
mkdir -p $HOME/foundryvtt/data
mkdir -p $HOME/foundryvtt/releases

aws s3 sync s3://$GAME_S3_BUCKET/releases $HOME/foundryvtt/releases

sudo cat << EOF > /etc/nginx/sites-available/foundry
  server {
    location / {
      proxy_pass http://localhost:8080;
    }
  }
EOF

ln -s /etc/nginx/sites-available/foundryvtt /etc/nginx/sites-enabled/foundryvtt

sudo service nginx restart
