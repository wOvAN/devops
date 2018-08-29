image="v2tec/watchtower"
name="watchtower"

docker stop ${name}
docker rm ${name}
docker pull ${image}

docker run -d \
    --name ${name} \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ${image} --cleanup --interval 21600