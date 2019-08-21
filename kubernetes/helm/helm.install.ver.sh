ver=v2.13.1
script="./get_helm.sh"
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > ${script}
chmod +x ${script}
${script} -v ${ver}
rm ${script}