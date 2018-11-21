#!/usr/bin/env bash
mkdir data
cd data
git clone -b sk-master https://github.com/AraiEzzra/DDKCORE.git
git clone -b sk-master https://github.com/AraiEzzra/DDKUI.git
cd ..
sh install_config_and_genesis.sh
sh volume-clean.sh
