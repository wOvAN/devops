#!/bin/bash

CERT_DIR=~/.git-certs
SERVER="gitlab.example.com"
PORT=443
CERTIFICATE="${CERT_DIR}/certs.crt"

# Create the certificates hierarchy expected by gitlab
mkdir -p ${CERT_DIR}

# Get the certificate in PEM format and store it
openssl s_client -connect ${SERVER}:${PORT} \
    -servername ${SERVER} \
    -showcerts </dev/null 2>/dev/null | sed -e '/-----BEGIN/,/-----END/!d' | sudo tee "${CERTIFICATE}" >/dev/null

git config --global http.sslCAInfo ${CERTIFICATE}


