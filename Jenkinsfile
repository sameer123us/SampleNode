    pipeline {
        agent any     // In this case windows local

    environment {                     // for reusability and clean code 
        IMAGE_NAME = "my-node-app2"
        CONTAINER_NAME = "node-app-container2"
        PORT = "3000"
    }

    stages {              // contains all phases of CI-CD pipeline

        stage('Pull Code') {     
            steps {
                git(                        // provided by git plugins 
                branch: 'dev',
                url: 'https://github.com/harshitmishra25/sample-node-project'
                )
            }   
        }

        stage('Build Docker Image') {
            steps {                                    // image
                bat 'docker build -t %IMAGE_NAME% .' 
            }
        }

        stage('Stop & Remove Old Container') {   
            steps {
                bat ''' 
                   docker stop %CONTAINER_NAME% || exit 0
                   docker rm %CONTAINER_NAME% || exit 0
                '''
            }
        }

        stage('Run Docker Container') {
            steps {                              // container
                bat '''
                    docker run -d -p %PORT%:%PORT% --name %CONTAINER_NAME% %IMAGE_NAME%  
                '''
            }
        }
    }

    post {                             // runs after pipeline finishes(success/failure)
        success {
            echo "Pipeline completed successfully"
        }
        failure {
            echo "Pipeline failed"
        }
    }
}