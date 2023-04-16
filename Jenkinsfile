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
                    sh 'docker build -t mvnjdk11/karate .'
                    sh 'docker run -d --name karateapidemo2 -p 9001:9001 mvnjdk11/karate sleep 1000'
                    sh 'docker cp karateapidemo2:/home/karateuser/KarateApitestdemo2/target/karate-reports/karate-summary.html /home/bharadwaja/karatelogs/karate-summary.html'
                }
            }
        }
    }
}