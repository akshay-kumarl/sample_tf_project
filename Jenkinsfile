pipeline {
    agent any

    tools {
        terraform 'terraform_1.9.6'  // Name from the Global Tool Configuration
    }

     environment {
        AWS_CREDENTIALS_ID = 'dc1d13ce-5c4b-4b96-971b-f66424ecd16d'   // ID of the AWS credentials stored in Jenkins
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
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]){
            sh 'terraform init'
          }
         }
        }

        stage('tf plan'){
          steps{
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]){
            sh 'terraform plan -out=tfplan'
          }
        }
        }

        stage('run instance'){
          steps{
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: AWS_CREDENTIALS_ID]]){
               echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
            }
          }
        }
   }
}

