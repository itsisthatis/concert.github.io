pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building...'
                sh 'chmod +x ./build.sh'
                sh './build.sh'
                sh 'git config --global user.email "shnkvp@gmail.com"'
                sh 'git config --global user.name "Shankar V P"'
                // Clean any untracked files
                sh 'git clean -fd'
            }
        }

        stage('Sync with Remote Branch') {
            steps {
                echo 'Syncing with the remote branch...'

                // Pull the changes from the remote branch and merge
                sh 'git pull origin my-new-branch'
            }
        }

        stage('Commit and Push') {
            steps {
                echo 'Committing changes and pushing to remote...'
                // Add any new files or changes
                sh 'git add .'
                sh 'git commit -m "Deploying to GitHub Pages"'
                sh 'git push origin my-new-branch'
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
