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
                withAWS(credentials: 'your-ecr-credentials-id', region: 'us-east-1') {
                 sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 248393754086.dkr.ecr.us-east-1.amazonaws.com'
                 sh "docker tag my-microservice-repository:latest 248393754086.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest"
                 sh "docker push 248393754086.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest"
                }
            }
        }    
  
        
 
        
      
    }
}
 

















