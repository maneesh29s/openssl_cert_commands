#1/usr/bin/env bash

# Generate RSA private key for CA
openssl genpkey -algorithm RSA -out ca_key.pem -aes256

# Create a self-signed CA certificate
openssl req -x509 -new -key ca_key.pem -out ca_cert.pem -days 365 -subj "/C=US/ST=California/L=San Francisco/O=Example CA/CN=example.com"


# initialise the directory
mkdir -p demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
mkdir -p demoCA/private
cp ca_key.pem demoCA/private/cakey.pem
cp ca_cert.pem demoCA/cacert.pem

