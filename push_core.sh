./build_core_tag.sh $1 && \
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin && \
docker tag "$DOCKER_TAG" "ddkoin/core:latest" && \
docker push "$DOCKER_TAG" && \
docker push "ddkoin/core:latest"