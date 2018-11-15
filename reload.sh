#!/usr/bin/env bash
cd 10.6.0.1
docker-compose up -d --build
cd ../
cd 10.7.0.1
docker-compose up -d --build
cd ../
cd 10.5.0.1
docker-compose up -d --build