#!/usr/bin/env bash


cd ./test
docker-compose up --build -d
cd ../
docker exec -it ddknode-tests /bin/bash
