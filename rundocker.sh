WORK_DIR=`pwd`
CONTAINER_WORK_DIR="/home"

CONTAINER_NAME="rl-unification"
DOCKER_IMAGE="rl-unification"

# Executando o docker
docker run  -it \
            --rm \
            --name=$CONTAINER_NAME \
            --volume="/dev:/dev" \
            --privileged \
            --net=host \
            --volume="${WORK_DIR}/get.py:${CONTAINER_WORK_DIR}/get.py" \
            -v $HOME/.Xauthority:/root/.Xauthority \
            $DOCKER_IMAGE
