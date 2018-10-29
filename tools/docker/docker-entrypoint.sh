#!/bin/sh

echo $(node -v)
# needs defined db, elasticsearch and redis in docker-compose
# and wait-port npm package installed
wait-port $DB_HOST:5432 && \
wait-port $ELASTICSEARCH_HOST && \
wait-port $REDIS_HOST:6379 && \
if [[ -v DEBUG ]]; then
  npm run debug
else
  npm start
fi
