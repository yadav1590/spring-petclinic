pipeline {
    agent {label 'Linux_Based'}
    tools {
        jdk "java8"
    }
    stages {
        stage('Cleanup') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                cleanWs()
            }
        }
        stage('Source') { // Get code
            steps {
                // get code from our Git repository
                git 'https://github.com/yadav1590/spring-petclinic.git'
            }
        }
        stage('Compile') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "./mvnw compile"
            }
        }
        stage('Test') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "./mvnw test"
            }
        }
        stage('Package') { // Compile and do unit testing
            steps {
                // run Gradle to execute compile and unit testing
                sh "./mvnw package"
            }
        }
    }
    post {
         failure {
             echo "Build failed"
         }
         success {
             echo "Build Success"
         }
    }
}
