#!/bin/bash

major_ver="v2"

## usage: get_latest_release_of_version "helm/helm" "v3"
get_latest_release_of_version() {
    releases=$(curl -s https://api.github.com/repos/$1/releases | grep 'tag_name' | cut -d\" -f4)
    for i in ${releases[@]}; 
    do
	if [[ "$i" =~ ^${2}\.[0-9]+\.[0-9]+$ ]]; then
	    echo "$i"
	    break
	fi
    done
}

# Get installed version
InstalledVer=$(helm version --template="{{.Version}}")
echo "Installed version: [$InstalledVer]"

# Get latest released tag
LatestVer=$(get_latest_release_of_version "helm/helm" "${major_ver}")
echo "Latest version:    [${LatestVer}]"

if [ "$InstalledVer" != "$LatestVer" ]; then
    os=$(uname -s); os=${os,,}
    os_arch=$(dpkg --print-architecture)
    file_name="helm-${LatestVer}-${os}-${os_arch}.tar.gz"

    echo "Installing latest version: [${LatestVer}]..."
    sudo curl -L https://get.helm.sh/${file_name} -o ./${file_name}
    tar -zxvf ./${file_name}
    sudo mv ./${os}-${os_arch}/helm /usr/local/bin/helm
    sudo chmod +x /usr/local/bin/helm
    rm -f ./${file_name}
    rm -rf ./${os}-${os_arch}/    
    sudo /usr/local/bin/helm completion bash > /etc/bash_completion.d/helm
    echo "Installed version: [$(helm version --template="{{.Version}}")]"
fi
