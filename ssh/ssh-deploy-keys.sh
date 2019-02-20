
if [ ! -e ~/.ssh/id_rsa.pub ]; then 
    ssh-keygen;
fi

user="root"
ssh_port="22"

hosts=(
    "host01"
    "host02"
    "host03"
)

for host in ${hosts[*]}; do
    ssh-copy-id ${user}@${host} -p ${ssh_port}
done

