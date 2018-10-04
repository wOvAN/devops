CERT_DIR=./certs_dump

SERVER=vlg-soc-web04t.megafon.ru
PORT=443
CERTIFICATE=$CERT_DIR/${SERVER}.crt

# Create the certificates hierarchy expected by gitlab
sudo mkdir -p $(dirname "$CERTIFICATE")

# Get the certificate in PEM format and store it
openssl s_client -connect ${SERVER}:${PORT} -servername $SERVER  -showcerts </dev/null 2>/dev/null | sed -e '/-----BEGIN/,/-----END/!d' | sudo tee "$CERTIFICATE" >/dev/null
