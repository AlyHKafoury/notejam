#!/bin/bash
echo Kubernetes URL : `./kubectl.sh config view | grep server | cut -f 2- -d ":" | tr -d " "`;
echo "Kubernetes certificate data key :"
cat ansible/config | egrep certificate-authority-data: | sed -e 's/certificate-authority-data://g'| tr -d '[[:space:]]' | base64 -d;
echo "Kubernetes credentials secret text:";
./kubectl.sh describe secret $(./kubectl.sh get secrets | grep default | cut -f1 -d ' ') | grep -E '^token' | cut -f2 -d':' | tr -d '\t' | tr -d '[[:space:]]';
echo ;
echo Kubernetes Jenkins URL: http://jenkins:8080/jenkins
echo Kubernetes Jenkins tunnel: jenkins:50000
echo Kubernetes Jenkins slave image: jenkins/jnlp-slave
echo Kubernetes Jenkins Env var : JAVA_OPTS= -noCertificateCheck
