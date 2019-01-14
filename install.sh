#!/usr/bin/env bash
mkdir data
cd data
git clone -b master https://github.com/AraiEzzra/DDKCORE.git
git clone -b master https://github.com/AraiEzzra/DDKUI.git
cd ..
sh volume-clean.sh
