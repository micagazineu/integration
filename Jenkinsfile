pipeline {
    agent {
        label 'linux'
    }

    stages {
        stage('Instalar Dependências') {
            steps {
                dir('pgats-integra-o') {
                    sh 'npm install -g yarn'
                    sh 'yarn install'
                }
            }
        }

        stage('Linter e Inspeção') {
            steps {
                dir('pgats-integra-o') {
                    sh 'yarn run lint'
                }
            }
        }

        stage('Testes Unitários') {
            steps {
                dir('pgats-integra-o') {
                    sh 'yarn run test'
                }
            }
        }

        stage('Testes E2E (Playwright)') {
            steps {
                dir('pgats-integra-o') {
                    sh 'yarn playwright install'
                    sh 'yarn run e2e'
                }
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'pgats-integra-o/playwright-report/**', allowEmptyArchive: true
        }
    }
}
