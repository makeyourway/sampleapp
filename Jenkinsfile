node {
    checkout scm
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        docker build -t dineshrobin/sampleapp:latest .
        docker push dineshrobin/sampleapp:latest
    }
    
    archiveArtifacts 'properties'
}
