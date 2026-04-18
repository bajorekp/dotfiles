# docker_hints.sh
exit 0

# Kill all docker containers
docker rm $(docker ps -aq)

# Kill all exited containers
docker rm -f $(docker ps -aq -f "exited=1")

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.RunningFor}}\t{{.Status}}"
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Command}}\t{{.ID}}"

