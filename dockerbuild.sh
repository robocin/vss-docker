xhost +local:docker

docker build . -f Dockerfile -t rl-unification --build-arg GITHUB_TOKEN=$1
