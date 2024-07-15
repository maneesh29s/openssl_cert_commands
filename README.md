# OpenSSL Certificate Generation

This repo contains reference commands which can be used to generate various combinations of OpenSSL digital certificates, typically [X.509](https://datatracker.ietf.org/doc/html/rfc5280) certificates.

## Algorithms

Refer [RFC3279](https://datatracker.ietf.org/doc/html/rfc3279) to see the support for various signing and key exchange algorithm in X.509.

Currently this repo contains 

1. CA
	1. RSA
	1. ECDSA
1. CSR
	1. DH
	1. RSA
	1. ECDH
	1. EDDSA

## Configurations

Each CA and CSR has its config which contains most of the [standard fields](https://datatracker.ietf.org/doc/html/rfc5280#section-4.1) in a X.509 certificate.

Once you understand idea behind the whole X.509 public key infrastructure, you can create your own CAs and CSRs. You can combine any CSR with any CA, and see what changes are made in the certificates.

## keyUsage Extension

The [keyUsage](https://datatracker.ietf.org/doc/html/rfc5280#section-4.2.1.3) extension is (according to me) probably the most important extension.

A subject can request for particular keyUsage in its CSR. The CA will decide which keyUsage to allow, based on 
1. its own default config
2. The arguments passed to the openssl command
