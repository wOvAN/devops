#!/bin/bash
ver=1.22.0

# get latest docker compose released tag
ver=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)

echo "latest found version: ${ver}"

sudo curl -L https://github.com/docker/compose/releases/download/${ver}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${ver}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

docker-compose --version