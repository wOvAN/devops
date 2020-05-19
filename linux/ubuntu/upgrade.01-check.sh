sudo apt update 
sudo apt upgrade -y 
sudo apt install -y update-manager-core

echo "Make sure the Prompt line in /etc/update-manager/release-upgrades is set to 'normal' if you want non-LTS upgrades, or 'lts' if you only want LTS upgrades."

cat /etc/update-manager/release-upgrades

