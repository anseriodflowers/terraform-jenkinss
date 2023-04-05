pipeline {
    agent any
    
    tools {
        terraform 'jenkins-terraform'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                git branch: 'terraform-ec2', credentialsId: 'AWSCerts', url: 'https://github.com/anseriodflowers/terraform-jenkinss.git'
            }
        }
        stage ("terraform init") {
            steps {
                sh 'terraform init'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
            steps {
                
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSCerts',
                        ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { 
                            sh 'terraform plan'
                        }

            }
        }
        stage ("terraform apply") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSCerts',
                        ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { 
                            sh 'terraform ${action} -auto-approve'
                        }
            }
        }
        stage ("terraform destroy") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSCerts',
                        ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { 
                            sh 'terraform ${action} -auto-approve'
                        }
            }
        }
    }
}
