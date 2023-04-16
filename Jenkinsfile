pipeline {
    agent any
    stages{
        stage('Build Docker image'){
            steps{
                script{
                    sh 'docker --version'
                    sh 'docker build -t maven/base .'
                    sh 'docker run -d -i -t maven/base /bin/sh'
                }
            }
        }
    }
}