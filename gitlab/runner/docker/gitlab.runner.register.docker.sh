name="gitlab-runner"
reg-token="<get it from gitlab>"

# manual configuration
# docker exec -it ${name} gitlab-runner register

# auto configuration
docker exec -it ${name} gitlab-runner register -n \
    --url https://gitlab.example.com/ \
    --registration-token ${reg-token} \
    --executor docker \
    --docker-image "docker:latest" \
    --docker-privileged \
    --tag-list "dev","docker" \
    --run-untagged \
    --name "docker-runner-01" \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --builds-dir "/builds" \
    --cache-dir "/cache"




