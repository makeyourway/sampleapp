node {
    checkout scm
   
    stage('save-env') {
        sh 'env > properties'
    }

    stage('build-image') {
       sh 'docker build -t dineshrobin/sampleapp:latest .'
       sh 'docker push dineshrobin/sampleapp:latest'
    }
    
    stage('push image'){
    docker.withRegistry('https://index.docker.com', 'docker-auth') {

        def customImage = docker.build("sampleapp:${env.BUILD_ID}")
    }
    
    archiveArtifacts 'properties'
}
