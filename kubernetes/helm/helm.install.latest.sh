script="./get_helm.sh"
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > ${script}
chmod +x ${script}
${script} -v latest
rm ${script}