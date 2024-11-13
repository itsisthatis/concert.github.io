pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh './build.sh'
                sh 'git config --global user.email "shnkvp@gmail.com"'
                sh 'git config --global user.name "Shankar V P"'
                sh 'git stash push --include-untracked'
                sh 'git checkout main'
                sh 'git stash pop || echo "No stash to pop"'
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
