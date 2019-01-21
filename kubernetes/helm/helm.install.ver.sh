ver=v2.10.0
script="./get_helm.sh"
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > ${script}
chmod +x ${script}
${script} -v ${ver}
rm ${script}