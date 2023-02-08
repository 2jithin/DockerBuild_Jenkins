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
                echo "hello"                                        
                //sh 'docker run -p 80:80 my-apache-image'
            }
        }
    }
}
