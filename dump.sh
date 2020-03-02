#!/usr/bin/env bash

psql -h 10.5.0.4 -U lisk -W -d ddk -f dump.sql