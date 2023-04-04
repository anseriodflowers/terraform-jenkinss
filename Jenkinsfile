pipeline {
    agent any
    
    tools {
        terraform 'jenkins-terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'terraform-e2c', credentialsId: '', url: 'https://github.com/anseriodflowers/terraform-jenkinss.git'
            }
        }
        stage ("terraform destroy") {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
