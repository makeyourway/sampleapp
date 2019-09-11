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
    stage('upload artifacts'){
         stage('Upload') {

        dir('path/to/your/project/workspace'){

            pwd(); //Log current directory

            withAWS(region:'us-east-1',credentials:'aws-creds') {

                 def identity=awsIdentity();//Log AWS credentials

                // Upload files from working directory 'dist' in your project workspace
                s3Upload(bucket:"yourBucketName", workingDir:'dist', includePathPattern:'**/*');
            }

        };
    }
    }
    archiveArtifacts 'properties'
}
