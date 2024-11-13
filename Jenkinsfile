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
                sh 'git add .'
                sh 'git commit -m "Deploying to GitHub Pages"'
                sh 'git push origin main --force'
                sh 'git stash pop || echo "No stashed changes to pop"'
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
