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
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                 {
          sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REGISTRY'
              }
             }
           }
        
    stage('Push to ECR') {
      steps {
        // Push your Docker image to ECR
        sh "docker tag $IMAGE_NAME $ECR_REGISTRY/$IMAGE_NAME"
        sh "docker push $ECR_REGISTRY/$IMAGE_NAME"
      }
    }
        
      
    }
}
 
