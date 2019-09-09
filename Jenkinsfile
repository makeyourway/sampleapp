node {
    checkout scm
   
    stage('save-env') {
        sh 'env > properties'
    }
    

    stage('build-image') {
       app = docker.build("dineshrobin/testapp")
    }
    
    stage('push image'){
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-auth'){
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
    }   
    }
    archiveArtifacts 'properties'
}
