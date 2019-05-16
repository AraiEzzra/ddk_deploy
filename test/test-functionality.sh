#!/usr/bin/env bash

cd ../10.6.0.1
docker-compose build ddk
cd ../test/functionality
docker-compose up --build -d db
docker-compose up test
docker-compose down --volumes
