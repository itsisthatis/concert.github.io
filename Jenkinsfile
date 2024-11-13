pipeline {
    agent any

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
                sh 'mkdir -p /var/jenkins_home/jenkins_build_output/website'
                sh 'cp -R ./build/* /var/jenkins_home/jenkins_build_output/website/'
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
