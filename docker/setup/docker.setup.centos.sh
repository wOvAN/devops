# 1

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
    lvm2
# 2

sudo yum-config-manager \
    --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo

# 3

sudo yum install -y docker-ce

# 4

/sbin/sysctl -w net.ipv4.conf.all.forwarding=1

# 5
 
systemctl enable docker

# 6

systemctl start docker