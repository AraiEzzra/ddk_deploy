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

# How to run with ssl + nginx

## Add certificates

1. Create `certs` folder near `docker-compose.yml` file.
2. Copy your certificates to `certs` folder.
3. Generate dhparam key: `openssl dhparam -out dhparam.pem 4096`.
4. Put generated key `dhparam.pem` to `certs` folder.

## Change ddk.conf settings

Replace `yourDomain.com` value with your domain name.

**UI domain**

```
server {
  ...
  server_name yourUIDomain.com;
  ...
}
```

**Backend domain**

```
server {
  ...
  server_name yourBackendDomain.com;
  ...
}
```

**Elasticsearch domain**

```
server {
  ...
  server_name yourElasticsearchDomain.com;
  ...
}
```

## Replace ddkui with nginx container

Open `docker-compose.yml` file and replace `ddkui` container settings with:

```
  nginx:
    build:
      context: ../data/DDKUI
      dockerfile: nginx.Dockerfile
    container_name: ddknode-nginx
    networks:
      ddk-testnet:
        ipv4_address: 10.5.0.7
    volumes:
      - ./certs/:/etc/nginx/live/certs/
      - ./ddk.conf:/etc/nginx/nginx.conf
    ports:
      - "80:80"
      - "443:443"
    env_file:
      - ddkcoin.env
```

## Change DDKUI config.json

Open `config.json` near `docker-compose.yml` file and change next parameters `serverProtocol`, `serverHost`, `elasticsearchHost`, `domainName`. Example below:

Replace `yourDomain.com` value with your domain name.

```
"serverProtocol": "https",
"serverHost": "backend.yourDomain.com",
"elasticsearchHost": "elasticsearch.yourDomain.com",
"domainName": "yourDomain.com",
```

And copy this file to DDKUI folder: `cp config.json ../data/DDKUI/config.json`

## Stop DDK UI container and start nginx container

Stop ddk ui container: `docker stop ContainerName`

Start nginx container: `docker-compose up -d --build nginx`
