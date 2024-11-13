pipeline {
    agent any
    environment {
        DOCKER_CONTAINER = 'nginx-server'  // Name of your Nginx Docker container
        WEBSITE_DIR = '/var/jenkins_home/jenkins_build_output/website'  // Nginx serving directory
        BUILD_DIR = 'build'  // The local directory where the website files are built
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh './build.sh'
                sh 'git config --global user.email "shnkvp@gmail.com"'
                sh 'git config --global user.name "Shankar V P"'
                sh 'git checkout main'
                sh 'git status'
                script{
                def status = sh(script: 'git status --porcelain', returnStdout: true).trim()
                if (status) {
                    sh 'git add -A'
                    sh 'git commit -m "Deploying to GitHub Pages"'
                    sh 'git push origin main --force'
                }
                else {
                        echo 'No changes to commit.'
                }
                }
                sh 'mkdir -p ~/jenkins-docker/website'
                sh 'cp -R ./build/* ~/jenkins-docker/website/'
                sh "docker exec -it ${DOCKER_CONTAINER} mkdir -p ${WEBSITE_DIR}"
                sh "docker cp ~/jenkins-docker/website/. ${DOCKER_CONTAINER}:${WEBSITE_DIR}/"
                sh "docker exec -it ${DOCKER_CONTAINER} nginx -s reload"
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
