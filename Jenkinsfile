node {
    checkout scm
    
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
        sh 'echo "image repo" :$IMAGE_REPO'
        sh 'docker build -t $IMAGE_REPO:$IMAGE_TAG .'
    }
    
    stage('push-image') {
        sh 'gcloud docker -- push $IMAGE_REPO:$IMAGE_TAG'
    }
    
    archiveArtifacts 'properties'
}
