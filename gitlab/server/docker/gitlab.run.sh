git_data="/gitlab"
hostname=gitlab.example.com

sudo docker run --detach \
    --hostname $hostname \
    --publish 443:443 \
    --publish 80:80 \
    --publish 2222:22 \
    --name gitlab \
    --restart always \
    --volume $git_data/gitlab/config:/etc/gitlab \
    --volume $git_data/gitlab/logs:/var/log/gitlab \
    --volume $git_data/gitlab/data:/var/opt/gitlab \
    --ulimit nofile=98304:98304 \
    gitlab/gitlab-ce:latest