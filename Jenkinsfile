pipeline {
 agent any
 stages {

  stage('Clone Code') {
   steps {
    git 'https://github.com/AA012/DevOps-Project.git'
   }
  }

  stage('Deploy to Nginx') {
   steps {
    sh '''
    sudo cp -r * /var/www/html/
    sudo systemctl restart nginx
    '''
   }
  }

 }

}