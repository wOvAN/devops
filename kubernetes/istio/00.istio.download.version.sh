export ISTIO_VERSION=1.6.8
export TARGET_ARCH=x86_64

echo "export ISTIO_VERSION=${ISTIO_VERSION}" >./ISTIO_VERSION
echo "Latest: [${ISTIO_VERSION}]"

curl -L https://istio.io/downloadIstio | sh -