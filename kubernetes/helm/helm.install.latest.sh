#!/bin/bash

# Get installed version
InstalledVer=$(helm version --template="{{.Version}}")
echo "Installed version: [$InstalledVer]"

# Get latest released tag
LatestVer=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep 'tag_name' | cut -d\" -f4)
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
    sudo helm completion bash > /etc/bash_completion.d/helm
    echo "Installed version: [$(helm version --template="{{.Version}}")]"
fi
