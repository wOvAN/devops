zone="public"

firewall-cmd --zone=$zone --add-port=80/tcp --permanent         
firewall-cmd --zone=$zone --add-port=443/tcp --permanent        
firewall-cmd --zone=$zone --add-port=2379-2380/tcp --permanent  
firewall-cmd --zone=$zone --add-port=4789/udp --permanent       

firewall-cmd --reload






