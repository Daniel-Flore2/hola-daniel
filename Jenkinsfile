pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node-hello-world'
    }

    stages {
        stage('Build') {
            steps {
                echo "Starting Build Stage"
                script {
                    docker.build(DOCKER_IMAGE)
                }
                echo "Build Stage Completed"
            }
        }
        stage('Test') {
            steps {
                echo "Starting Test Stage"
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm config set cache /app/.npm --global'
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
                echo "Test Stage Completed"
            }
        }
        stage('Deploy') {
            steps {
                echo "Starting Deploy Stage"
                script {
                    docker.image(DOCKER_IMAGE).run('-d -p 3001:3001')
                }
                echo "Deploy Stage Completed"
            }
        }
    }
}
