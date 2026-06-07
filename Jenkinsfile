pipeline {
    agent any

    stages {
        stage('Instalar Dependências') {
            steps {
                dir('pgats-integra-o') {
                    sh 'npm install -g yarn'
                    sh 'yarn install --frozen-lockfile'
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

        stage('Simular Deploy') {
            steps {
                echo 'Simulando deploy no ambiente de staging...'
            }
        }
    }

    post {
        always {
            // Salva os relatórios de cobertura (Unit) e do Playwright (E2E) como artefatos no Jenkins
            archiveArtifacts artifacts: 'pgats-integra-o/reports/coverage/**', allowEmptyArchive: true
            archiveArtifacts artifacts: 'pgats-integra-o/playwright-report/**', allowEmptyArchive: true
            
            // Publica os relatórios de testes formatados no Jenkins (JUnit)
            junit allowEmptyResults: true, testResults: 'pgats-integra-o/results.xml'
        }
    }
}
