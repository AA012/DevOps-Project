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
    rm -rf /var/www/html/*
    cp -r * /var/www/html/
    systemctl restart nginx
    '''
   }
  }

 }

}