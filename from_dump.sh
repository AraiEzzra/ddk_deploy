#!/usr/bin/env bash
sh stop.sh
cd 10.5.0.1
docker-compose up -d db
sleep 5
psql postgres://lisk:password@10.5.0.4:5432/postgres -c 'DROP DATABASE ddk;'
psql postgres://lisk:password@10.5.0.4:5432/postgres -c 'CREATE DATABASE ddk;'
psql postgres://lisk:password@10.5.0.4:5432/ddk -f ../$1
cd ../