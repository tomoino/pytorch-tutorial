if [ -z "$USER_ID" ]; then
    export USER_ID=$(id -u)
fi
if [ -z "$GROUP_ID" ]; then
    export GROUP_ID=$(id -g)
fi
docker-compose -f docker/docker-compose.yaml build
docker-compose -f docker/docker-compose.yaml up -d