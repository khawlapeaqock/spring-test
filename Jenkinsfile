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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AKIAWKBYFO27JLX5KXOT', credentialsId: 'aws-user-passwd', secretKeyVariable: 'RB36EwwWWKCKEWBoiAXu/dHXDNRsiwGMd8cB/NPC']]) {
                    sh 'aws ecr get-login-password --region <YOUR_AWS_REGION> | docker login --username AWS --password-stdin 433909495486.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository'
                    sh 'docker push 433909495486.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest'
                }
            }
        
    }
}
