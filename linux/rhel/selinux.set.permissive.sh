echo "--- SESTATUS OLD ------------------------------------------------"
sestatus
echo "--- SESTATUS NEW ------------------------------------------------"
sudo setenforce 0
sudo sed -i 's/SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
sestatus
echo "-----------------------------------------------------------------"
