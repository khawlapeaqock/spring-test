pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh './gradlew clean build'
            }
        }
         stage('Dockerize') {
             steps {
                 sh 'docker build . --file dockerfile --tag my-microservice-repository:latest' 
            }
        }
        
 
          stage('Push to ECR') {
            steps {
                script{
                    docker.withRegistry('https://433909495486.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:aws-credentials')
                    {
                    docker.image("my-microservice-repository:latest").push("https://433909495486.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest")

                    }
                }
            }
        }
        
        
        
        
    }
}
 
