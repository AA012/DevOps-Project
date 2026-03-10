pipeline {

 agent any

 stages {

  stage('Clone Code') {
   steps {
    git branch: 'main', url: 'https://github.com/AA012/DevOps-Project.git'
   }
  }

  stage('Deploy to Nginx') {
   steps {
    sh '''
    sudo rm -rf /var/www/html/*
    sudo cp -r * /var/www/html/
    sudo systemctl reload nginx
    '''
   }
  }

 }

}