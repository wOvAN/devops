#!/bin/bash

# Get installed version
dcInstalledVer=$(docker-compose version --short)
echo "Installed version: [$dcInstalledVer]"

# Get latest docker compose released tag
dcLatestVer=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
echo "Latest version: [${dcLatestVer}]"

#
if [ "$dcInstalledVer" != "$dcLatestVer" ]; then
    echo "Installing latest version: [${dcLatestVer}]..."
    sudo curl -L https://github.com/docker/compose/releases/download/${dcLatestVer}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${dcLatestVer}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
else
    echo "Version [$dcLatestVer] already installed"
fi

echo "Current installed version: [$(docker-compose --version)]"