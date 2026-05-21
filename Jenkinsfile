pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                // Task 3: Pulls code from the dev branch
                git url: 'https://github.com/Viral1702/sample-node-project.git', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Task 2 & 3: Build the image
                sh 'docker build -t sample-node-app:dev .'
            }
        }

        stage('Deploy / Run Container') {
            steps {
                // Stop and remove the old container if it exists, then run the new one
                sh '''
                docker stop sample-node-container || true
                docker rm sample-node-container || true
                docker run -d -p 3000:3000 --name sample-node-container sample-node-app:dev
                '''
            }
        }
    }
}