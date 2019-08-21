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

sudo /sbin/sysctl -w net.ipv4.conf.all.forwarding=1

# 5
 
sudo systemctl enable docker

# 6

sudo systemctl start docker