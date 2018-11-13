## How to install
`sh install.sh`

## How to run
`sh start.sh`

## How to stop
`sh stop.sh`

## If u need clean you docker volume (aka postgres or redis) use
`sh volume-clean.sh`

## For provide your genesisBlock from tools to work dir use
`sh install_config_and_genesis.sh`

## For getting log from another log
`docker exec -it ddknode-core-1 tail -f logs/2018-11-21.log` or 
`sh log.sh 1 2018-11-21` or
`sh log.sh 2 2018-11-21`