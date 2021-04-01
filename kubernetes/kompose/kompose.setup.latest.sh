#!/bin/bash

# Get installed version
InstalledVer="v$(kompose version | grep -o '.* ' | xargs)"
echo "Installed version: [$InstalledVer]"

# Get latest docker compose released tag
LatestVer=$(curl -s https://api.github.com/repos/kubernetes/kompose/releases/latest | grep 'tag_name' | cut -d\" -f4)
echo "Latest version:    [${LatestVer}]"

#
if [ "$InstalledVer" != "$LatestVer" ]; then
    echo "Installing latest version: [${LatestVer}]..."
    os=$(uname -s); os=${os,,}
    os_arch=$(dpkg --print-architecture)
    curl -L https://github.com/kubernetes/kompose/releases/download/${LatestVer}/kompose-${os}-${os_arch} -o /usr/local/bin/kompose    
    chmod +x /usr/local/bin/kompose    
    echo "Installed version: [$(kompose version)]"
fi

