#!/usr/bin/env bash

cd test-prod
docker-compose build ddk
docker-compose up -d ddk api db
sleep 5
docker-compose up test
rm -rf log.log
docker-compose logs ddk api >&1 >> log.log
docker-compose down --volumes
