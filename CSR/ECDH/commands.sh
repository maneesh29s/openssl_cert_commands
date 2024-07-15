#!/usr/bin/env bash

# Generate ECDH private key
openssl ecparam -name prime256v1 -genkey -noout -out ecdh_key.pem

# Extract the ECDH public key
openssl ec -in ecdh_key.pem -pubout -out ecdh_pub.pem

# generate CSR
openssl req -new -key ecdh_key.pem -out ecdh_csr.pem -config openssl_ecdh.cnf


# generate certificate using RSA CA
openssl x509 -req -in ecdh_csr.pem -CA ../../CA/RSA/ca_cert.pem -CAkey ../../CA/RSA/ca_key.pem -CAcreateserial -out ecdh_cert.pem -days 365 -extfile <(printf "keyUsage=critical,keyAgreement")


