pipeline {
    agent any
    
    stages {
        stage('Terraform Init') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform-EC2 init"
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform-EC2 plan -lock=false"
            }
        }
        
        stage('Terraform Validate') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform-EC2 validate"
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform-EC2 apply -auto-approve -lock=false"
            }
        }
        
        
    }
}
