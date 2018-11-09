. ./build_ui_tag.sh $1 && \
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USERNAME" --password-stdin && \
docker tag "$DOCKER_TAG" "ddkoin/ui:latest" && \
docker push "$DOCKER_TAG" && \
docker push "ddkoin/ui:latest"