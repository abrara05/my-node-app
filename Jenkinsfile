pipeline {
    agent any

    environment {
        IMAGE_NAME = "abrara05/my-node-app"
        TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/abrara05/my-node-app.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "No tests yet. Skipping..."'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "echo $PASSWORD | docker login -u $USERNAME --password-stdin"
                    sh "docker push $IMAGE_NAME:$TAG"
                }
            }
        }

        stage('Deploy on EC2') {
            steps {
                sh "docker run -d -p 3000:3000 $IMAGE_NAME:$TAG"
            }
        }
    }
}


