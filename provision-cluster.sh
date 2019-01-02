#!/bin/bash
./scripts/post-kube.sh clean=false;
ls manifests | xargs -I {} ./kubectl.sh apply -f manifests/{};
cd notejam;
docker build . -t docker-registry:31000/notejam-app:latest;
docker push docker-registry:31000/notejam-app:latest;
