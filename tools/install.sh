#!/usr/bin/env bash
git clone https://github.com/AraiEzzra/DDKOIN.git
git clone -b sk-master https://github.com/AraiEzzra/DDKUI.git
cp config/* DDKUI/
cp config/* DDKOIN/
cp docker/* .
