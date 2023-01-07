pipeline {
    agent {
        dockerfile {
            args '-v ${WORKSPACE}:/ws'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'bundle install'
                sh 'bundle exec jekyll build'
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId : "${BLOG_DEPLOY_SSH_CREDS}", keyFileVariable : 'KEYFILE')]) {
                     sh 'rsync -av --delete -e "ssh -i $KEYFILE -o StrictHostKeyChecking=no" _site/ $BLOG_DEPLOY_SSH_DST/'
                }
            }
        }
    }
}
