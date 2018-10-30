#!/bin/sh

echo $(node -v)
# needs defined db, elasticsearch and redis in docker-compose
# and wait-port npm package installed
wait-port $DB_HOST:$DB_PORT && \
wait-port $ELASTICSEARCH_HOST && \
wait-port $REDIS_HOST:$REDIS_PORT && \
if [[ -v DEBUG ]]; then
  npm run debug
else
  npm start
fi
