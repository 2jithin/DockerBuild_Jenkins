def dockerbuildversion = null
pipeline {
    agent any
    options {
        timeout(time: 20, unit: 'MINUTES')
        timestamps()
    }
    // Environment Variables
    environment {
        dockerImageName = "simpleapachehttp"
        dockertag = "${env.BUILD_NUMBER}"
        containername = "apachehttpd"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo " = = = == = = = = = = Creating Docker Image = = = = = == = = = = ="
                    echo "${env.dockerImageName}"
                    dockerbuildversion = "$dockerImageName:v$BUILD_NUMBER"
                    echo "+++++ Version is $dockerbuildversion"
                    echo "Building Number ${BUILD_NUMBER} and docker build version is ${dockerbuildversion}"
                    //sh 'docker build -t apache-image .'
                    sh 'docker build -t $dockerImageName:v$BUILD_NUMBER -f Dockerfile .'
                }
            }
        }
        stage('Verify Docker Image') {
            steps {
                script {
                    echo "Verifying Docker and Build Version"
                    dockerbuildversion = "$dockerImageName:v$BUILD_NUMBER"
                    echo "Docker build version : $dockerbuildversion"
                    echo "container name is $containername"
                    sh 'docker run -d --name $containername$BUILD_NUMBER -p 100:80 $dockerImageName:v$BUILD_NUMBER'
                    //sh docker logs <container-id> //
                }
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
