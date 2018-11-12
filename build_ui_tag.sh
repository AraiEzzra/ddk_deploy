# pass git tag or revision you want to build as first argument
CURRENT_TAG=`cd data/DDKUI && git tag --points-at HEAD | head -1` && \
export TAG_NAME=${1:-$CURRENT_TAG} && \
export REVISION_ID=$1 && \
export DOCKER_TAG="ddkoin/ui:${TAG_NAME:-latest}" && \
cd data/DDKUI && \
[ -z "$1" ] || { git fetch --all --tags --prune && git checkout "${REVISION_ID}"; } && \
cd ../.. && \
echo "DDK ui version: $DOCKER_TAG" && \
docker build --no-cache -t "$DOCKER_TAG" -f data/Dockerfile.UI data