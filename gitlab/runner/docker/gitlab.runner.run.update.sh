# /etc/gitlab-runner/certs/ca.crt

git_data="/gitlab"
image="gitlab/gitlab-runner:latest"
name="gitlab-runner"

docker stop ${name}
docker rm ${name}
docker pull ${image}

docker run -d \
  --name ${name} \
  --restart always \
  --privileged \
  -v ${git_data}/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ${image}