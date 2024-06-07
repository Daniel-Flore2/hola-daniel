pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'node-hello-world'
    }
    stages {
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
                    docker.image(DOCKER_IMAGE).inside('-u root') {
                        sh '''
                            mkdir -p /app/.npm
                            chown -R node:node /app/.npm
                        '''
                    }
                    docker.image(DOCKER_IMAGE).inside('-u node') {
                        sh '''
                            npm config set cache /app/.npm --global
                            npm install
                            npm test
                        '''
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
