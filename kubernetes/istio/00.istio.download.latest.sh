github_get_latest_version_release() {
  latest="$(curl -sL https://github.com/${1}/releases | \
                  grep -o 'releases/[0-9]*.[0-9]*.[0-9]*/' | sort --version-sort | \
                  tail -1 | awk -F'/' '{ print $2}')"
  latest="${latest##*/}"
  echo "${latest}"
}

LatestVer=$(github_get_latest_version_release "istio/istio")
InstalledVer=$(istioctl version --short --remote=false)

echo "Installed version: [${InstalledVer}]"
echo "Latest version:    [${LatestVer}]"

if [ "${InstalledVer}" != "${LatestVer}" ]; then
  curl -L https://istio.io/downloadIstio | sh -
  echo "export ISTIO_VERSION=${LatestVer}" > ./ISTIO_VERSION
  # echo "export ISTIOCTL=./istio-${LatestVer}/bin/istioctl" >> ./ISTIO_VERSION  
  cp ./istio-${LatestVer}/bin/istioctl /usr/local/bin/istioctl
  chmod +x /usr/local/bin/istioctl  
  echo "Installed version: [$(istioctl version --short --remote=false)]"
fi