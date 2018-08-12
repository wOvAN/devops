git_data="/gitlab"
hostname=gitlab.example.com

image="gitlab/gitlab-ce:latest"
name="gitlab"

docker stop ${name}
docker rm ${name}
docker pull ${image}

sudo docker run --detach \
    --hostname ${hostname} \
    --publish 443:443 \
    --publish 80:80 \
    --publish 2222:22 \
    --name ${name} \
    --restart always \
    --volume ${git_data}/gitlab/config:/etc/gitlab \
    --volume ${git_data}/gitlab/logs:/var/log/gitlab \
    --volume ${git_data}/gitlab/data:/var/opt/gitlab \
    --ulimit nofile=98304:98304 \
    ${image}