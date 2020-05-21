#!/bin/bash

# Get installed version
InstalledVer=$(rke --version | grep -o 'on .*' | cut -f2- -d ' ' )
echo "Installed version: [${InstalledVer}]"

# Get latest released tag
LatestVer=$(curl -s https://api.github.com/repos/rancher/rke/releases/latest | grep 'tag_name' | cut -d\" -f4)
echo "Latest version:    [${LatestVer}]"

if [ "${InstalledVer}" != "${LatestVer}" ]; then
    os=$(uname -s); os=${os,,}
    os_arch=$(dpkg --print-architecture)
    curl -L https://github.com/rancher/rke/releases/download/${LatestVer}/rke_${os}-${os_arch} -o ./rke
    chmod +x ./rke
    sudo mv ./rke /usr/local/bin/rke
    echo "Installed version: [$(rke --version | grep -o 'on .*' | cut -f2- -d ' ' )]"
fi


