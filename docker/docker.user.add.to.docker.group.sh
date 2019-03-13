read -p "Enter username: " USER
sudo usermod -aG docker ${USER}
grep 'docker' /etc/group