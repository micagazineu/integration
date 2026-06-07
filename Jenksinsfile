pipeline {

    agent {
        label 'linux'
    }

    stages {

        stage('Build') {
            steps {
                sh 'node index.js'
            }
        }

        stage('Testes') {
            steps {
                echo 'Executando testes'
            }
        }
    }
}