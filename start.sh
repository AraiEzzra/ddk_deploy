#!/usr/bin/env bash
docker-compose -f ./tools/docker/network-compose.yml up -d
cd 10.6.0.1
docker-compose up -d --build
cd ../
cd 10.7.0.1
docker-compose up -d --build
cd ../
cd 10.5.0.1
docker-compose up -d --build
docker-compose logs --follow