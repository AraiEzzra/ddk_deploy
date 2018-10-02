# How to run
`sh ddk-generate.sh ip_to_secret_map.csv`

### File ip_to_secret_map.csv
It is a map in csv format `ip,secret`

# How it work
Loop on ip create folder with name $ip. And after emulate work CI on this ip(server)
```bash
#!/usr/bin/env bash
while IFS=, read -r _ip _secret; do
    echo $_ip;
    echo $_secret;
    PEERS=''
    while IFS=, read -r _ip2 _secret2; do
        if [ "$_ip2" != "$_ip" ]; then
            if [ "$PEERS" != "" ]; then
                PEERS="$PEERS,$_ip2:7007"
            else
                PEERS="$_ip2:7007"
            fi;
        fi;
    done < "$1";
    mkdir -p "$_ip";

    # CONNECT
    cd $_ip

    # FTP SIMULATION
    cp -r ../tools/* .

    # CREATE ENV
    rm custom.env
    echo "DEFAULT_FORGE_SECRET=$_secret" >> custom.env;
    echo "DEFAULT_PEERS=$PEERS" >> custom.env;
    echo "DEFAULT_PEERS_BLACKLIST=127.0.0.1,10.5.0.1,$_ip" >> custom.env;

    # INSTALL
    sh install.sh
    # docker-compose build

    # CLEANING
    rm -rf docker
    rm -rf config
    rm -rf install.sh

    # RUN
    # docker-compose up -d

    # DISCONNECT
    cd ..
done < "$1"


```