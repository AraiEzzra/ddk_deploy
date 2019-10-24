## How to install
`sh install.sh`
After watching successful finished stop container "Ctrl + C"

## How to run
`sh start.sh`

## How to stop
`sh stop.sh`

## How to run test
before run test need run `sh start.sh` one time for create `dist` folder \
`sh test.sh`

## If u need clean you docker volume (postgres) use
`sh volume-clean.sh`

## For easy executing command on node
`docker exec -it ddknode-core-1 tail -f logs/2018-11-21.log` or \
`sh exec.sh 1 'tail -200 logs/2018-11-21.log'` or \
`sh exec.sh 2 'head -200 logs/2018-11-21.log'` 

# How to use Node JS remote debugger

## Install Node.js V8 --inspector Manager (NiM) chrome extension

https://chrome.google.com/webstore/detail/nodejs-v8-inspector-manag/gnhhdgbaldcilmgcpfddgdbkhjohddkj

## Connect to remote debugger

1. Set hostname and port or use the default `localhost` and `9229`.
2. Click Open DevTools or change setting to Auto
