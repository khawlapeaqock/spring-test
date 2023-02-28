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
                script {
                    withCredentials([awsEcr(credentialsId: 'aws-user-passwd', region: "us-east-1", registryUrl: "433909495486.dkr.ecr.us-east-1.amazonaws.com")]) 
                       {
                            docker.withRegistry("433909495486.dkr.ecr.us-east-1.amazonaws.com", 'ecr') 
                            {
                            docker.image("my-microservice-repository:latest").push("433909495486.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest")
                            }
                        }
                    }
                }
            }      
    }
}
 
