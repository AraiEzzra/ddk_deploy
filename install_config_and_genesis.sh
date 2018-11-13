#!/usr/bin/env bash
cd data
cp ../tools/config/* DDKUI/
cp ../tools/config/* DDKCORE/
cp -f ../tools/genesisBlock.json DDKCORE/
cp ../tools/docker/docker-entrypoint.sh .
cp ../tools/docker/Dockerfile.CORE .
cp ../tools/docker/Dockerfile.PGDB .
cp ../tools/docker/Dockerfile.UI .
cp ../tools/docker/.dockerignore .
cd ..