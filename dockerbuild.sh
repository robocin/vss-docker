xhost +local:docker

docker build . -f Dockerfile -t rl-unification
