// pipeline {

//  agent any

//  stages {

//   stage('Clone Code') {
//    steps {
//     git branch: 'main', url: 'https://github.com/AA012/DevOps-Project.git'
//    }
//   }

//   stage('Deploy to Nginx') {
//    steps {
//     sh '''
//     sudo rm -rf /var/www/html/*
//     sudo cp -r * /var/www/html/
//     sudo systemctl reload nginx
//     '''
//    }
//   }

//  }

// }

pipeline {

 agent any

 environment {
  IMAGE_NAME = "addisg/devops-nginx-app"
  TAG = "1.0.0"
 }

 stages {

  stage('Clone Code') {
   steps {
    git branch: 'main', url: 'https://github.com/AA012/DevOps-Project.git'
   }
  }

  stage('Build Docker Image') {
   steps {
    sh 'docker build -t $IMAGE_NAME:$TAG .'
   }
  }

  stage('Login to DockerHub') {
   steps {
    withCredentials([usernamePassword(
      credentialsId: 'dockerhub-creds',
      usernameVariable: 'DOCKER_USER',
      passwordVariable: 'DOCKER_PASS'
    )]) {
      sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
    }
   }
  }

  stage('Push Image') {
   steps {
    sh 'docker push $IMAGE_NAME:$TAG'
   }
  }

  stage('Run Container') {
   steps {
    sh '''
    docker stop devops-app || true
    docker rm devops-app || true
    docker run -d -p 8081:80 --name devops-app $IMAGE_NAME:$TAG
    '''
   }
  }

 }

}