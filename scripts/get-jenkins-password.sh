#!/bin/bash
./kubectl.sh exec -it jenkins-0 cat /var/jenkins_home/secrets/initialAdminPassword
