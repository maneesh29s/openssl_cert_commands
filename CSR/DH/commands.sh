#!/usr/bin/env bash

# Generate DH parameters
openssl dhparam -out dhparam.pem 2048

# Generate a DH private key
openssl genpkey -paramfile dhparam.pem -out dh_key.pem

# Extract the DH public key
openssl pkey -in dh_key.pem -pubout -out dh_pub.pem

# generate CSR (fails)
# openssl does not support using static DH keys for 
# keyagreement or signinng
openssl req -new -key dh_key.pem -out dh_csr.pem -config openssl_dh.cnf

# workaround
# sign the CSR by using dummy (ECDH) CSR and forcing pubkey
openssl x509 -req -in ../ECDH/ecdh_csr.pem -force_pubkey dh_pub.pem -CA ../../CA/RSA/ca_cert.pem -CAkey ../../CA/RSA/ca_key.pem -CAcreateserial -out dh_cert.pem -days 365 -extfile <(printf "[v3_req]\nkeyUsage = critical, keyAgreement")

# generally no one uses static DH keys
