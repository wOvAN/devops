#!/bin/bash

# https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
# https://github.com/hashicorp/terraform/releases/tag/v0.14.3

gh_path="hashicorp/terraform"

# Get installed version
InstalledVer=$(terraform -version | grep -o 'v.*' | cut -f2- -d ' ' | cut -c2-)
echo "Installed version: [${InstalledVer}]"

# exit

get_arch () {
    # dpkg --print-architecture
    cpu_arch=$(uname -m)
    if [ ${cpu_arch} == "x86_64" ]; then
	cpu_arch="amd64"
    fi
    echo ${cpu_arch}
}


# Get latest released tag
LatestVer=$(curl -s https://api.github.com/repos/${gh_path}/releases/latest | grep 'tag_name' | cut -d\" -f4 | cut -c2-)
echo "Latest version:    [${LatestVer}]"

# exit

if [ "${InstalledVer}" != "${LatestVer}" ]; then
    os=$(uname -s); os=${os,,}
    os_arch=$(get_arch)
    curl -L https://releases.hashicorp.com/terraform/${LatestVer}/terraform_${LatestVer}_${os}_${os_arch}.zip -o ./terraform.zip
    unzip ./terraform.zip
    rm -f ./terraform.zip
    chmod +x -v ./terraform
    sudo mv ./terraform /usr/local/bin/terraform
    echo "Installed version: [$(terraform -version | grep -o 'v.*' | cut -f2- -d ' ' | cut -c2-)]"
fi


