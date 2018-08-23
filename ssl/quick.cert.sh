### CA Params ###################################################################
country="RU"
state="Russia"
location="Moscow"
email="email@example.com"
org="Example org"
org_unit="Example department"
### CA Params ###################################################################
days=1825
sha=sha512
key_len=4096
#################################################################################
dns_name="site.example.com"

openssl req -x509 -newkey rsa:${key_len} ${sha} -keyout ${dns_name}.key -out ${dns_name}.crt -days ${days} \
    -nodes \
    -subj "/C=${country}/ST=${state}/emailAddress=${email}/CN=${dns_name}/L=$location/O=${org}/OU=${org_unit}"