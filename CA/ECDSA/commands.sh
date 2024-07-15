#!/usr/bin/env bash

# generate the ECDSA private key for the CA
openssl ecparam -genkey -name prime256v1 -noout -out ca_key.pem

# generate ECDSA self-signed CA certificate
openssl req -x509 -new -key ca_key.pem -out ca_cert.pem -days 365 -subj "/C=US/ST=California/L=San Francisco/O=ECDSA sign CA/CN=example.ecdsa.com"

# create database
mkdir -p demoCA/newcerts
touch demoCA/index.txt
echo 1000 > demoCA/serial
mkdir -p demoCA/private
cp ca_key.pem demoCA/private/cakey.pem
cp ca_cert.pem demoCA/cacert.pem

