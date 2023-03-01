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
        
         stage('Login to ECR') {
             steps {
        // Authenticate with AWS and ECR
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AKIATTVLL4XTFNVRX7QG', secretKeyVariable: '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']])
                 {
          sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 248393754086.dkr.ecr.us-east-1.amazonaws.com'
              }
             }
           }
        
    stage('Push to ECR') {
      steps {
        // Push your Docker image to ECR
        sh "docker tag my-microservice-repository:latest 248393754086.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest"
        sh "docker push 248393754086.dkr.ecr.us-east-1.amazonaws.com/my-microservice-repository:latest"
      }
    }
        
      
    }
}
 
