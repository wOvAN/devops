image="dotcypress/mtproxy"
name="mtproxy"

key_file="./${name}_key.txt"
secret_file="./${name}_secret.txt"

if [ -f "${key_file}" ]; then
    proxy_key=$(cat $key_file)
else
    proxy_key=$(openssl rand -hex 16)
    echo -n ${proxy_key} > ${key_file}
fi

docker stop ${name}
docker rm ${name}
docker pull ${image}

docker run -d \
    --name ${name} \
    -p 1984:1984 \
    --restart always \
    ${image} -s ${proxy_key}

docker logs ${name} | grep Secret: > ${secret_file}
