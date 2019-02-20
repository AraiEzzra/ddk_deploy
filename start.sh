#!/usr/bin/env bash

docker network create --subnet=10.0.0.0/9 --gateway=10.0.0.1 docker_ddk-testnet
cd 10.6.0.1
docker-compose build ddk
docker-compose up -d
cd ../
cd 10.7.0.1
docker-compose up -d --build
cd ../
cd 10.5.0.1
docker-compose up --build
