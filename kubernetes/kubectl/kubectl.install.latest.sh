#!/bin/bash

# Get installed version
InstalledVer=$(kubectl version --short --client | grep -o ': .*' | cut -f2- -d ' ')
echo "Installed version: [${InstalledVer}]"

# Get latest released tag
LatestVer=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
echo "Latest version:    [${LatestVer}]"

if [ "${InstalledVer}" != "${LatestVer}" ]; then
    os=$(uname -s); os=${os,,}
    os_arch=$(dpkg --print-architecture)
    curl -LO https://storage.googleapis.com/kubernetes-release/release/${LatestVer}/bin/${os}/${os_arch}/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    sudo kubectl completion bash > /etc/bash_completion.d/kubectl
    echo "Installed version: [$(kubectl version --short --client | grep -o ': .*' | cut -f2- -d ' ')]"
fi


