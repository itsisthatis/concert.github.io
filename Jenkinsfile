pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'chmod +x ./build.sh'
                sh './build.sh'
                sh 'git config --global user.email "shnkvp@gmail.com"'
                sh 'git config --global user.name "Shankar V P"'
                // Commit any local changes before checkout
                sh """
                    git add .
                    git commit -m "Save changes before switching branches"
                """
                sh 'git checkout my-new-branch'
                sh 'git fetch origin my-new-branch'
                // Merge the changes from the remote branch
                sh 'git merge origin/my-new-branch --no-edit || true'  // --no-edit to skip merge commit editing
                sh 'git status'
                sh 'git add .'
                sh 'git commit -m "Deploying to GitHub Pages"'
                sh 'git push origin my-new-branch --force'
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
