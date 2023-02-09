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
        dockerbuildversion = "$dockerImageName:v$BUILD_NUMBER"
        dockertag = "${env.BUILD_NUMBER}"
        containername = "apachehttpd"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    echo "+++++++++++++++++++ Removing All Docker Container +++++++++++++++++++"
                    
                    sh 'docker container stop $(docker container ls -aq)' // Stop all
                    sh 'docker container prune -f' // Remove all exited containers
                    sh 'docker ps -a'
                                                            
                    echo " = = = == = = = = = = Creating Docker Image = = = = = == = = = = ="
                    
                    echo "+++++ Version is $dockerbuildversion"
                    echo "Building Number ${BUILD_NUMBER} and docker build version is ${dockerbuildversion}"
                    
                    // Building Docker Images
                    sh 'docker build -t $dockerImageName/$BUILD_NUMBER -f Dockerfile .'
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
                    sh 'docker run -d --name $containername$BUILD_NUMBER -p 100:80 $dockerImageName/$BUILD_NUMBER'
                    sh 'response=$(curl -s -w %{http_code} localhost:100)'
                    sh 'httpcode=$(tail -n1 <<< "$response")'
                    statuscode=sh 'echo "$httpcode"'
                    echo "${statuscode}"
                    //sh docker logs <container-id> //
                }
            }
        }
    }
}
