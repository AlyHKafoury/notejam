def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
  node(label) {
    def myRepo = checkout scm
    def gitCommit = myRepo.GIT_COMMIT
    def gitBranch = myRepo.GIT_BRANCH
 
    stage('Set Env') {
      try {
        container('docker') {
          sh """
            pwd
            echo "GIT_BRANCH=${gitBranch}" >> /etc/environment
            echo "GIT_COMMIT=${gitCommit}" >> /etc/environment
            """
        }
      }
      catch (enverror) {
        println "Failed to test - ${currentBuild.fullDisplayName}"
        throw(enverror)
      }
    }
    stage('Build') {
      container('docker') {
          sh """
            cd notejam;
            docker build . -t docker-registery:5000/notejam-${gitCommit};
            docker push docker-registery:5000/notejam-${gitCommit};
            """
      }
    }
    stage('Create Docker images') {
      container('docker') {
          sh    """
                ls -al
                echo $PWD
                """
        }
    }
    stage('Run kubectl') {
      container('kubectl') {
        sh "kubectl get pods"
      }
    }
  }
}