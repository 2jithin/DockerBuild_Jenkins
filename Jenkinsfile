pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo "User1"
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
                //docker run -p 80:80 my-apache-image'
            }
        }
    }
}
