def dockerbuildversion = null
pipeline {
    agent any
    // Environment Variables
    environment {
        dockerImageName = "simpleapachehttp"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo " = = = == = = = = = = Creating Docker Image = = = = = == = = = = ="
                    echo "${env.dockerImageName}"
                    dockerbuildversion = "user"
                    echo "Building Number ${BUILD_NUMBER} and docker build version is ${dockerbuildversion}"
                    //sh 'docker build -t apache-image .'
                    sh 'docker build -t $dockerImageName:v$BUILD_NUMBER .'
                }
            }
        }
        stage('Verify Docker Image') {
            steps {
                echo "Verifying Docker and Build Version"
                echo ${dockerbuildversion}
                //sh 'docker run -p 80:80 $dockerbuildversion'
                //sh docker logs <container-id> //
            }
        }
        stage('Deploy Docker Image') {
            steps {
                echo "Deploying Docker" 
                //docker run -p 80:80 my-apache-image'
            }
        }
    }
}
