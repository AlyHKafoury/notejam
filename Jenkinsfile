def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'mysql_test', image: 'mariadb', command: 'cat', ttyEnabled: true,
    envVars: [envVar(key: 'MYSQL_ALLOW_EMPTY_PASSWORD', value: 'yes')]
  ),
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
            docker build . -t docker-registry:31000/notejam:${gitCommit};
            docker push docker-registry:31000/notejam:${gitCommit};
            """
      }
    }
    stage('Test Image') {
        podTemplate(label: label, containers: [
        containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
        containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
        containerTemplate(name: 'mysql_test', image: 'mariadb', command: 'cat', ttyEnabled: true,
            envVars: [envVar(key: 'MYSQL_ALLOW_EMPTY_PASSWORD', value: 'yes')]
        ),
        ],
        volumes: [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
        ]) {
        node("Testing-${gitCommit}") {
            stage('Build') {
            container('docker') {
                sh """
                    echo success
                    """
            }            
        }
    }
    stage('Deploy Image to production') {
      container('kubectl') {
        sh "kubectl.sh set image deployment notejam-app notejam-app=docker-registry:31000/notejam:${gitCommit}"
      }
    }
  }
}