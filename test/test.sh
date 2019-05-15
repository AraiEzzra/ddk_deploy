#!/usr/bin/env bash

cd test
docker-compose down --volumes
cd ../10.6.0.1
docker-compose build ddk
cd ../test/integration
rm -rf log.log
docker-compose up --build -d ddk api db
docker-compose logs ddk api >&1 >> log.log
docker-compose up test
docker-compose down --volumes
