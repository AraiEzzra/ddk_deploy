#!/usr/bin/env bash
mkdir data
cd data
git clone -b split-api-core https://github.com/AraiEzzra/DDKCORE.git
cd ..
sh volume-clean.sh
