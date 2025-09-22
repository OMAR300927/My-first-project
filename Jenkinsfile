pipeline {
    agent any
    stages{
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps{
                bat 'C:/Users/omsa3/AppData/Local/Programs/Python/Python313/python.exe -m pytest my-app/test_app.py'
            }
        }

        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'omarsa999',
                                usernameVariable: 'DOCKER_USER',
                                passwordVariable: 'DOCKER_PASS')]) {
                    bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS%'
                }
                bat 'docker build -t omarsa999/myfirstimage:latest .'
                bat 'docker push omarsa999/myfirstimage:latest'
            }
        }

        stage('Terraform plan'){
            steps{
                bat 'terraform init'
                bat 'terraform plan'
            }
        }

        stage('Terraform apply') {
            steps{
                bat 'terraform apply -auto-approve'
            }
        }

        stage('Deploy K8s cluster') {
            steps {
                withKubeConfig([credentialsId: 'Kubeconfig']) {
                /*bat 'echo %USERPROFILE%' //Ckeck the file location ( here we talk about kubeconfig )
                bat 'kubectl config current-context' //Check if Jenkins talk to the right cluster
                bat 'kubectl get nodes' //Show the nodes*/
                bat 'kubectl apply -f ./K8s/'
                }
            }
        }
    }
}
