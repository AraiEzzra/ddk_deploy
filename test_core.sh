# pass git tag or revision you want to build as first argument
CURRENT_TAG=`cd data/DDKOIN && git tag --points-at HEAD | head -1` && \
TAG_NAME=${1:-CURRENT_TAG} && \
REVISION_ID=$1 && \
cd data/DDKOIN && \
[ -z "$1" ] || { git fetch --all --tags --prune && git checkout "${REVISION_ID}"; } && \
cd ../../test && \
docker-compose build --no-cache && \
docker-compose up -d db redis elasticsearch && \
docker-compose up ddk && \
docker-compose down --volumes