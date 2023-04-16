pipeline {
    agent any
    stages{
        stage('Git code pull'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/BharadwajaC/KarateApitestdemo2.git']])
            }
        }
        stage('Build Docker image'){
            steps{
                script{
                    sh 'docker --version'
                    sh 'docker image prune'
                    sh 'docker build -t mvnjd11/karate .'
                }
            }
        }
    }
}