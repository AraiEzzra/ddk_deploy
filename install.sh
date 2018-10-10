#!/usr/bin/env bash
mkdir data
cd data
git clone https://github.com/AraiEzzra/DDKOIN.git
git clone -b sk-master https://github.com/AraiEzzra/DDKUI.git
cp ../tools/config/* DDKUI/
cp ../tools/config/* DDKOIN/
cp ../tools/docker/docker-entrypoint.sh .
cd ..