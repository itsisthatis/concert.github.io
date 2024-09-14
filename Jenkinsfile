pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh './build.sh'
                sh 'git checkout -b main'
                sh 'git add .'
                sh 'git commit -m "Deploying to GitHub Pages"'
                sh 'git push origin main --force'
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
