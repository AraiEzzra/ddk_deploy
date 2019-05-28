#!/usr/bin/env bash

docker network create --subnet=10.0.0.0/9 --gateway=10.0.0.1 docker_ddk-testnet
cd ../../
cd 10.6.0.1
docker-compose build ddk
cd ../test/lab

cd 10.10.0.1
docker-compose up -d --build
cd ../
cd 10.11.0.1
docker-compose up -d --build
cd ../
cd test-runner
docker-compose up -d db
docker-compose up ddk

cd ../
sh test-clean.sh
