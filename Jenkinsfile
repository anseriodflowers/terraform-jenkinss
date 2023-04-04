pipeline {
    agent any
    
    tools {
        terraform 'jenkins-terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'terraform-delete', credentialsId: 'anserio-jenkins-test', url: 'https://github.com/anseriodflowers/terraform-jenkinss.git'
            }
        }
        stage ("terraform destroy") {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
