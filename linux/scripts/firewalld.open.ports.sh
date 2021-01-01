zone="public"

firewall-cmd --zone=$zone --add-port=38080/tcp --permanent
firewall-cmd --zone=$zone --add-port=38591/tcp --permanent
firewall-cmd --zone=$zone --add-port=7111/tcp --permanent
firewall-cmd --zone=$zone --add-port=7011/tcp --permanent
# firewall-cmd --zone=$zone --add-port=2379-2380/tcp --permanent  
# firewall-cmd --zone=$zone --add-port=4789/udp --permanent       

firewall-cmd --reload






