#!/bin/bash

# Get installed version
dcInstalledVer=$(docker-compose version --short)
echo "Installed version: [$dcInstalledVer]"

# Get latest docker compose released tag
dcLatestVer=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
echo "Latest version:    [${dcLatestVer}]"

if [ "$dcInstalledVer" == "" ]; then
    sudo python -m pip install --upgrade pip
    sudo apt-get install -y gcc libffi-dev libssl-dev
    sudo apt-get install -y python python-pip python-dev
    sudo apt-get remove python-configparser
    sudo pip install -U setuptools
    sudo pip install -U docker-compose
    echo "Installed version: [$(docker-compose --version)]"
elif [ "$dcInstalledVer" != "$dcLatestVer" ]; then
    sudo python -m pip install --upgrade pip
    sudo pip install -U docker-compose
    echo "Installed version: [$(docker-compose --version)]"
fi


