node {
    checkout scm
    
    environment {
    registry = "index.docker.com/dineshrobin"
    registryCredential = 'docker-auth'
  }
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
       sh 'docker build -t dineshrobin/sampleapp:latest .'
       sh 'docker push dineshrobin/sampleapp:latest'
    }
    
    archiveArtifacts 'properties'
}
