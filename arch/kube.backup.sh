backup_store="./kube"

files=(
    "/storage/hdd01_1t/vms/store/kube01.qcow2"
    "/storage/hdd02_1t/vms/store/kube02.qcow2"
    "/storage/hdd03_2t/vms/store/kube03.qcow2"
)

for file in ${files[*]}; do
    echo -e "\nBackup: [${file}]\n"
    tar -jcvf ${backup_store}/$(basename ${file}).[$(date '+%Y.%m.%d-%H.%M.%S')].tar.gz ${file}
done


