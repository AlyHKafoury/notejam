#!/bin/bash
printf "aly:$(openssl passwd -1 aly)" | base64
