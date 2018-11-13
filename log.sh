#!/usr/bin/env bash
docker exec -it ddknode-core-$1 tail -f logs/$2.log