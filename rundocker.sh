WORK_DIR=`pwd`
CONTAINER_WORK_DIR="/home/vss-unification"

CONTAINER_NAME="rl-unification"
DOCKER_IMAGE="rl-unification"

# Executando o docker
docker run  -it \
            --rm \
            --user=$(id -u) \
            --name=$CONTAINER_NAME \
            --volume="/dev:/dev" \
            --privileged \
            --net=host \
            --volume="${WORK_DIR}/config:${CONTAINER_WORK_DIR}/config" \
            --volume="${WORK_DIR}/models:${CONTAINER_WORK_DIR}/models" \
            -v $HOME/.Xauthority:/root/.Xauthority \
            $DOCKER_IMAGE
