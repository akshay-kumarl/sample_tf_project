pipeline {
    agent any
    stages {
        stage (git clone){
            sh ''
            echo 'cloned successfully'
        }
        stage(install terraform){
            sh 'sudo snap install terraform --classic'
            sh 'terraform -v'
        }
        stage(terraform initialize){
            sh 'terraform init'
        }
        stage(run instance){
            sh 'terraform apply --auto-approve'
        }
    }
}
