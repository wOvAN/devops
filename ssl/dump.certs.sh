CERT_DIR=./certs_dump

servers=(
    "example.com:443"
    "example.net:443"
)

# Create the certificates hierarchy expected by gitlab

sudo mkdir -p "${CERT_DIR}"

for server in ${servers[*]}; do
    # Get the certificate in PEM format and store it
    SERVER=$(echo "${server%%:*}")
    CERTIFICATE=$CERT_DIR/${SERVER}.crt
    openssl s_client -connect ${server} -servername $SERVER  -showcerts </dev/null 2>/dev/null | sed -e '/-----BEGIN/,/-----END/!d' | sudo tee "$CERTIFICATE" >/dev/null
done
