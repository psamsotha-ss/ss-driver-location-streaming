#!/usr/bin/groovy
pipeline {
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/psamsotha-ss/ss-driver-location-streaming.git', branch: 'cicd-jenkins'
            }
        }

        stage('Test') {
            agent { docker { image 'psamsotha/scrumptious-python-testing' } }
            environment {
                AWS_DEFAULT_REGION = 'us-west-2'
            }
            steps {
                sh './runtests.sh'
            }
        }

        stage('Build-Docker-Image') {
            steps {
                sh 'docker build ss-driver-location-producer -f Dockerfile .'
            }
        }

        stage('Push-Docker-Image') {
            steps {
                script {
                    docker.withRegistry('https://557623108041.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:aws_creds') {
                        docker.image('ss-driver-location-producer').push()
                    }
                }
            }
        }
    }
}