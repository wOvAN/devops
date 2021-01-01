read -p "Enter username: " USER
sudo useradd --create-home ${USER}
### groups
# -g users -G wheel,developers username
sudo passwd ${USER}

