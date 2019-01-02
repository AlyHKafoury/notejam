#!/bin/bash
openssl genrsa -des3 -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.pem
openssl req -new -sha256 -nodes -out registry.csr -newkey rsa:2048 -keyout registry.key
openssl x509 -req -in registry.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out registry.crt -days 500 -sha256
