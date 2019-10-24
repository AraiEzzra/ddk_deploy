#!/usr/bin/env bash
mkdir data
cd data
git clone -b master https://github.com/AraiEzzra/DDKCORE.git
git clone -b master https://github.com/AraiEzzra/DDK.REGISTRY.git
cd ..
sh volume-clean.sh
cd 10.6.0.1
echo "Stop docker container after success build";
docker-compose up watch
