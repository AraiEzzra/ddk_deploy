CORE_TAG="ddk/core:$(cat data/DDKOIN/package.json | jq -r .version)-${NODE_ENV:-development}"
UI_TAG="ddk/ui:$(cat data/DDKUI/package.json | jq -r .version)-${NODE_ENV:-development}"
REGISTRY_URL="${REGISTRY_URL:-docker.registry.zeppel.in.ua}"
echo "DDK core version: $CORE_TAG"
echo "DDK ui version: $UI_TAG"
docker login "$REGISTRY_URL"
docker build --no-cache -t "$CORE_TAG" -f data/Dockerfile.CORE data
docker build --no-cache -t "$UI_TAG" -f data/Dockerfile.UI data
docker tag "$CORE_TAG" "$REGISTRY_URL/$CORE_TAG"
docker tag "$CORE_TAG" "$REGISTRY_URL/ddk/core:latest"
docker tag "$UI_TAG" "$REGISTRY_URL/$UI_TAG"
docker tag "$UI_TAG" "$REGISTRY_URL/ddk/ui:latest"
docker push "$REGISTRY_URL/$CORE_TAG"
docker push "$REGISTRY_URL/ddk/core:latest"
docker push "$REGISTRY_URL/$UI_TAG"
docker push "$REGISTRY_URL/ddk/ui:latest"