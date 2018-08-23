### CA Params ###################################################################
country="RU"
state="Russia"
location="Moscow"
email="email@example.com"
org="Example org"
org_unit="Example department"
### CA Params ###################################################################
dns_name="site.example.com"

openssl req -x509 -newkey rsa:4096 -keyout ${dns_name}.key -out ${dns_name}.crt -days 1095 \
    -nodes \
    -subj "/C=${country}/ST=${state}/emailAddress=${email}/CN=${dns_name}/L=$location/O=${org}/OU=${org_unit}"