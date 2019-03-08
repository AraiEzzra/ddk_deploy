#!/usr/bin/env bash

cat /etc/hosts | grep ddk.dev
if [ $? -eq 1 ]; then
    echo '10.5.0.7        ddk.dev ddkbackend.dev ddkelasticsearch.dev' | sudo tee -a /etc/hosts > /dev/null 2>&1
fi
trap "sudo sed -i '/ddk.dev/d' /etc/hosts > /dev/null 2>&1; exit 1" 1 2 3 8 9 14 15

docker network create --subnet=10.0.0.0/9 --gateway=10.0.0.1 docker_ddk-testnet
cd 10.6.0.1
docker-compose build ddk
# docker-compose build ddkui # uncomment if work with UI
docker-compose up -d watch ddk db redis elasticsearch nginx
cd ../
cd 10.7.0.1
docker-compose up -d --build
cd ../
cd 10.5.0.1
docker-compose up --build
