./build_core_tag.sh $1 && \
docker run --entrypoint '' "ddkoin/core:latest" npm test