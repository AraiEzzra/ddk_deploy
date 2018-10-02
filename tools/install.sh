#!/usr/bin/env bash
git clone git@github.com:AraiEzzra/DDKOIN.git
git clone -b sk-master git@github.com:AraiEzzra/DDKUI.git
cp config/* DDKUI/
cp config/* DDKOIN/
cp docker/* .
