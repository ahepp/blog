pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                dockerfile {
                    args '-v ${WORKSPACE}:/ws'
                }
            }
            steps {
                sh 'bundle install'
                sh 'bundle exec jekyll build'
            }
        }
        stage('Deploy') {
            agent {
                dockerfile {
                    filename '.docker/deploy/Dockerfile'
                    args '-v ${WORKSPACE}:/ws'
                }
            }
            steps {
                withCredentials([sshUserPrivateKey(credentialsId : "${BLOG_DEPLOY_SSH_CREDS}", keyFileVariable : 'KEYFILE')]) {
                     sh 'rsync -av --delete -e "ssh -i $KEYFILE -o StrictHostKeyChecking=no" _site/ $BLOG_DEPLOY_SSH_DST/'
                }
            }
        }
    }
}
