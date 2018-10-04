cp ./vlg-soc-web04t.megafon.ru.key /etc/pki/ca-trust/source/anchors

update-ca-trust enable
update-ca-trust extract
update-ca-trust update

# systemctl restart docker