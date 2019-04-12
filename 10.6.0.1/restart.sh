#!/usr/bin/env bash
cd ../data/DDKCORE
sudo rm -rf dist/ && sudo npm run build:migration
cd ../..
sh stop.sh
sh volume-clean.sh
cd 10.6.0.1/
docker-compose up

