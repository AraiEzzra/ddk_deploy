#!/usr/bin/env bash
cd data
cp ../tools/config/* DDKUI/
cp ../tools/config/* DDKCORE/
cp -f ../tools/genesisBlock.json DDKCORE/
cd ..