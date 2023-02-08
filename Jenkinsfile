pipeline {
    agent any
    // Environment Variables
    environment {
        dockerImageName = "simpleApachehttp"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                echo "${env.dockerImageName}"
                //sh 'docker build -t myimage .'
            }
        }
        stage('Verify Docker Image') {
            steps {
                echo "Verifying Docker"                                        
                //sh 'docker run -p 80:80 my-apache-image'
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
