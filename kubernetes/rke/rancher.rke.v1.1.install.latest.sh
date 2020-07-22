#!/bin/bash

major_ver="v1.1"

## usage: get_latest_release_of_version "helm/helm" "v3"
get_latest_release_of_version() {
    releases=$(curl -s https://api.github.com/repos/$1/releases | grep 'tag_name' | cut -d\" -f4)
    for i in ${releases[@]}; 
    do
    if [[ "$i" =~ ^${2}\.[0-9]+$ ]]; then
        echo "$i"
        break
    fi
    done
}

# Get installed version
InstalledVer=$(rke --version | grep -o 'on .*' | cut -f2- -d ' ' )
echo "Installed version: [${InstalledVer}]"

# Get latest released tag
LatestVer=$(get_latest_release_of_version "rancher/rke" "${major_ver}")
echo "Latest version:    [${LatestVer}]"

if [ "${InstalledVer}" != "${LatestVer}" ]; then
    os=$(uname -s); os=${os,,}
    os_arch=$(dpkg --print-architecture)
    curl -L https://github.com/rancher/rke/releases/download/${LatestVer}/rke_${os}-${os_arch} -o ./rke
    chmod +x ./rke
    sudo mv ./rke /usr/local/bin/rke
    echo "Installed version: [$(rke --version | grep -o 'on .*' | cut -f2- -d ' ' )]"
fi


