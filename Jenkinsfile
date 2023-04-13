pipeline {
    agent any
    
    stages {
        stage('Terraform Init') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform_ci-cd init"
            }
        }
        
        stage('Terraform Plan') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform_ci-cd plan -lock=false"
            }
        }
        
        stage('Terraform Validate') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform_ci-cd validate"
            }
        }
        
        stage('Terraform Apply') {
            steps {
                sh "cd ~ && terraform -chdir=/terraform_ci-cd apply -auto-approve -lock=false"
            }
        }
        
        
    }
}
