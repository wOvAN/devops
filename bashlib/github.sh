#!/bin/bash

#################################################################################

### usage: github_get_latest_release() "helm/helm"
# github_get_latest_release "kubernetes-sigs/kubespray"
github_get_latest_release() {
    latest=$(curl -s https://api.github.com/repos/${1}/releases/latest | grep 'tag_name' | cut -d\" -f4)
    echo "${latest}"
}

#################################################################################

### usage: github_get_latest_release_of_version "helm/helm" "v3"
github_get_latest_release_of_version() {
    releases=$(curl -s https://api.github.com/repos/${1}/releases | grep 'tag_name' | cut -d\" -f4)
    for i in ${releases[@]}; 
    do
      if [[ "$i" =~ ^${2}\.[0-9]+\.[0-9]+$ ]]; then
        echo "${i}"
        break
      fi
    done
}

#################################################################################

github_get_latest_version_release() {
    latest="$(curl -s https://api.github.com/repos/${1}/releases | grep 'tag_name' | cut -d\" -f4 | grep -E '^v*([0-9]*.[0-9]*.[0-9]*)$' | sort --version-sort | tail -1)"
    echo "${latest}"
}

#################################################################################

# github_get_latest_version_release "istio/istio"
# github_get_latest_version_release "helm/helm"
# github_get_latest_version_release "kubernetes-sigs/kubespray"
# github_get_latest_version_release "rancher/rke"

exit

# curl -sL https://github.com/istio/istio/releases | grep -o 'releases/[0-9]*.[0-9]*.[0-9]*/' | sort --version-sort


# github_get_latest_release "helm/helm"


# curl -s https://api.github.com/repos/istio/istio/releases | grep 'tag_name' | cut -d\" -f4 | grep -E 'v*([0-9]*.[0-9]*.[0-9])$'

declare a versions
declare a versions2
versions=(
"v1.2.6"
"v1.1.15"
"v1.1.15-rc4"
"v1.2.6-rc6"
"v1.1.15-rc3"
"v1.1.15-rc2"
"v1.1.15-rc1"
"v1.2.6-rc5"
"v1.2.6-rc4"
"v1.2.6-rc3"
"v1.2.6-rc2"
"v1.2.6-rc1"
"v1.3.0-rc1"
"v1.0.16"
"v1.1.14"
"v1.2.5"
"v1.2.5-rc2"
"v1.0.16-rc1"
"v1.1.14-rc3"
"v1.2.5-rc1"
"v1.1.14-rc2"
"v1.1.14-rc1"
"v1.2.4"
"v1.1.13"
"v1.0.15"
"v1.1.13-rc3"
"v1.0.15-rc2"
"v1.0.15-rc1"
"v1.1.13-rc2"
"v1.2.4-rc9"
)

versions2=(
"1.2.6-rc0"
"1.1.15"
"1.1.13-rc3"
"1.0.15-rc2"
"1.0.15-rc1"
"1.1.13-rc2"
"1.0.15"
"1.1.13"
)

# curl -s https://api.github.com/repos/rancher/rke/releases | grep 'tag_name' | cut -d\" -f4 | grep -E 'v*[0-9]*.[0-9]*.[0-9]$'

# printf '%s\n' "${versions[@]}"

# echo "${VERSION//.}"

printf '%s\n' "${versions2[@]}"  | grep -E '^v*([0-9]*.[0-9]*.[0-9]*)$' | sort --version-sort | tail -1


# | grep -v '([0-9]*.[0-9]*.[0-9]*)'
# sort --version-sort
# | sort --version-sort | tail -1


# curl -s -v https://api.github.com/repos/istio/istio/releases

#| grep -E 'v*([0-9]*.[0-9]*.[0-9])'

# | grep -o '([0-9]+)\.([0-9]+)\.([0-9]+)' | sort --version-sort
# | tail -1
# | awk -F'/' '{ print $2}'