pipeline {
    agent any
    
    tools {
        terraform 'jenkins-terraform'
    }
    environment {
        TF_HOME = tool('jenkins-terraform')
        TP_LOG = "WARN"
        PATH = "TF_HOME: $PATH"
        AWS_ACCESS_KEY_ID  = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
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
                
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSCerts',
                        // ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { 
                        //     sh 'terraform plan'
                        // }
                    sh 'terraform plan'
            }
        }
        stage ("terraform apply") {
            steps {
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSCerts',
                        // ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { 
                        //     sh 'terraform apply -auto-approve'
                        // }
                    sh 'terraform ${action} -auto-approve'
            }
        }
         stage ("terraform destroy") {
            steps {
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWSCerts',
                //         ACCESS_KEY: 'ACCESS_KEY', SECRET_KEY: 'SECRET_KEY']]) { 
                //             sh 'terraform destroy -auto-approve'
                //         }
                sh 'terraform ${action} -auto-approve'
            }
        }
    }
}
