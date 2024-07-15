#!/usr/bin/env bash

# Generate RSA private key
openssl genpkey -algorithm RSA -out rsa_key.pem

# Generate the CSR using the subject configuration file
openssl req -new -key rsa_key.pem -out rsa_csr.pem -config openssl_subject.cnf


# sign the certificate using ECDSA CA
openssl x509 -req -in rsa_csr.pem -CA ../../CA/ECDSA/ca_cert.pem -CAkey  ../../CA/ECDSA/ca_key.pem -CAcreateserial -out rsa_cert.pem -days 365 -extfile <(printf "keyUsage=critical,digitalSignature,keyEncipherment")
