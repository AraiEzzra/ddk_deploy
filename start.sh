#!/usr/bin/env bash

docker network create --subnet=10.0.0.0/9 --gateway=10.0.0.1 docker_ddk-testnet
cd 10.5.0.1
docker-compose build ddk
#docker-compose up -d
docker-compose up -d watch ddk ddkui db redis elasticsearch nginx
docker-compose logs -f --tail 100
