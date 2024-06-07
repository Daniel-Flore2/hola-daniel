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
                            # Crear el directorio con permisos root
                            mkdir -p /app/.npm
                            chown -R node:node /app/.npm
                        '''
                        sh '''
                            # Cambiar al usuario node
                            su node -c "
                            npm config set cache /app/.npm --global && 
                            npm install && 
                            npm test
                            "
                        '''
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run('-d -p 3001:3000')
                }
            }
        }
    }
}
