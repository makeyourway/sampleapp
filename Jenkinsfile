node {
    checkout scm
   
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
       sh 'docker build -t dineshrobin/sampleapp:latest .'
    }
    
    stage('push image'){
        docker.withRegistry('https://index.docker.com', 'docker-auth'){
            sh 'docker push dineshrobin/sampleapp:latest'
    }   
    }
    archiveArtifacts 'properties'
}
