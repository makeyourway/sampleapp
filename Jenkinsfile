node {
    checkout scm
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        sh 'echo "image repo" :$IMAGE_REPO'
        sh 'docker build -t dineshrobin/sampleapp:latest .'
    }
    
    archiveArtifacts 'properties'
}
