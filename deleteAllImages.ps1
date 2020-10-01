docker image rm $(docker image ls "simple*" -qa)
docker image prune -f