pipeline {
    agent any
    environment {
        IMAGE = 'pravalikaa18/my-python-app:latest'
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker push $IMAGE'
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                withCredentials([file(credentialsId: 'Kubeconfig', variable: 'KUBECONFIG_FILE')]) {
                    sh '''
                    export KUBECONFIG=$KUBECONFIG_FILE
                    kubectl apply -f k8s-deployment.yaml
                    '''
                }
        }
    }
}
