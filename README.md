## How to install
`sh install.sh`

## How to run
`sh start.sh`

## How to stop
`sh stop.sh`

## If u need clean you docker volume (aka postgres or redis) use
`sh volume-clean.sh`

## For easy executing command on node
`docker exec -it ddknode-core-1 tail -f logs/2018-11-21.log` or 
`sh exec.sh 1 'tail -200 logs/2018-11-21.log'` or
`sh exec.sh 2 'head -200 logs/2018-11-21.log'`
