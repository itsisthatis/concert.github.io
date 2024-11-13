pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'chmod +x ./build.sh'
                sh './build.sh'
                
                // Set Git user info
                sh 'git config --global user.email "shnkvp@gmail.com"'
                sh 'git config --global user.name "Shankar V P"'
                
                // Commit any local changes before checkout
                script {
                    def commitMessage = "Save changes before switching branches"
                    def changesExist = sh(script: "git status --porcelain", returnStdout: true).trim()
                    if (changesExist) {
                        sh "git add ."
                        sh "git commit -m '${commitMessage}'"
                    } else {
                        echo "No changes to commit before switching branches."
                    }
                }

                // Checkout or create the branch
                sh 'git fetch origin'
                sh 'git checkout my-new-branch || git checkout -b my-new-branch origin/my-new-branch'

                // Merge the changes from the remote branch (if necessary)
                sh 'git merge origin/my-new-branch --no-edit'

                // Commit after merge only if there are changes
                script {
                    def changesAfterMerge = sh(script: "git status --porcelain", returnStdout: true).trim()
                    if (changesAfterMerge) {
                        sh "git add ."
                        sh 'git commit -m "Deploying to GitHub Pages"'
                    } else {
                        echo "No changes to commit after merge."
                    }
                }

                // Push to remote
                sh 'git push origin my-new-branch --force-with-lease'
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
