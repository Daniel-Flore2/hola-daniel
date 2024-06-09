pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'node-hello-world'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Limpiar Contenedores') {
            steps {
                script {
                    def containers = sh(script: 'docker ps -q', returnStdout: true).trim()
                    if (containers) {
                        sh "docker stop ${containers}"
                    } else {
                        echo "No hay contenedores en ejecución para detener"
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run('-d -p 3000:3000')
                }
            }
        }
    }
}
