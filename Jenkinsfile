pipeline {
    agent any
    tools {
        terraform 'terraform_1.9.6'  // Name from the Global Tool Configuration
    }
    stages {
        stage('Checkout') {
            steps {                
                // Checkout the repository using provided credentials
                git credentialsId: '02aa204b-1d28-4f7b-9aa1-14a71853f2b3', url: 'https://github.com/akshay-kumarl/sample_tf_project.git', branch: 'mainbranch'
            }
        }
        stage('install terraform'){
            steps{
            // sh 'snap install terraform --classic'
             sh 'terraform -v'
            //  sh '''
            //      sudo apt-get install wget -y
            //      wget https://releases.hashicorp.com/terraform/1.9.6/terraform_1.9.6_linux_amd64.zip
            //      unzip terraform_1.9.6_linux_amd64.zip
            //      sudo mv terraform /usr/local/bin/
            //    '''
          }
        }
        stage('terraform initialize'){
            steps{
            sh 'terraform init'
          }
        }
        stage('tf plan'){
          steps{
            sh 'terraform plan'
          }
        }
        stage('run instance'){
          steps{
            sh 'terraform apply --auto-approve'
          }
        }
    }
}
