pipeline {
    agent any
    environment {
        AWS_ACCOUNT_ID = "325196226102"
        REGION = "ap-south-1"
        REPO_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/python"
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_REGISTRY_CREDENTIALS = 'dockerauth'
        VERSION = 'latest'
    }
    stages {
        stage('Clone') {
            steps {
                script {
                    echo "Clone started"
                    gitInfo = checkout scm
                }
            }
        }

        stage('Docker build') {
            steps {
                script {
                    sh """
                        docker build -t python:${VERSION} .
                    """
                }
            }
        }

        stage('Image push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh """
                        docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}
                        docker tag python:${VERSION} richeb/python:${VERSION}
                        docker push richeb/python:${VERSION}
                        """
                    }
                }
            }
        }
    }
}
