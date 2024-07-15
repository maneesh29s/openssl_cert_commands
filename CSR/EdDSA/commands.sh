#!/usr/bin/env bash

# Generate EdDSA private key
openssl genpkey -algorithm ed25519 -out eddsa_private_key.pem  

# generate CSR
openssl req -new -key eddsa_key.pem -out eddsa_csr.pem -config openssl_eddsa.cnf


# generate certificate using ECSA CA
openssl x509 -req -in eddsa_csr.pem -CA ../../CA/ECDSA/ca_cert.pem -CAkey ../../CA/ECDSA/ca_key.pem -CAcreateserial -out eddsa_cert.pem -days 365 -extfile <(printf "keyUsage=critical,keyAgreement")

