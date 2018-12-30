./scripts/post-kube.sh clean=false
./helm.sh init --service-account tiller
./helm.sh install --name jenkins --namespace default stable/jenkins -f helm/jenkins/values.yml