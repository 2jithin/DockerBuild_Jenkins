def dockerbuildversion = null
response = null
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
                    // Validate any container is running
                    echo " Validating running container with names "
                    def containerId = sh(returnStdout: true, script: "docker ps --filter name=$containername -q")
                    echo "${containerId}"
                    if (containerId) {
                                                // cleanup docker images and Containers
                        echo "+++++++++++++++++++ Removing All Docker Container +++++++++++++++++++" 

                        sh 'docker container stop $(docker container ls -aq)' // Stop all
                        sh 'docker container prune -f' // Remove all exited containers
                        sh 'docker ps -a'
                        sh 'bash cleanupimages.sh'   
                    } else {
                        echo "Skipping the cleanup process in docker"                    
                    }
                                                        
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
//                 environment {
//                     cid = sh returnStdout: true, script: 'docker ps --quiet --filter name=${dockerImageName}'
//                 }
                script {
                    try {
                        
                        //echo "$cid"
                        echo "Verifying Docker and Build Version"
                        dockerbuildversion = "$dockerImageName:v$BUILD_NUMBER"
                        echo "Docker build version : $dockerbuildversion"

                        echo "container name is $containername"
                        sh 'docker run -d --name $containername$BUILD_NUMBER -p 100:80 $dockerImageName/$BUILD_NUMBER'
                        sh 'response=$(curl -s -w %{http_code} localhost:100)'
                        sh 'httpcode=$(tail -n1 <<< "$response")'
                        response = httpRequest ignoreSslErrors: true, url: 'http://localhost:100'
                        echo "Request http status is ${response.status}"
                        //sh docker logs <container-id> //
                        def statuscode = "${response.status}"
                       if (statuscode == "200") {
                            echo "****************** Latest Docker Image is Valid Image ***********************"
                        } else {
                            sh 'echo "Invalid Docker Image and verification failed"'
                        }                             
                    } catch (Exception ex) {
                        echo "Image Invalid Stopping pipeline"
                        throw new Exception("stop pipeline")
                    }                   
                }
            }
        }
    }
}
