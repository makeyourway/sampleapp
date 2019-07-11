node {
    checkout scm
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
       sh 'docker version'
       sh 'docker build -t dineshrobin/sampleapp:latest .'
       sh 'docker push dineshrobin/sampleapp:latest'
    }
    
    archiveArtifacts 'properties'
}
