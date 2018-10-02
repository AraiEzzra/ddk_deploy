#!/usr/bin/env bash
git clone -b sk-stakereward git@git.skc.today:Dev/DDKCoin.git
git clone git@git.skc.today:Dev/DDK-UI.git
cp -R config/* DDK-UI/config/
cp docker/* .
